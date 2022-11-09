package boot.gift.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class GiftDao {

	@Autowired
	GiftDaoInter daoInter;
	
	
	//insert
	public void insertGift(GiftDto dto){
		
		 daoInter.save(dto);
	}
	
	//list
	public List<GiftDto> listAllOfGift(){
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	
	//getdata
	public GiftDto getGift(Long num) {
		return daoInter.getById(num);
	}
	
	//update
	public void updateGift(GiftDto dto) {
		daoInter.save(dto);
	}
	
	//delete
	public void deleteGift(Long num) {
		daoInter.deleteById(num);
	}
	
	
}
