package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("bdto")
public class BookDto {

	private String num; 
	private String bookname; 
	private String writer; 
	private int bookprice; 
	private String bookphoto; 
	private String bookcompany;
	private Timestamp ipgoday; 
}
