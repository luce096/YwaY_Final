package www.YwaY.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import www.YwaY.com.bean.Champ;
import www.YwaY.com.bean.ChampTip;

public interface IChampTipDao {

	public boolean champTipInsert(ChampTip ct);

	@Delete("DELETE FROM CHAMPTIP WHERE CT_NUM=#{ct_num}")
	public boolean champTipDelete(int ct_num);

	public List<ChampTip> getChampTipList(int ct_num);
	
	public boolean userr(ChampTip ct);
}
