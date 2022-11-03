package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MyCarInter extends JpaRepository<MyCarDto, Long> {

	
	
}
