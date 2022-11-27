package mini.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mini.data.dto.SmartShopDto;
import mini.data.mapper.SmartShopMapperInter;


@Service
public class SmartShopService implements SmartShopServiceInter {

	@Autowired
	SmartShopMapperInter mapperInter;
	
	@Override
	public void insertShop(SmartShopDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertShop(dto);
	}

	@Override
	public List<SmartShopDto> getShopList(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("start", start);		
		map.put("perpage", perpage);		

		return mapperInter.getShopList(map);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public SmartShopDto getGoods(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getGoods(num);
	}

	@Override
	public void deleteShop(String num) {
		// TODO Auto-generated method stub
		mapperInter.deleteShop(num);
	}

	
	
}
