package www.YwaY.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.YwaY.com.exception.DbException;
import www.YwaY.com.bean.Champ;
import www.YwaY.com.bean.ChampTip;
import www.YwaY.com.bean.Member;
import www.YwaY.com.dao.IChampTipDao;


@Service
public class ChampTipMM {
	
	@Autowired
	private IChampTipDao ctDao;
	
	ModelAndView mav;
	
	
	public ModelAndView getChampTiplist(Champ cp, HttpSession session) {
	      mav = new ModelAndView();
	      String view = null;
	      List<ChampTip> ctList = null; // Board 클래스를 데이터타입으로 하는 리스트 담기

	      ctList = ctDao.getChampTipList(cp.getId());
	         mav.addObject("ctList", ctList); // jstl스타일로 view에 bList를 뿌린다
	         mav.addObject("cp", cp);
	         mav.addObject("session", session.getAttribute("memberid"));
	         //mav.addObject("mb", mb);
	         // mav.addObject("bList2", new Gson().toJson(bList)); //js스타일로; // boardList.jsp 화면에 뿌릴 페이지
	         System.out.println("ctList"+ctList);
	         view = "Champ/ajaxContents"; // jsp
	      mav.setViewName(view);
	      return mav;
	   }
	
	private String makeHtmlDelBtn(int ct_num) {
		StringBuilder sb = new StringBuilder();
		sb.append("<form action='tipdelete' method='post'>"); // get 방식으로 하면 아무나 주소창에 url 치고 삭제 못하게 하기위해 post
		sb.append("<input type='hidden' name='ct_num' value='" + ct_num + "'>");
		sb.append("<button>삭제</button>");
		sb.append("</form>");
		return sb.toString();
	}
	
	public Map<String, Object> champTipInsert(ChampTip ct) {
		Map<String, Object> ctMap = null;
		System.out.println("ct"+ct);
		if (ctDao.champTipInsert(ct)) { // 댓글 등록 성공 //IBoardDao 에서 반환값을 boolean으로 받아옴
			ctMap = new HashMap<String, Object>();
			ctMap.put("ctList", ctDao.getChampTipList(ct.getCt_cpnum()));
		}
		return ctMap;
	}
	
	public Map<String, Object> TipDelete(ChampTip ct) {
		Map<String, Object> ctMap = null;
		System.out.println("ct"+ct);
		if (ctDao.champTipDelete(ct.getCt_num())) { // 댓글 등록 성공 //IBoardDao 에서 반환값을 boolean으로 받아옴
			ctMap = new HashMap<String, Object>();
			ctMap.put("ctList", ctDao.getChampTipList(ct.getCt_cpnum()));
		}
		return ctMap;
	}
	
	public Map<String, Object> userr(ChampTip ct) {
		Map<String, Object> ulMap = null;
		System.out.println("ct="+ct);
		
		if(ctDao.userr(ct)) {
		ulMap = new HashMap<String,Object>();
		
		}
		return ulMap;
	}
	
}
