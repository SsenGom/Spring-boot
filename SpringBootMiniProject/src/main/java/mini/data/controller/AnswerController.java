package mini.data.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mini.data.dto.AnswerDto;
import mini.data.dto.BoardDto;
import mini.data.service.AnswerService;
import mini.data.service.MemberService;

@Controller
public class AnswerController {

	@Autowired
	AnswerService aservice;
	
	@Autowired
	MemberService mservice;
	
	@PostMapping("/board/ainsert")
	public String answerinsert(@ModelAttribute AnswerDto dto,
			@RequestParam String currentPage,HttpSession session
		) {
		
		//세션에서 id얻어서 dto에 넣기 ...object니까 string붙여줘야
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		String name= mservice.getName(myid);
		dto.setName(name);
		
		//db에 추가
		aservice.insertOfAnswer(dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
	
	@GetMapping("/board/adelete")
	@ResponseBody
	public void answerdelete(@RequestParam String idx) {
		
		aservice.deleteOfAnswer(idx);
	}
	

	
}
