package boot.day1101.coffee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("mycar.data")
@EntityScan("mycar.data")//Dto 인식
@EnableJpaRepositories("mycar.data") //dao인식
public class SpringBootEx32Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootEx32Application.class, args);
	}

}
