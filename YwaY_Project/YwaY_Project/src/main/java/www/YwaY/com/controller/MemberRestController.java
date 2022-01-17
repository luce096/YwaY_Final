package www.YwaY.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import www.YwaY.com.bean.Member;
import www.YwaY.com.service.MemberMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController		//@ResponseBody 생략가능
@RequestMapping(value="/member")
public class MemberRestController {
	@Autowired
	private MemberMM mm;
	
		
// ajax에서 'html' 로 할때	
	@GetMapping(value="/userid", produces = "application/json;charset=utf-8")
	public ResponseEntity<?> idAvailable(String memberid) throws JsonProcessingException{
		System.out.println("id:"+memberid);
		ResponseEntity<?> result=null;
		if(mm.idAvailable(memberid)) {
			System.out.println("사용가능");
			String json=new ObjectMapper().writeValueAsString("사용가능한 아이디");
			System.out.println("json="+json);
			result=ResponseEntity.ok().body(json);
		}else { //서버랑 통신성공했지만 원치않는 데이터를 err콜백함수로 반환
			result=ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("사용불가 아이디");
		}
		return result;
		//return ResponseEntity.ok(mm.idAvailable(m_id));  //아이디존재시 500에러
	}
	
	
}



