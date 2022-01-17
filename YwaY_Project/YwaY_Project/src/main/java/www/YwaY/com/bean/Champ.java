package www.YwaY.com.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("Champ")
@Data
@Accessors(chain=true)
public class Champ {
	private int id;
	private String name;
	private String name_e;
	private String p_name;
	private String p_img;
	private String p_tooltip;
	private String q_name;
	private String q_img;
	private String q_cool;
	private String q_cost;
	private String q_range;
	private String q_tooltip;
	private String w_name;
	private String w_img;
	private String w_cool;
	private String w_cost;
	private String w_range;
	private String w_tooltip;
	private String e_name;
	private String e_img;
	private String e_cool;
	private String e_cost;
	private String e_range;
	private String e_tooltip;
	private String r_name;
	private String r_img;
	private String r_cool;
	private String r_cost;
	private String r_range;
	private String r_tooltip;
	private String CHAMPIONNAME;
	private float PICK;
	private float BAN_RATE;
	private String lane1;
	private String lane2;
	private String lane3;
}
