package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MarketDto;

@Mapper
public interface MarketMapperInter {

	public int getTotalCount();
	public List<MarketDto> getAllDatas();
	public void insertMarket(MarketDto dto);
	public void deleteMarket(String num);
	public void updateMarket(MarketDto dto);
	public MarketDto getdata(String num);
}
