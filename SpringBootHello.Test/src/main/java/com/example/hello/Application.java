package com.example.hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.test","hello.boot"}) //패키지 등록 하는 곳 ,{}로 여러개 등록 가능
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
