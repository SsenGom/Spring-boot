package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class infoController {

	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		
		model.addObject("name","이효리");
		model.addObject("addr","제주시 애월읍");
		model.addObject("hp","010-2242-4512");
		
		//포워드 surfix에 정확한 값을 입력해서 list만 적는다.
		model.setViewName("list");
		
		return model;
	}
	
}
