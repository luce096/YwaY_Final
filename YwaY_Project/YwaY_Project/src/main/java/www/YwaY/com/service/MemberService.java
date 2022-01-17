package www.YwaY.com.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import www.YwaY.com.bean.Member;

@Service
public interface MemberService {
	
	//이메일발송
	public void sendEmail(Member mb, String div) throws Exception;

	//비밀번호찾기
	public void findPw(Member mb, HttpServletResponse response) throws Exception;
	
	//아이디찾기
	public void findId(Member mb, HttpServletResponse response) throws IOException;

}