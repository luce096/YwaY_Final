package www.YwaY.com.dao;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import www.YwaY.com.bean.Blacklist;
import www.YwaY.com.bean.Member;

//회원관리 DAO
@Repository
public interface IMemberDao {
	
	public int mModify(Member mb) throws Exception;
	
	//로그인
	boolean access(Member mb);
	//회원가입
	boolean memberJoin(Member mb);
	//비밀번호 암호화
	public String getSecurityPwd(String memberid);
	//id 중복체크
	public Member getIdInfo(String memberid);
	//소환사 이름 중복체크
	public Member getSummonernameInfo(String summonername);
	// 비밀번호 변경
	public int updatePw(Member mb) throws Exception;
	//비밀번호 찾기시 멤버정보
	Member readMember(String memberid);
	//아이디 중복검사
	Object idCheck(String memberid);
	//아아디 찾기시 멤버정보
	List<Member> readSummonername(@Param("summonername")String summonername, @Param("idhint")String idhint, @Param("idanswer")String idanswer);
	//블랙리스트 유저 정보
	public List<Blacklist> getBlacklist(Blacklist bl);

	public boolean blacklistdelete(String r_id);
	public boolean userdelete(String r_id);

	public Member getreportinfo(String r_id);

	public boolean loginblock(@Param("r_id")String r_id,@Param("nextDayString")String nextDayString);

	public List<Blacklist> getTipList(String r_id);

	public boolean gDelete(String r_id);

	public List<Blacklist> getblackl(String r_id);

	public List<Member> getuserupdateinfo(Member mb);

	public boolean usergradeup(String memberid);

	public void deladate(String memberid);
	
}