package mini.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("bsdto")
public class BootShopDto {

	private String num;
	private String sangpum;
	private String photoname;
	private int price;
	private Timestamp ipgoday;
	
}
