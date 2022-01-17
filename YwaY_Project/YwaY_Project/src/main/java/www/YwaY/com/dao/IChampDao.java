package www.YwaY.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import www.YwaY.com.bean.Champ;
import www.YwaY.com.bean.ChampItem;
import www.YwaY.com.bean.ChampRune;
import www.YwaY.com.bean.ChampSpell;
import www.YwaY.com.bean.ChampWin;

@Repository
public interface IChampDao {

	List<Champ> getChampInfo(Champ cp);
	List<Champ> getAllChampInfo(Champ cp);
	List<Champ> getTopChampInfo(Champ cp);
	List<Champ> getMidChampInfo(Champ cp);
	List<Champ> getJungleChampInfo(Champ cp);
	List<Champ> getSupChampInfo(Champ cp);
	List<Champ> getBotChampInfo(Champ cp);
	List<ChampWin> getChampWinInfo(ChampWin cWin);
	List<Champ> getSupPickChampInfo(Champ cp);
	List<Champ> getTopPickChampInfo(Champ cp);
	List<Champ> getBotPickChampInfo(Champ cp);
	List<Champ> getJunglePickChampInfo(Champ cp);
	List<Champ> getMidPickChampInfo(Champ cp);
	List<Champ> getJungleBanChampInfo(Champ cp);
	List<Champ> getTopBanChampInfo(Champ cp);
	List<Champ> getMidBanChampInfo(Champ cp);
	List<Champ> getSupBanChampInfo(Champ cp);
	List<Champ> getBotBanChampInfo(Champ cp);
	Champ getChampDetail(String ch);
	List<ChampSpell> getChampSpell(@Param("name_e")String name_e,@Param("lane")String lane);
	List<ChampItem> getChampItem(@Param("name_e")String name_e,@Param("lane")String lane);
	List<ChampRune> getChampRune(@Param("name_e")String name_e,@Param("lane")String lane);
	List<ChampItem> getChampItem_s(@Param("name_e")String name_e,@Param("lane")String lane);
	
}


