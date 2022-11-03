package boot.test;

import java.util.List;
import java.util.Vector;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.hello.ShopDto;
import com.example.hello.TestDto;

@RestController
public class TestController {

	@GetMapping("/test")
	public TestDto hello()
	{
		TestDto dto=new TestDto();
		
		dto.setName("준호");
		dto.setAddr("의정부");
		
		return dto;
	}
	
	@GetMapping("/shop/list")
	public List<ShopDto> list(){
		
		List<ShopDto> list=new Vector<>();
		
		ShopDto s1=new ShopDto();
		s1.setShop("사과");
		s1.setSu(5);
		s1.setDan(1500);

		list.add(s1);

		ShopDto s2=new ShopDto();
		s1.setShop("배");
		s1.setSu(7);
		s1.setDan(2000);
		
		list.add(s2);
		
		return list;
	}
	
	
}
