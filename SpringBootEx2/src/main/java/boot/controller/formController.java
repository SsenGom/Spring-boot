package boot.controller;

import java.awt.image.MultiPixelPackedSampleModel;
import java.lang.annotation.Annotation;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.PersonDto;

@Controller
public class formController {

	@GetMapping("/sist/form1")
	public String form1() {
		
		return "form/form1";
	}
	@GetMapping("/sist/form2")
	public String form2() {
		
		return "form/form2";
	}
	@GetMapping("/sist/form3")
	public String form3() {
		
		return "form/form3";
	}
	
	//폼읽고 저장 포워드
	@PostMapping("/sist/read1")
	public ModelAndView readform1(
			@RequestParam String name,
			@RequestParam int java,
			@RequestParam int spring
			) {
		
		ModelAndView mview=new ModelAndView();
		
		int tot=java+spring;
		int avg=tot/2;
		
		//request 저장
		mview.addObject("name",name);
		mview.addObject("java",java);
		mview.addObject("spring",spring);
		mview.addObject("tot",tot);
		mview.addObject("avg",avg);
		
		mview.setViewName("result/result1");
		
		return mview;
	}
	
	@PostMapping("/sist/read2")
	public ModelAndView readform2(@ModelAttribute ("dto") PersonDto dto) {
				
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("dto",dto);
		
		mview.setViewName("result/result2");
		
		return mview;
	}
	
	@PostMapping("/sist/read3")
	public HashMap<String, String> readform3(HashMap<String, String> map) {
				
		HashMap<String, String> map=new HashMap<>();
		
		return map;
	}
}
