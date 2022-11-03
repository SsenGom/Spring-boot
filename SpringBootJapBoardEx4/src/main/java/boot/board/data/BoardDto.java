package boot.board.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity //엔티티 대응
@Table(name="jpaboard") //테이블 생성
@Data //세터 게터
public class BoardDto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO) //인서트와 업데이트를 넘버의 유무로 판단하는 역할
	private Long num;
	
	@Column(name = "writer", updatable = false) //컬럼네임, 업데이트 가능 여부
	private String writer;
	
	@Column
	private String subject;
	
	@Column
	private String content;

	@Column
	private String photo;
	
	@CreationTimestamp
	@Column(name="writeday",updatable = false)
	private Timestamp writeday;
}
