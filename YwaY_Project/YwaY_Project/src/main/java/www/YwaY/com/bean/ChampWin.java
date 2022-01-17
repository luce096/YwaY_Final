package www.YwaY.com.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("ChampWin")
@Data
@Accessors(chain=true)
public class ChampWin {
	private float WINRATE;
	private String CHAMPIONNAME;
}
