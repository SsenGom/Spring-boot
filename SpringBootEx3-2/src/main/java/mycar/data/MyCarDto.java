package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Table(name= "mycar") //mycar라는 테이블이 mysql에 만들어짐
@Data
public class MyCarDto {

	@Id //각 엔티티 구별하도록 하는 식별아이디(시퀀스)
	@GeneratedValue(strategy= GenerationType.AUTO)
	private long num;
	
	//컬럼명 재정의
	@Column(name="carname")
	private String carname;
	
	@Column //안쓰면 이름 그대로 
	private int carprice;
	
	@Column(name="carcolor")
	private String carcolor;
	
	@Column(name="carguip")
	private String carguip;
	
	@CreationTimestamp //엔티티가 생성되는 시점의 시간 자동 등록
	@Column(updatable = false) //수정시 이컬럼은 수정 x
	private Timestamp guipday;
	
}
