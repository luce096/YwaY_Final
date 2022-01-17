package www.YwaY.com.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.YwaY.com.bean.Blacklist;
import www.YwaY.com.bean.Member;
import www.YwaY.com.exception.DbException;
import www.YwaY.com.service.MemberMM;
import www.YwaY.com.service.MemberServiceImpl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberMM mm;
	@Autowired
	private MemberServiceImpl service;

	ModelAndView mav;

	// 전체회원 등급관리
	@RequestMapping(value = "/userupdate", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView getuserupdateinfo(Member mb) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = mm.getuserupdateinfo(mb);
		return mav;
	}

	// 회원등급 관리자로 올리기
	@RequestMapping(value = "/usergradeup", method = RequestMethod.POST) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView usergradeup(String memberid) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = mm.usergradeup(memberid);
		return mav;
	}

	// 로그인 폼
	@RequestMapping(value = "/loginfrm")
	public String loginFrm() {
		// logger.info("로그인 화면");
		return "Member/loginFrm";
	}

	@PostMapping(value = "/access")
	public ModelAndView access(Member mb, HttpSession session) {
		mav = mm.access(mb, session);
		return mav; // .jsp }
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home"; // get,post --> get 방식으로만 /home으로
		// 하고싶으면 위에 /home으로 하나를 더 만들어 줘야함
	}
	// 찾기
	@RequestMapping(value = "/findinfo", method = RequestMethod.GET)
	public String findInfo() {
		return "Member/findInfo";
	}

	// 회원가입 폼
	@RequestMapping(value = "/joinfrm") // GET,POST 둘다 받음
	public String joinFrm() {
		logger.info("회원가입창으로 이동");
		return "Member/joinFrm";
	}

	// 내정보창
	@RequestMapping(value = "/mypage") // GET,POST 둘다 받음
	public String mypage() {
		logger.info("내정보창으로 이동");
		return "Member/myPage";
	}

	// 회원정보수정 폼
	@RequestMapping(value = "/mModify") // GET,POST 둘다 받음
	public String mModify() {
		return "Member/mModify";
	}

	// 회원가입
	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView memberJoin(Member mb) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		logger.info("회원가입");
		mav = mm.memberJoin(mb);
		return mav;
	}

	// 회원정보수정
	@RequestMapping(value = "/mModify", method = RequestMethod.POST) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView mModify(Member mb, HttpSession session) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을
																	// 함
		mav = mm.memberModify(mb, session);
		return mav;
	}

	// 아이디 찾기
	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public void findId(@ModelAttribute Member mb, HttpServletResponse response) throws Exception {
		service.findId(mb, response);
	}

	/* 비밀번호 찾기 */
	@RequestMapping(value = "/findpw", method = RequestMethod.GET)
	public void findPwGET() throws Exception {
	}

	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute Member mb, HttpServletResponse response) throws Exception {
		service.findPw(mb, response);
		System.out.println("mb:" + mb);
	}

	// 블랙리스트
	@RequestMapping(value = "/blacklist") // GET,POST 둘다 받음
	public String blacklist() {
		logger.info("블랙리스트관리창으로 이동");
		return "Member/blacklist";
	}

	// 회원등급
	@RequestMapping(value = "/userupdate") // GET,POST 둘다 받음
	public String userupdate() {
		logger.info("회원등급관리창으로 이동");
		return "Member/userupdate";
	}

	// 블랙리스트유저관리
	@RequestMapping(value = "/blacklist", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView blacklist(Blacklist bl) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = mm.getBlacklist(bl);
		return mav;
	}

	// 블랙리스트유저계정삭제
	@PostMapping(value = "/userdelete") // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView userdelete(String r_id, RedirectAttributes attr) throws DbException {// @ModelAttribute("mb") 이거
																								// 한줄로 해도 되지만 밑에 풀어쓴게 같은
																								// 역할을 함
		mav = mm.userdelete(r_id, attr);
		return mav;
	}

	// 블랙리스트유저 로그인정지시키기
	@RequestMapping(value = "/loginblock") // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView loginblock(String r_id, String nextDayString) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게
																		// 같은 역할을 함
		mav = mm.loginblock(r_id, nextDayString);
		return mav;
	}
}
