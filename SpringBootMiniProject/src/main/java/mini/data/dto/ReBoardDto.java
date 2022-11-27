package mini.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("reboard")
public class ReBoardDto {

	private int num;
	private int readcount;
	private int restep;
	private int likes;
	private int relevel;
	private int regroup;
	private String id;
	private String name;
	private String subject;
	private String content;
	private String photo;
	private Timestamp writeday;
	
}
