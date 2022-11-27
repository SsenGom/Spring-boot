package mini.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import mini.data.dto.SmartShopDto;

@Mapper
public interface SmartShopMapperInter {

	public void insertShop(SmartShopDto dto);
	public List<SmartShopDto> getShopList(Map<String, Integer> map);
	public int getTotalCount();
	public SmartShopDto getGoods(String num);
	public void deleteShop(String num);
	
}
