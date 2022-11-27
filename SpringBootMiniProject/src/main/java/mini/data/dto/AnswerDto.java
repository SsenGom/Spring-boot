package mini.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("adto")
public class AnswerDto {

	private String idx;
	private String num;
	private String name;
	private String myid;
	private String content;
	private Timestamp writeday;
	private int acount;
}
