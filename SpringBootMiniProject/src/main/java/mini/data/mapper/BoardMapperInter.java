package mini.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import mini.data.dto.BoardDto;

@Mapper
public interface BoardMapperInter {

	public int getTotalCount();
	public void insertOfBaoard(BoardDto dto);
	public BoardDto getData(String num);
	public int getMaxNum();
	public void updateReadCount(String num);
	public List<BoardDto> getList(HashMap<String, Integer> map);
	public void updateOfBoard(BoardDto dto);
	public void deleteOfBoard(String num);
}
