package www.YwaY.com.bean;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("ChampTip")
@Data
@Accessors(chain = true)
public class ChampTip {
	private int ct_num; // pk, 댓글 번호
	private int ct_cpnum; // fk, 챔피언 번호
	private String ct_contents;
	private String ct_mid;	//fk, 회원아이디
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "Asia/Seoul")
	// @JsonIgnore //select * from m //비번은 출력 제외
	private Timestamp ct_date;
	// private String r_date; //오라클에서 to_char(날짜데이터)

}
