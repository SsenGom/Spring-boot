package boot.day1104.book;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("boot.data.*") //메인패키지말고 다른패키지에서 실행할 때 메인패키지에 등록
@MapperScan("boot.data.*") //mapper,dao등록
public class SpringBootMybatisTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMybatisTestApplication.class, args);
	}

}
