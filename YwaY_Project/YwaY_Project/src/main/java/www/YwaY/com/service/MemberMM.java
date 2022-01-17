package www.YwaY.com.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.YwaY.com.bean.Blacklist;
import www.YwaY.com.bean.Champ;
import www.YwaY.com.bean.ChampTip;
import www.YwaY.com.bean.Member;
import www.YwaY.com.dao.IChampTipDao;
import www.YwaY.com.dao.IMemberDao;
import www.YwaY.com.exception.DbException;

//회원관리 서비스 
@Service // @Component

public class MemberMM {
	private static final Logger logger = LoggerFactory.getLogger(MemberMM.class);

	@Autowired
	private IMemberDao mDao;// IMemberDao의 구현체;
	ModelAndView mav;

	public ModelAndView memberJoin(Member mb) {
		mav = new ModelAndView();
		String view = null;
		// Encoder(암호화)<----> Decoder(복호화)
		// 스프링은 암호화는 복호화 불가능
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		// 시간상 비번만 암호화 하겠슴
		mb.setMemberpw(pwdEncoder.encode(mb.getMemberpw())); // 1111->dkjfldkjflksdjflkasdjlf
		if (mDao.memberJoin(mb)) {
			view = "home"; // 성공시 로그인
			mav.addObject("check", 1); // 회원가입 성공
		} else {
			view = "Member/joinFrm";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView memberModify(Member mb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		// Encoder(암호화)<----> Decoder(복호화)
		// 스프링은 암호화는 복호화 불가능
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		// 시간상 비번만 암호화 하겠슴
		String encodedPwd = mDao.getSecurityPwd(mb.getMemberid());
		mb.setMemberpw(pwdEncoder.encode(mb.getMemberpw())); // 1111->dkjfldkjflksdjflkasdjlf
		if (encodedPwd != null) {
			try {
				mDao.mModify(mb);
				mb = mDao.getIdInfo(mb.getMemberid()); //
				session.setAttribute("mb", mb);// 로그인 되
			} catch (Exception e) {
				e.printStackTrace();
			}
			view = "home"; // 성공시 로그인
			mav.addObject("check", 1); // 회원가입 성공
		} else {
			view = "Member/myPage";
		}
		mav.setViewName(view);
		return mav;
	}

	// 로그인
	@ResponseBody
	public ModelAndView access(Member mb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		// 스프링은 복호화 안되지만 비교는 해줌. //암호화<--->복호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String encodedPwd = mDao.getSecurityPwd(mb.getMemberid()); // 1111-->$2a$10$M/boV.EJkuwZHD0LMX0BHuGr8vT6zK0Ua9fxcO5MgFcL9gSupHfLm
		Member re = null;
		re = mDao.getreportinfo(mb.getMemberid());
		// System.out.println("로그인시도한아이디"+re);
		// System.out.println("이거뭔지보여줘"+re.getA_date());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd");
		LocalDate now = LocalDate.now();
		String todayString = now.format(formatter);
		System.out.println("오늘날짜=" + todayString);
		System.out.println("encodedPwd:" + encodedPwd);
		if (encodedPwd != null) { // 아이디 존재
			if (pwdEncoder.matches(mb.getMemberpw(), encodedPwd)) {
				if (re.getA_date() == null || todayString.equals(re.getA_date())) {
					mDao.deladate(mb.getMemberid());
					logger.info("로그인 성공");
					// 로그인 성공 마킹
					session.setAttribute("memberid", mb.getMemberid());
					System.out.println("memberid:" + mb);
					mb = mDao.getIdInfo(mb.getMemberid()); //
					session.setAttribute("mb", mb);// 로그인 되어있는 동안 회원정보를 화면 출력
					session.setAttribute("grade", re.getGrade());
					session.setAttribute("userblacklist", makeHtmluserbalcklist(session)); // 관리자계정으로 블랙리스트관리
					view = "redirect:/"; // post,get--->get으로만 redirect
					// view="forward:/boardlist"; //post->post, get-get으로만 forward
				} else { // 정지당한아이디
					mav.addObject("check2", re.getA_date());
					view = "Member/loginFrm";
				}
			} else { // 비번 불일치
				view = "Member/loginFrm";
				mav.addObject("check", 2); // request영역에 저장
				System.out.println("비밀번호가 틀렸습니다.");
			}
		} else {// 아이디 불일치
			view = "Member/loginFrm";
			mav.addObject("check", 3); // 1: 회원가입성공, 2: 실패
			System.out.println("아이디가 틀렸습니다.");
		}
		mav.setViewName(view);
		return mav;

	}

	// 관리자 계정으로 블랙리스트 관리할수있는 버튼 생성,회원등급 관리할수있는 버튼생성
	private String makeHtmluserbalcklist(HttpSession session) {
		StringBuilder sb = new StringBuilder();
		// 현재 로그인한 사람의 아이디
		// HttpSession session=request.getSession();
		String id = session.getAttribute("grade").toString();
		if (id.equals("관리자")) { // 관리자라면
			sb.append("<li class=\"nav-item\"><a class=\"nav-link\" href=\"blacklist\">");
			sb.append("<i class=\"fas fa-chalkboard-teacher\"></i><span>블랙리스트관리</span></a></li>");
			sb.append("<li class=\"nav-item\"><a class=\"nav-link\" href=\"userupdate\">");
			sb.append("<i class=\"fas fa-chalkboard-teacher\"></i><span>회원등급관리</span></a></li>");

		}
		return sb.toString();
	}

	public boolean idAvailable(String memberid) {
		Member mb = mDao.getIdInfo(memberid);
		if (mb == null)
			return true; // 사용가능하면
		return false; // 불가
	}

	public boolean summonernameAvailable(String summonername) {
		Member mb = mDao.getSummonernameInfo(summonername);
		if (mb == null)
			return true; // 사용가능하면
		return false; // 불가
	}

//블랙리스트 관리 페이지(블랙리스트 출력)
	public ModelAndView getBlacklist(Blacklist bl) {
		mav = new ModelAndView();
		String view = null;
		StringBuilder sb = new StringBuilder();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd");
		LocalDate now = LocalDate.now();
		LocalDate nextDay = now.plusDays(7);
		System.out.println("nextDay=" + nextDay);
		String nextDayString = nextDay.format(formatter);
		List<Blacklist> blList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기
		blList = mDao.getBlacklist(bl);
		System.out.println("블랙리스트정보" + blList);
		if (!blList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("blList", blList);
			mav.addObject("nextDayString", nextDayString);
			System.out.println("nextdayString=" + nextDayString);
			view = "Member/blacklist"; // jsp
		} else {
			view = "home";
			// mav.addObject("check",1);
		}
		mav.setViewName(view);
		return mav;

	}

	@Transactional
	public ModelAndView userdelete(String r_id, RedirectAttributes attr) throws DbException {
		mav = new ModelAndView();
		String view = null;
		// 댓글여부
		List<Blacklist> tList = mDao.getTipList(r_id);
		System.out.println("tList" + tList);
		boolean b, m, r;
		b = m = r = true;
		if (tList.size() != 0) {
			b = mDao.gDelete(r_id); // 댓글삭제
		}
		System.out.println("b=" + b);
		List<Blacklist> bList = mDao.getblackl(r_id);
		if (bList.size() != 0) {
			// String r_i = "tq";
			m = mDao.blacklistdelete(r_id); // 블랙리스트삭제
		}
		System.out.println("m=" + m);
		r = mDao.userdelete(r_id);
		System.out.println("r=" + r);
		if (b && m && r) {
			if (b) {
				tList = null; // 웹서버에서 파일 삭제
			}
			attr.addFlashAttribute("r_id", r_id); // session저장하여 1번만 사용후 삭제됨
			// attr.addAttribute("bNum",bNum); //request객체에 저장하여 여러번 사용가능
			System.out.println("삭제트랜잭션 성공");
		} else {
			System.out.println("삭제트랜잭션 실패");
			throw new DbException(); // 예외 발생--->Rollback
		}
		mav.setViewName("redirect:/blacklist"); // 기존객체(영역)삭제후--> 새로운 request생성

		return mav;
	}

	public ModelAndView loginblock(String r_id, String nextDayString) {
		mav = new ModelAndView();
		String view = null;
		if (mDao.loginblock(r_id, nextDayString)) {
			view = "home";
		} else {
			view = "Member/blacklist";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView getuserupdateinfo(Member mb) {
		mav = new ModelAndView();
		String view = null;
		List<Member> mblList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기
		mblList = mDao.getuserupdateinfo(mb);
		System.out.println("블랙리스트정보" + mblList);
		if (!mblList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("mblList", mblList);
			view = "Member/userupdate"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;

	}

	public ModelAndView usergradeup(String memberid) {
		mav = new ModelAndView();
		String view = null;
		if (mDao.usergradeup(memberid)) {
			view = "home";
			// mav.addObject("check2",2);//회원등급 업데이트 성공
		} else {
			view = "Member/userupdate";
		}
		mav.setViewName(view);
		return mav;

	}

}