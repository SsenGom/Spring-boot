package spring.jpa.giftshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("boot.gift.*")
@EntityScan("boot.gift.data")
@EnableJpaRepositories("boot.gift.data")
public class SpringBootJpaEx5Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJpaEx5Application.class, args);
	}

}
