package hello.boot;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {

	@GetMapping("/naver/hello")
	public HashMap<String, String> hello(){
		
		HashMap<String, String> data=new HashMap<>();
		
		data.put("message", "have a nice day");
		
		return data;
	}
	
}
