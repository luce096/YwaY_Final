package www.YwaY.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import www.YwaY.com.bean.Champ;
import www.YwaY.com.service.ChampMM;
import www.YwaY.com.service.ChampTipMM;

@Controller		//@ResponseBody 생략가능
public class ChampController {
	// private static final Logger logger =
	// LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ChampMM cm;
	@Autowired
	private ChampTipMM ctm;

	ModelAndView mav;

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/champ", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView allchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getAllChampInfo(cp);
		return mav;
	}

	// 챔피언 분석정보 페이지
	@RequestMapping(value = "/champinfo", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView champInfo(Champ cp, HttpServletRequest req) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은
		// 역할을 함
		String query = req.getQueryString();
		String[] pair = query.split("&");
		String[] cham = pair[0].split("=");
		String[] lan = pair[1].split("=");
		String ch = cham[1];
		String lane = lan[1];
		mav = cm.getChampInfo(cp, ch, lane);
		return mav;
	}

	// 챔피언 분석정보 페이지 폼
	@RequestMapping(value = "/champinfo") // GET,POST 둘다 받음
	public String champInfo() {
		return "Champ/champInfo";
	}

	// champTip
	@RequestMapping(value = "/contents") // @Request를 쓰면 get, post 모두 가능
	public ModelAndView getChampTiplist(Champ cp, HttpSession session) { // int 놓으면 파라미터 하나를 무조건 넘겨야 해서 에러뜸 integer로 놓으면
																			// 안넘기면 null로 넘어감
		mav = ctm.getChampTiplist(cp, session); // bean에 있는 페이지넘버 정보를 mav에 담는다
		// redirect는 get으로만 포워딩한다.
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/all", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView all_champ(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getAllChamInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/top", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView topchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getTopChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/mid", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView midchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getMidChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/jungle", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView junglechamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getJungleChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/support", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView supchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getSupChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/bottom", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView botchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getBotChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/top_pick", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView top_pickchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getTopPickChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/mid_pick", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView mid_pickchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getMidPickChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/jungle_pick", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView jungle_pickchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getJunglePickChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/sup_pick", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView sup_pickchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getSupPickChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/bot_pick", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView bot_pickcham(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getBotPickChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/top_ban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView top_banchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getTopBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/mid_ban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView mid_banchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getMidBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/jungle_ban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView jungle_banchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getJungleBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/sup_ban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView sup_banchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getSupBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/bot_ban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView bot_bancham(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getBotBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/top_pickban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView top_pickbanchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getTopPickBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/mid_pickban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView mid_pickbanchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getMidPickBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/jungle_pickban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView jungle_pickbanchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getJunglePickBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/sup_pickban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView sup_pickbanchamp(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getSupPickBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/bot_pickban", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView bot_pickbancham(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getBotPickBanChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/top_home", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView top_home(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getTopPickHomeChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/mid_home", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView mid_home(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getMidPickHomeChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/jungle_home", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView jungle_home(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getJunglePickHomeChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/sup_home", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView sup_home(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getSupPickHomeChampInfo(cp);
		return mav;
	}

	// 챔피언 분석 페이지 이동후 실행될 함수
	@RequestMapping(value = "/bot_home", method = RequestMethod.GET) // 아무것도 안쓰면 GET,POST 다 받음
	public ModelAndView bot_home(Champ cp) { // @ModelAttribute("mb") 이거 한줄로 해도 되지만 밑에 풀어쓴게 같은 역할을 함
		mav = cm.getBotPickHomeChampInfo(cp);
		return mav;
	}
}
