package mini.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import mini.data.dto.BootShopDto;

@Mapper
public interface BootShopMapperInter {

	public int getTotalCount();
	public void insertBootShop(BootShopDto dto);
	public List<BootShopDto> getAllSangpums();
	public BootShopDto getData(String num);
	public void updateBootShop(BootShopDto dto);
	public void deleteShop(String num);
}
