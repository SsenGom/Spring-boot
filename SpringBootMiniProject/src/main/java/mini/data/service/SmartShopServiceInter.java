package mini.data.service;

import java.util.List;
import java.util.Map;

import mini.data.dto.SmartShopDto;

public interface SmartShopServiceInter {

	public void insertShop(SmartShopDto dto);
	public List<SmartShopDto> getShopList(int start, int perpage);
	public int getTotalCount();
	public SmartShopDto getGoods(String num);
	public void deleteShop(String num);
	
}
