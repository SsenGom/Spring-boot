package mini.data.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mini.data.dto.MemberDto;
import mini.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")
	public String form(HttpSession session,Model model)
	{
		
		//로그인상태인지 아닌지
		String loginok=(String)session.getAttribute("loginok");
		
		
		//폼에 아이디 얻어오기
		String myid=(String) session.getAttribute("myid");
		
		
		
		if(loginok==null) //한번도 실행을 안했다면
			return "/sub2/login/loginform";
		else {
		
			//로그인중에는 로그인한 이름저장
			String name=service.getName(myid);
			
			//request저장
			model.addAttribute("name",name);
			
			return "/sub2/login/logoutform";
		}
	}
	
	@PostMapping("/login/loginprocess")
	public String loginProc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam (required = false) String cbsave, //널값 때문에 오류가 발생 할 수 있는것들은 모두 리콰이어 펄스나 체크값 체크드해놓기
			HttpSession session) {
		
		int check=service.getIdPassCheck(id, pass);
		
		
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8); //8시간 저장
		
			//id에 해당하는 dto값들 불러와 리퀘스트에 저장하기... 로그인에 따른 사진 들어가는 부분 구현
			MemberDto mdto=service.getIdDto(id);
			
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("myid", id); //세션에저장
			session.setAttribute("loginok", "yes"); //세션에저장
			session.setAttribute("saveok", cbsave); //세션에저장
		
			return "redirect:main";
		}else {
			return "/member/passfail";
		}
		
	}
	
	@GetMapping("/login/logoutprocess")
	public String logoutProc(HttpSession session) {
		
		session.removeAttribute("loginok");

		return "redirect:main";
	}
	
	
	
}
