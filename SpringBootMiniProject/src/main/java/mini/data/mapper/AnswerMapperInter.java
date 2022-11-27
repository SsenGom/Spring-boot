package mini.data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import mini.data.dto.AnswerDto;
import mini.data.dto.BoardDto;

@Mapper
public interface AnswerMapperInter {

	public int getTotalCount();
	public void insertOfAnswer(AnswerDto dto);
	public AnswerDto getData(String idx);
	public List<AnswerDto> AllList(String num);
	public void updateOfAnswer(AnswerDto dto);
	public void deleteOfAnswer(String idx);

}
