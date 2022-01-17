package www.YwaY.com.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("Blacklist")
@Data
@Accessors(chain=true)
public class Blacklist {
	private String r_id;
	private Date r_date;
	private String r_reason;
	//private String a_id;
	//private String a_date;
	private String a_date;
	//private String nextDayString;
}
