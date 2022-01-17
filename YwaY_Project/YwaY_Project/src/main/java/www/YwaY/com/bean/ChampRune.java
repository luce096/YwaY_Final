package www.YwaY.com.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("ChampRune")
@Data
@Accessors(chain=true)
public class ChampRune {
	private String lane;
	private String championname;
	private int rune1;
	private int rune2;
	private int rune3;
	private int rune4;
	private int rune5;
	private int rune6;
	private int offense;
	private int flex;
	private int defense;
	private int cnt;
	private int wincnt;
	private int total_cnt;
	private float rate;
	private float winrate;
	private String r1name;
	private String r1name_e;
	private String r1tooltip;
	private String r2name;
	private String r2name_e;
	private String r2tooltip;
	private String r3name;
	private String r3name_e;
	private String r3tooltip;
	private String r4name;
	private String r4name_e;
	private String r4tooltip;
	private String r5name;
	private String r5name_e;
	private String r5tooltip;
	private String r6name;
	private String r6name_e;
	private String r6tooltip;
	private String offname;
	private String offname_e;
	private String offtooltip;
	private String flexname;
	private String flexname_e;
	private String flextooltip;
	private String defenname;
	private String defenname_e;
	private String defentooltip;

}
