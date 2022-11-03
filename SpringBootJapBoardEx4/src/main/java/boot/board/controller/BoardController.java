package boot.board.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.board.data.BoardDao;
import boot.board.data.BoardDto;

@Controller
public class BoardController {

	@Autowired
	BoardDao dao;
	
	
	@GetMapping("/")
	public String home() {
		return "redirect:board/list";
	}
	
	@GetMapping("/board/addform")
	public String addform() {
		return "board/writeform";
	}
	
	@GetMapping("/board/updateform")
	public String updateform(@RequestParam Long num, Model model) {		
		
		BoardDto dto=dao.getData(num);
		model.addAttribute("dto",dto);
		
		return "board/updateform";
	}
	
	
	//detail
	@GetMapping("/board/detail")
	public ModelAndView getData(@RequestParam Long num) {
		
		ModelAndView mview=new ModelAndView();
		
		//dao로부터 dto얻기
		BoardDto dto=dao.getData(num);
		String content=dto.getContent().replace("\n", "<br>");	
		dto.setContent(content);
		
		//model에 저장
		mview.addObject("dto",dto);
		
		//포워드
		mview.setViewName("board/detail");
		
		return mview;
	}
	
	//처음열면 board/list로 나오게
	@GetMapping("/board/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		List<BoardDto> list=dao.getAllDatas();
		
		model.addObject("list",list);
		model.addObject("count",list.size());
		
		//포워드
		model.setViewName("board/list");
		
		return model;
	}
	
	//인서트 메서드
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		// multipartfile 변수는 form과 일치시켜 준다. 여러장을 넣고싶으면 arraylist필요
		
		//업로드될 실제경로
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		String uploadname=upload.getOriginalFilename();
		
		if(upload.isEmpty())
			dto.setPhoto("no");
		else {
			dto.setPhoto(uploadname);
			
			//실제업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//db저장
		dao.insertboar(dto);
		
		return "redirect:list";
	}
	
	//업데이트 메서드
	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload,
			HttpServletRequest request) {
		// multipartfile 변수는 form과 일치시켜 준다. 여러장을 넣고싶으면 arraylist필요
		// HttpServletRequest나 세션이나 똑같음
		
		//업로드될 실제경로
		String realPath=request.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		//기존사진파일명, 새로운 사진파일명
		String oldFileName=dao.getData(dto.getNum()).getPhoto();
		String newFileNmae=upload.getOriginalFilename();

		
		if(upload.isEmpty())
			dto.setPhoto(oldFileName);
		else {
			dto.setPhoto(newFileNmae);
			
			//기존사진 save파일에서 삭제
			deleteFile(realPath, oldFileName);
			
			//실제업로드
			try {
				upload.transferTo(new File(realPath+"\\"+newFileNmae));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//db저장
		dao.updateboard(dto);
		
		return "redirect:detail?num="+dto.getNum();
	}
	
		//파일삭제하는 메서드
		public void deleteFile(String path, String fileName) {
			File file=new File(path+"\\"+fileName);
			
			if(file.exists()) //해당경로에 파일이 있을경우 true
			{
				file.delete();
				System.out.println("파일삭제 성공!!");
			}
		}
	
		//delete
		@GetMapping("/board/delete")
		public String delete(@RequestParam Long num,
				HttpServletRequest request) {
			
			String path=request.getServletContext().getRealPath("/save");
			String filename=dao.getData(num).getPhoto();
			
			//사진삭제
			deleteFile(path, filename);
			//db에서도 삭제
			dao.deleteboard(num);
			
			
			return "redirect:list";
		}
}
