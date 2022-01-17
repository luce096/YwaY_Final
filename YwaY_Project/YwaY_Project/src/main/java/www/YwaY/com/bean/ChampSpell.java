package www.YwaY.com.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("ChampSpell")
@Data
@Accessors(chain=true)
public class ChampSpell {
	private String lane;
	private String name_e;
	private int spell1;
	private int spell2;
	private int cnt;
	private int wincnt;
	private int total_cnt;
	private float rate;
	private float winrate;
	private String s1name;
	private String s1name_e;
	private String s1cool;
	private String s1tooltip;
	private String s2name;
	private String s2name_e;
	private String s2cool;
	private String s2tooltip;
}
