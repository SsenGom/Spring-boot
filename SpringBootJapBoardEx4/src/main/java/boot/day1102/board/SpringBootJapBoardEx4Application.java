package boot.day1102.board;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan("boot.board.*")
@EntityScan("boot.board.data") //dto찾아서
@EnableJpaRepositories("boot.board.data") //dao찾아서
public class SpringBootJapBoardEx4Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJapBoardEx4Application.class, args);
	}

}
