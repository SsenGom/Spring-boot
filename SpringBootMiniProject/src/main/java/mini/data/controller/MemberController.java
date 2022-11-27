package mini.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mini.data.dto.MemberDto;
import mini.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/form")
	public String memberform()
	{
		return "/member/memberform";
	}
	
	@GetMapping("/member/list")
	public String memberlist(Model model)
	{
		List<MemberDto> list=service.getAllMembers();		
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "/member/memberlist";
	}
	
	//id체크 반환값이 있으니 json반환
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheckProcess(String id)
	{
		Map<String, Integer> map=new HashMap<>();
		
		//id
		int n=service.getSearchId(id);
		map.put("count", n);  //0  or 1  {"count":0}
		
		return map;
	}
	
	
	//반환값이 없으니 html 반환
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMem(@RequestParam String num){
		
		service.deleteMember(num);	
	}
	
	@PostMapping("/member/insert")
	public String insert(HttpSession session,
			@ModelAttribute MemberDto dto,
			MultipartFile myphoto)
	{
		
		String path=session.getServletContext().getRealPath("/photo");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String filename="p_"+sdf.format(new Date())+myphoto.getOriginalFilename();
		
		//dto에 담기
		dto.setPhoto(filename);
		
		try {
			myphoto.transferTo(new File(path+"\\"+filename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertMember(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/myinfo")
	public String myinfo(Model model)
	{
		
		List<MemberDto> list=service.getAllMembers();
		model.addAttribute("list", list);
		
		return "/member/myinfo";
	}
	
	
	//ajax로 사진바꾸기
		@PostMapping("/member/updatephoto")
		@ResponseBody
		public void photoUpload( String num,MultipartFile photo,
				HttpSession session) {
			
			//경로
			String path=session.getServletContext().getRealPath("/photo");
			//파일명
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String filename="f_"+sdf.format(new Date())+photo.getOriginalFilename();
			
			//업로드
			try {
				photo.transferTo(new File(path+"/"+filename));
				
				service.updatePhoto(num, filename);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//myinfo 탈퇴
		@GetMapping("/member/deleteme")
		@ResponseBody
		public void deleteeme(String num,HttpSession session) {
			
			session.removeAttribute("loginok");
			session.removeAttribute("myid");
			session.removeAttribute("loginphoto");
			
			service.deleteMember(num);
		}
}
