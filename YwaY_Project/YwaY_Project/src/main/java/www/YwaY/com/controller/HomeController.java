package www.YwaY.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.YwaY.com.bean.Blacklist;
import www.YwaY.com.bean.Champ;
import www.YwaY.com.bean.ChampWin;
import www.YwaY.com.bean.Member;
import www.YwaY.com.exception.DbException;
import www.YwaY.com.service.ChampMM;
import www.YwaY.com.service.ChampTipMM;
import www.YwaY.com.service.MemberMM;
import www.YwaY.com.service.MemberServiceImpl;

@Controller
public class HomeController { // 회원관리 컨트롤

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired // 필드 의존성 주입(DI)
	private MemberMM mm; // ==>DAO==>스프링 DI 가기위해
	
	ModelAndView mav;
	// home
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	// home
	@RequestMapping(value = "/YwaY")
	public String home2() {
		return "home";
	}
	//Skincup
	@RequestMapping(value = "/SkincupHome")
	public String SkincupHome() {
		return "SkincupHome";
	}
	//Skincup
	@RequestMapping(value = "/Skincup")
	public String Skincup() {
		return "Skincup";
	}
	//ingame
	@RequestMapping(value = "/ingame")
	public String ingame() {
		return "ingame";
	}
	// 팀리스트
	@RequestMapping(value = "/TeamList")
	public String TeamList() {
		// logger.info("로그인 화면");
		return "TeamList";
	}
	// 멀티서치 폼
	@RequestMapping(value = "/multisearch") // GET,POST 둘다 받음
	public String multisearch() {
		logger.info("멀티서치창으로 이동");
		return "multisearch";
	}
	// 테스트매치 폼
	@RequestMapping(value = "/testmatch") // GET,POST 둘다 받음
	public String testmatch() {
		logger.info("테스트창으로 이동");
		return "testmatch";
	}
	

	

	

}