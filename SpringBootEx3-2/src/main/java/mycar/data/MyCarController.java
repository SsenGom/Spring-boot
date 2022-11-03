package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCarController {

	@Autowired
	MycarDao dao;
	
	@GetMapping("/carform")
	public String form() {
		return "mycar/addform";
	}
	
	@GetMapping("/updateform")
	public String form2(@RequestParam Long num,Model model) {
		
		MyCarDto dto=dao.getData(num);
		model.addAttribute("dto", dto); //dto를 받아야 수정창에서 원래 값 표시 가능 
		return "mycar/updateform";
	}
	
	@GetMapping({"/","/list"})
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();

		List<MyCarDto> list= dao.getAllDatas();
		
		mview.addObject("list",list);
		mview.addObject("count",list.size());
		
		mview.setViewName("mycar/list");
		
		return mview;
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute  MyCarDto dto) {
		
		dao.insertCar(dto);
		
	return "redirect:list";	
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute  MyCarDto dto) {
				
		dao.updateCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/deleteform")
	public String delete(@RequestParam Long num) {
		
		dao.deleteCar(num);
		
		return "redirect:list";
	}
	
}
