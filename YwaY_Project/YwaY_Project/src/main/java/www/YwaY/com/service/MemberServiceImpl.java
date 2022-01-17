package www.YwaY.com.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import www.YwaY.com.bean.Member;
import www.YwaY.com.dao.IMemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private IMemberDao mDao;// IMemberDao의 구현체;

	// 비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(Member mb, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = "ywaygg";
		String hostSMTPpwd = "qwerasdfzxcvQ@1213";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "ywaygg@gmail.com";
		String fromName = "YwaY";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "YwaY 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += mb.getMemberid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += mb.getMemberpw() + "</p></div>";

			// 받는 사람 E-Mail 주소
			String mail = mb.getEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(465); // 네이버 이용시 587

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
	}

	// 비밀번호찾기
	@Override
	public void findPw(Member mb, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		Member member = mDao.readMember(mb.getMemberid()); // id를 가지고 db에서 mb 정보 가져오고
		System.out.println("member=" + member);
		PrintWriter out = response.getWriter();
		System.out.println("out=" + out);
		// 가입된 아이디가 없으면
		// if (mDao.idCheck(mb.getMemberid()) == null) { // 입력한 id가 db에 있는지 체크
		if (mDao.idCheck(mb.getMemberid()) == null) { // 입력한 id가 db에 있는지 체크
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!mb.getEmail().equals(member.getEmail())) { // 입력한 이메일과 (입력한 아이디의 db에 있는 이메일)과 같은지 체크
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			mb.setMemberpw(pw); // 매개변수로 가져온 mb에 임시 비밀번호를 저장
			// 비밀번호 변경 메일 발송
			sendEmail(mb, "findpw");
			// 비밀번호 변경
			mb.setMemberpw(pwdEncoder.encode(mb.getMemberpw()));
			mDao.updatePw(mb); // 매개변수인 mb를 db에 업데이트

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	// 아이디 찾기
	@Override
	public void findId(Member mb, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		List<Member> member = null;
		member = (mDao.readSummonername(mb.getSummonername(), mb.getIdhint(), mb.getIdanswer())); // id를 가지고 db에서 mb 정보 가져오고
		System.out.println("member:"+member);
		PrintWriter out = response.getWriter();
		System.out.println("out:"+out);
		// 가입된 소환사이름이 없으면
		// if (mDao.idCheck(mb.getMemberid()) == null) { // 입력한 id가 db에 있는지 체크
		if (member.isEmpty()) { // 입력한 소환사이름이 db에 있는지 체크
			out.print("등록되지 않은 정보 입니다.");
			out.close();
		}
		for(int i=0; i<member.size(); i++) {
			out.print("아이디:"+member.get(i).getMemberid());
			out.close();
		}
	}
}

