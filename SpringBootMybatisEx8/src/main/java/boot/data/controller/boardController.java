package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class boardController {

	@GetMapping("/board/list")
	public String board() {
		return"/board/boardlist";
	}
	
	@GetMapping("/load/map")
	public String map() {
		return"/sub/layout/map";
	}
}
