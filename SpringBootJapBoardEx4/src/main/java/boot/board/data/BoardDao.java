package boot.board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Repository
public class BoardDao {

	@Autowired
	BoardDaoInter daoInter;
	
	//insert
	public void insertboar(BoardDto dto) {
		
		daoInter.save(dto);
	}
	
	//list
	public List<BoardDto> getAllDatas(){
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num")); //정렬 기능 구현
	}
	
	//숫자 값 얻기
	public BoardDto getData(Long num) {
		return daoInter.getById(num);
	}
	
	//update
	public void updateboard(BoardDto dto) {
		daoInter.save(dto);
	}
	
	//delete
	public void deleteboard(Long num) {
		daoInter.deleteById(num);
	}

	
}
