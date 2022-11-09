package boot.gift.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.gift.data.GiftDao;
import boot.gift.data.GiftDaoInter;
import boot.gift.data.GiftDto;

@Controller
public class GiftController {

	@Autowired
	GiftDao dao;
	
	//매핑
	@GetMapping("/")
	public String list() {
		
		return "redirect:/gift/list";
	}
	
	@GetMapping("/gift/addform")
	public String addform() {
		
		return "/gift/addform";
	}
	
	@GetMapping("/gift/updateform")
	public String updateform(@RequestParam Long num,
			Model model) {
		
		GiftDto dto=dao.getGift(num);
		model.addAttribute("dto",dto);
		
		return "/gift/updateform";
	}
	
	
	//insert
	@PostMapping("/gift/insert")
	public String insert(@ModelAttribute GiftDto dto) {
		
		dao.insertGift(dto);
		
		return "redirect:/gift/list";
	}
	

	
	//update출력
	@PostMapping("/board/update")
	public String update(@ModelAttribute GiftDto dto) {
	
		dao.updateGift(dto);
		
		return "redirect:detail?num="+dto.getNum();

	}
	//리스트 출력
	@GetMapping("/gift/list")
	public ModelAndView listGift() {
		
		ModelAndView model=new ModelAndView();
		
		List<GiftDto> list=dao.listAllOfGift();
		
		model.addObject("list",list);
		model.addObject("count",list.size());		
		
		model.setViewName("gift/list");
		
		return model;
	}
	
	@GetMapping("/gift/detail")
	public ModelAndView getDate(@RequestParam Long num) {
		
		ModelAndView mview=new ModelAndView();
		
		GiftDto dto=dao.getGift(num);
		 
		mview.addObject("dto",dto);
		
		mview.setViewName("gift/detail");
		
		return mview;
	}
	
	
	@GetMapping("/gift/delete")
	public String delete(@RequestParam Long num) {
		
		dao.deleteGift(num);
		
		return "redirect:list";
	}
	
}
