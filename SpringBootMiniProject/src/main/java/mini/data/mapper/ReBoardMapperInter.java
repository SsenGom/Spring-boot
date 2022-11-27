package mini.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import mini.data.dto.ReBoardDto;

@Mapper
public interface ReBoardMapperInter {
	
	public int getReTotalCount(Map<String, String> map);
	public int getReMaxNum();
	public void updateRestep(Map<String, Integer> map);
	public void insertReBoard(ReBoardDto dto);
	public List<ReBoardDto> getReList(Map<String, Object> map);
	public void updateReadcount(int num);
	public ReBoardDto getData(int num);
	public void likesUpdate(int num);
	
}
