package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {

	@Autowired
	MyCarInter carInter;
	
	//insert
	public void insertCar(MyCarDto dto) {
		
		//save가 insert, update 모두 
		carInter.save(dto); //id타입 유무에 따라 자동으로 insert인지 update인지 구분하
	}
	
	//전체출력
	public List<MyCarDto> getAllDatas(){
		
		return carInter.findAll();
	}
	
	//num에 대한 dto반환
	public MyCarDto getData(Long num) {
		return carInter.getById(num);
	}
	
	//수정
	public void updateCar(MyCarDto dto) {
		carInter.save(dto); //num이 포함되어 있으므로 수정으로 인식함 
	}
	
	//삭제
	public void deleteCar(Long num) {
		carInter.deleteById(num);
	}
}	
