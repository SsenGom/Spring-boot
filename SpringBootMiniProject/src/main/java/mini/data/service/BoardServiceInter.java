package mini.data.service;

import java.util.HashMap;
import java.util.List;

import mini.data.dto.BoardDto;

public interface BoardServiceInter {

	public int getTotalCount();
	public void insertOfBaoard(BoardDto dto);
	public BoardDto getData(String num);
	public int getMaxNum();
	public void updateReadCount(String num);
	public List<BoardDto> getList(int start, int perpage);
	public void updateOfBoard(BoardDto dto);
	public void deleteOfBoard(String num);
}
