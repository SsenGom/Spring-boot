package mini.data.service;

import java.util.List;

import mini.data.dto.ReBoardDto;

public interface ReBoardServiceInter {

	public int getReTotalCount(String searchcolumn, String searchword);
	public int getReMaxNum();
	public void updateRestep(int regroup, int restep);
	public void insertReBoard(ReBoardDto dto);
	public List<ReBoardDto> getReList(String searchcolumn, String searchword, int start, int perpage);
	public void updateReadcount(int num);
	public ReBoardDto getData(int num);
	public void likesUpdate(int num);
}
