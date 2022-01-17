package www.YwaY.com.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("ChampItem")
@Data
@Accessors(chain=true)
public class ChampItem {
	private String lane;
	private String name_e;
	private int item1;
	private int item1_cnt;
	private int item2;
	private int item2_cnt;
	private int item3;
	private int item3_cnt;
	private int item4;
	private int item4_cnt;
	private int item5;
	private int item5_cnt;
	private int total_cnt;
	private int item1_wincnt;
	private int item2_wincnt;
	private int item3_wincnt;
	private int item4_wincnt;
	private int item5_wincnt;
	private float item1_rate;
	private float item2_rate;
	private float item3_rate;
	private float item4_rate;
	private float item5_rate;
	private float item1_winrate;
	private float item2_winrate;
	private float item3_winrate;
	private float item4_winrate;
	private float item5_winrate;
	private String i1name;
	private String i1tooltip;
	private int i1total;
	private int i1base;
	private String i2name;
	private String i2tooltip;
	private int i2total;
	private int i2base;
	private String i3name;
	private String i3tooltip;
	private int i3total;
	private int i3base;
	private String i4name;
	private String i4tooltip;
	private int i4total;
	private int i4base;
	private String i5name;
	private String i5tooltip;
	private int i5total;
	private int i5base;
}
