package mini.data.mapper;

import java.util.List;import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import mini.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllMembers();
	public int getSearchId(String id);
	public String getName(String id); //id에 해당하는 이름반환
	public int getIdPassCheck(Map<String, String> map); //id와 비번을 파라메타로 넘겨서 반환 <키값,벨류값> 키값은 무조건 스트링... 벨류값은 둘 다 스트링이면 스트링 섞여있으면 object
	public MemberDto getIdDto(String id);
	public void deleteMember(String num);
	public MemberDto getDataByNum(String num);
	public void updatePhoto(Map<String, String> map);
	public void updateMember(MemberDto dto);
}
