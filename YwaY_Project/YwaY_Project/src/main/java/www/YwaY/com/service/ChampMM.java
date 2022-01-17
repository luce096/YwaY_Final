package www.YwaY.com.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import www.YwaY.com.bean.Champ;
import www.YwaY.com.bean.ChampItem;
import www.YwaY.com.bean.ChampRune;
import www.YwaY.com.bean.ChampSpell;
import www.YwaY.com.bean.ChampWin;
import www.YwaY.com.dao.IChampDao;

@Service
public class ChampMM {

	@Autowired
	private IChampDao cpDao;
	
	ModelAndView mav;

	
	public ModelAndView getAllChampInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpAllList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpAllList = cpDao.getAllChampInfo(cp);
		System.out.println(cpAllList);
		// System.out.println("bList="+bList);
		if (!cpAllList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpAllList", cpAllList);
			view = "Champ/champ"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getAllChamInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpAllList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpAllList = cpDao.getAllChampInfo(cp);
		System.out.println(cpAllList);
		// System.out.println("bList="+bList);
		if (!cpAllList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpAllList", cpAllList);
			view = "Champ/all"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getTopChampInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpTopList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpTopList = cpDao.getTopChampInfo(cp);
		System.out.println(cpTopList);
		// System.out.println("bList="+bList);
		if (!cpTopList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpTopList", cpTopList);
			view = "Champ/top"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getMidChampInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpMidList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpMidList = cpDao.getMidChampInfo(cp);
		System.out.println(cpMidList);
		// System.out.println("bList="+bList);
		if (!cpMidList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpMidList", cpMidList);
			view = "Champ/mid"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getJungleChampInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpJungleList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpJungleList = cpDao.getJungleChampInfo(cp);
		System.out.println(cpJungleList);
		// System.out.println("bList="+bList);
		if (!cpJungleList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpJungleList", cpJungleList);
			view = "Champ/jungle"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getSupChampInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpSupList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpSupList = cpDao.getSupChampInfo(cp);
		System.out.println(cpSupList);
		// System.out.println("bList="+bList);
		if (!cpSupList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpSupList", cpSupList);
			view = "Champ/support"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getBotChampInfo(Champ cp) {		//넘길 페이지 번호를 인자로 담는다
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpBotList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpBotList = cpDao.getBotChampInfo(cp);
		System.out.println(cpBotList);
		// System.out.println("bList="+bList);
		if (!cpBotList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpBotList", cpBotList);
			view = "Champ/bottom"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView getTopPickChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpTopPickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpTopPickList = cpDao.getTopPickChampInfo(cp);
		System.out.println(cpTopPickList);
		// System.out.println("bList="+bList);
		if (!cpTopPickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpTopPickList", cpTopPickList);
			view = "Champ/top_pick"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getSupPickChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpSupPickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpSupPickList = cpDao.getSupPickChampInfo(cp);
		System.out.println(cpSupPickList);
		// System.out.println("bList="+bList);
		if (!cpSupPickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpSupPickList", cpSupPickList);
			view = "Champ/sup_pick"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getJunglePickChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpJunglePickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpJunglePickList = cpDao.getJunglePickChampInfo(cp);
		System.out.println(cpJunglePickList);
		// System.out.println("bList="+bList);
		if (!cpJunglePickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpJunglePickList", cpJunglePickList);
			view = "Champ/jungle_pick"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getMidPickChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpMidPickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpMidPickList = cpDao.getMidPickChampInfo(cp);
		System.out.println(cpMidPickList);
		// System.out.println("bList="+bList);
		if (!cpMidPickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpMidPickList", cpMidPickList);
			view = "Champ/mid_pick"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getBotPickChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpBotPickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpBotPickList = cpDao.getBotPickChampInfo(cp);
		System.out.println(cpBotPickList);
		// System.out.println("bList="+bList);
		if (!cpBotPickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpBotPickList", cpBotPickList);
			view = "Champ/bot_pick"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getTopPickBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpTopBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpTopBanList = cpDao.getTopBanChampInfo(cp);
		System.out.println(cpTopBanList);
		// System.out.println("bList="+bList);
		if (!cpTopBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpTopBanList", cpTopBanList);
			view = "Champ/top_pickban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getMidPickBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpMidBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpMidBanList = cpDao.getMidBanChampInfo(cp);
		System.out.println(cpMidBanList);
		// System.out.println("bList="+bList);
		if (!cpMidBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpMidBanList", cpMidBanList);
			view = "Champ/mid_pickban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getJunglePickBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpJungleBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpJungleBanList = cpDao.getJungleBanChampInfo(cp);
		System.out.println(cpJungleBanList);
		// System.out.println("bList="+bList);
		if (!cpJungleBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpJungleBanList", cpJungleBanList);
			view = "Champ/jungle_pickban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	public ModelAndView getBotPickBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpBotBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpBotBanList = cpDao.getBotBanChampInfo(cp);
		System.out.println(cpBotBanList);
		// System.out.println("bList="+bList);
		if (!cpBotBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpBotBanList", cpBotBanList);
			view = "Champ/bot_pickban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getSupPickBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpSupBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpSupBanList = cpDao.getSupBanChampInfo(cp);
		System.out.println(cpSupBanList);
		// System.out.println("bList="+bList);
		if (!cpSupBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpSupBanList", cpSupBanList);
			view = "Champ/sup_pickban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getTopBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpTopBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpTopBanList = cpDao.getTopBanChampInfo(cp);
		System.out.println(cpTopBanList);
		// System.out.println("bList="+bList);
		if (!cpTopBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpTopBanList", cpTopBanList);
			view = "Champ/top_ban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getMidBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpMidBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpMidBanList = cpDao.getMidBanChampInfo(cp);
		System.out.println(cpMidBanList);
		// System.out.println("bList="+bList);
		if (!cpMidBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpMidBanList", cpMidBanList);
			view = "Champ/mid_ban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getJungleBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpJungleBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpJungleBanList = cpDao.getJungleBanChampInfo(cp);
		System.out.println(cpJungleBanList);
		// System.out.println("bList="+bList);
		if (!cpJungleBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpJungleBanList", cpJungleBanList);
			view = "Champ/jungle_ban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	public ModelAndView getBotBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpBotBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpBotBanList = cpDao.getBotBanChampInfo(cp);
		System.out.println(cpBotBanList);
		// System.out.println("bList="+bList);
		if (!cpBotBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpBotBanList", cpBotBanList);
			view = "Champ/bot_ban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getSupBanChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpSupBanList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpSupBanList = cpDao.getSupBanChampInfo(cp);
		System.out.println(cpSupBanList);
		// System.out.println("bList="+bList);
		if (!cpSupBanList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpSupBanList", cpSupBanList);
			view = "Champ/sup_ban"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public ModelAndView getTopPickHomeChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpTopHomePickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpTopHomePickList = cpDao.getTopPickChampInfo(cp);
		System.out.println(cpTopHomePickList);
		// System.out.println("bList="+bList);
		if (!cpTopHomePickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpTopHomePickList", cpTopHomePickList);
			view = "Champ/top_home"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getSupPickHomeChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpSupHomePickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpSupHomePickList = cpDao.getSupPickChampInfo(cp);
		System.out.println(cpSupHomePickList);
		// System.out.println("bList="+bList);
		if (!cpSupHomePickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpSupHomePickList", cpSupHomePickList);
			view = "Champ/sup_home"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getJunglePickHomeChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpJungleHomePickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpJungleHomePickList = cpDao.getJunglePickChampInfo(cp);
		System.out.println(cpJungleHomePickList);
		// System.out.println("bList="+bList);
		if (!cpJungleHomePickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpJungleHomePickList", cpJungleHomePickList);
			view = "Champ/jungle_home"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getMidPickHomeChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpMidHomePickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpMidHomePickList = cpDao.getMidPickChampInfo(cp);
		System.out.println(cpMidHomePickList);
		// System.out.println("bList="+bList);
		if (!cpMidHomePickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpMidHomePickList", cpMidHomePickList);
			view = "Champ/mid_home"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	

	public ModelAndView getBotPickHomeChampInfo(Champ cp) {
		mav = new ModelAndView();
		String view = null;
		List<Champ> cpBotHomePickList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

		cpBotHomePickList = cpDao.getBotPickChampInfo(cp);
		System.out.println(cpBotHomePickList);
		// System.out.println("bList="+bList);
		if (!cpBotHomePickList.isEmpty()) { // pageNum에 값이 있으면
			mav.addObject("cpBotHomePickList", cpBotHomePickList);
			view = "Champ/bot_home"; // jsp
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
	
	
	public ModelAndView getChampInfo(Champ cp, String ch, String lane) {
	      mav = new ModelAndView();
	      String view = null;
	      cp = cpDao.getChampDetail(ch); 
	      List<ChampSpell> cs = cpDao.getChampSpell(ch,lane);
	      List<ChampItem> ci = cpDao.getChampItem(ch,lane);
	      List<ChampItem> cis = cpDao.getChampItem_s(ch,lane);
	      List<ChampRune> cr = cpDao.getChampRune(ch,lane);
	         if (cp != null) { // 아이디 존재
	               mav.addObject("cp", cp);
	               mav.addObject("cs", cs);
	               mav.addObject("ci", ci);
	               mav.addObject("cis", cis);
	               mav.addObject("cr", cr);
	               view = "Champ/champInfo"; // post,get--->get으로만 redirect
	            } else {// 비번 불일치
	               view = "Champ/champ";
	               mav.addObject("check", 2); // 1: 회원가입성공, 2: 실패
	         } 
	         mav.setViewName(view);
	         return mav;
	   }
	
	
	
}
