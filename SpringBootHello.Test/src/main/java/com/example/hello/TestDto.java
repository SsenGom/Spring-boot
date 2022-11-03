package com.example.hello;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*@Setter
@Getter
@ToString*/

@Data //위에 3가지를 합친 기능
public class TestDto {

	private String name;
	private String addr;
	
	
	
}
