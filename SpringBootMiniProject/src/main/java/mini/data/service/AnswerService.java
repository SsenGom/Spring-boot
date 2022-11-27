package mini.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.data.dto.AnswerDto;
import mini.data.mapper.AnswerMapperInter;

@Service
public class AnswerService implements AnswerServiceInter {

	@Autowired
	AnswerMapperInter mapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public void insertOfAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertOfAnswer(dto);
	}

	@Override
	public AnswerDto getData(String idx) {
		// TODO Auto-generated method stub
		return mapperInter.getData(idx);
	}

	@Override
	public void updateOfAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateOfAnswer(dto);
	}

	@Override
	public void deleteOfAnswer(String idx) {
		// TODO Auto-generated method stub
		mapperInter.deleteOfAnswer(idx);
	}

	@Override
	public List<AnswerDto> AllList(String num) {
		// TODO Auto-generated method stub
		return mapperInter.AllList(num);
	}


	


	
}
