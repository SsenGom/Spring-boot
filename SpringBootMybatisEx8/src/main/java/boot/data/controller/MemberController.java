package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;
import boot.data.service.MemberServiceInter;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/list")
	public String member(Model model) {
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list",list);
		model.addAttribute("count",list.size());
		
		return"/member/memberlist";
	}
	@GetMapping("/member/form")
	public String memberform() {
		return"/member/memberform";
	}
	
}
