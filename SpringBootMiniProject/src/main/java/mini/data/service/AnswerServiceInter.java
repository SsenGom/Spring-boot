package mini.data.service;

import java.util.List;

import mini.data.dto.AnswerDto;

public interface AnswerServiceInter {

	public int getTotalCount();
	public void insertOfAnswer(AnswerDto dto);
	public AnswerDto getData(String idx);
	public List<AnswerDto> AllList(String num);
	public void updateOfAnswer(AnswerDto dto);
	public void deleteOfAnswer(String idx);
}
