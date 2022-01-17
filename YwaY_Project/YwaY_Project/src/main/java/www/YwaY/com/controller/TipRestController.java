package www.YwaY.com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import www.YwaY.com.bean.ChampTip;
import www.YwaY.com.service.ChampTipMM;

@RestController // 모든 메소드에 @ResponseBody 생략가능
@RequestMapping(value = "/rest") // 이렇게 위에 대분류로 선언해주면 밑에서는 그 뒤에만 쓰면 된다.
public class TipRestController { // restful방식의 API서버 구현
	@Autowired
	private ChampTipMM ctm;

	ModelAndView mav;

	@PostMapping(value = "/champtipinsert", produces = "application/json;charset=utf-8") // 리턴되는 json의 한글깨짐 방지
	public Map<String, Object> champTipInsert(@RequestBody ChampTip ct, HttpSession session) { // json으로 넘어올때는
																								// Requestbody에서
		// 꺼내와야 한다
		System.out.println("ct_con:" + ct.getCt_contents());
		ct.setCt_mid(session.getAttribute("memberid").toString());
		System.out.println("memberid:" + ct.getCt_mid());
		Map<String, Object> map = ctm.champTipInsert(ct); // ArrayList 지만 스프링이 알아서 Gson 필요없이 json으로 변환해준다. , 문자열하고
															// map타입은 // 안해준다
		return map;
	}
	
	@PostMapping(value = "/userr", produces = "application/json;charset=utf-8") // 리턴되는 json의 한글깨짐 방지
	public Map<String, Object> userr(@RequestBody ChampTip ct) { // json으로 넘어올때는
																								// Requestbody에서
		// 꺼내와야 한다
		System.out.println("ct_con:" + ct.getCt_contents());
		System.out.println("ct_mid" + ct.getCt_mid());
		Map<String, Object> map = ctm.userr(ct); // ArrayList 지만 스프링이 알아서 Gson 필요없이 json으로 변환해준다. , 문자열하고												// map타입은 // 안해준다
		return map;
	}
	

	@PostMapping(value = "/tipdelete")
	public Map<String, Object> TipDelete(@RequestBody ChampTip ct, HttpSession session) { // json으로 넘어올때는
																								// Requestbody에서
		// 꺼내와야 한다
		System.out.println("ct_con:" + ct.getCt_contents());
		ct.setCt_mid(session.getAttribute("memberid").toString());
		System.out.println("memberid:" + ct.getCt_mid());
		Map<String, Object> map = ctm.TipDelete(ct); // ArrayList 지만 스프링이 알아서 Gson 필요없이 json으로 변환해준다. , 문자열하고
															// map타입은 // 안해준다
		return map;
	}
}
