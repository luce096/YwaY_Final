package www.YwaY.com.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("Member")
@Data
@Accessors(chain=true)
public class Member {  //minfo view와 member table기준
	private String memberid;
	private String memberpw;
	private String email;
	private String summonername;
	private String idhint;
	private String idanswer;
	private String a_date;
	private String grade;
}
