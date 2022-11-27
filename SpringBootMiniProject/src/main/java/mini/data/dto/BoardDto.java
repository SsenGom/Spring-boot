package mini.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("bdto")
public class BoardDto {

	private String num;
	private String name;
	private String myid;
	private String subject;
	private String content;
	private String uploadfile;
	private MultipartFile upload; //한번에 읽어오면 콘트롤러에서 따로 파라메타를 안줘도 됨 vector는 안먹히고 arraylist로만 다중선택가능
	private int readcount;
	private Timestamp wirteday;
	private int acount;
}
