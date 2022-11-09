package boot.day1104.market;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.data.*","boot.day1104.market"}) //메인패키지말고 다른패키지에서 실행할 때 메인패키지에 등록
@MapperScan("boot.data.*") //mapper,dao등록
public class SpringBootMybatisEx8Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMybatisEx8Application.class, args);
	}

}
