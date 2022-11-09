package mini.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	//메뉴에서 이동하기
	
	@GetMapping("/")
	public String start()
	{
		return "/layout/main";
	}
	
	
	//오시는길 
	@GetMapping("/load/map")
	public String map()
	{
		return "/sub/layout/map";
	}
}
