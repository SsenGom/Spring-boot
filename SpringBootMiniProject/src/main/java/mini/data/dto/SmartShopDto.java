package mini.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("smart")
public class SmartShopDto {

	private String num;
	private int price;
	private String goods;
	private String color;
	private String content;
	private String ipgoday;
	private Timestamp writeday;
	
	
}
