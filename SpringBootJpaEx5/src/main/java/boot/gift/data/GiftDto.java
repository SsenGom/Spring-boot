package boot.gift.data;

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
@Table(name="giftshop")
@Data
public class GiftDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long num;
	
	@Column(updatable = false)
	private String sangpum;
	
	@Column
	private Long price;

	@Column
	private String photo;

	@Column
	private String ipgoday;
	
	@CreationTimestamp
	@Column(updatable = false)
	private Timestamp writeday;
	
	
}
