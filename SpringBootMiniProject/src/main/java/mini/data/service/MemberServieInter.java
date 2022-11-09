package mini.data.service;

import java.util.List;
import java.util.Map;

import mini.data.dto.MemberDto;

public interface MemberServieInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id); //id에 해당하는 이름반환
	public int getIdPassCheck(String id,String pass); //서비스에서는 더 풀어서 나타내기
	public MemberDto getIdDto(String id);
	public void deleteMember(String num);
	public MemberDto getDataByNum(String num);
	public void updatePhoto(String num, String photo);
	public void updateMember(MemberDto dto);
	}
