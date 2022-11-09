package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.builder.annotation.MapperAnnotationBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BookDto;
import boot.data.mapper.BookMapperInter;

@Controller
public class BookController {

	@Autowired
	BookMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "redirect:book/list";
	}
	
	@GetMapping("/book/addform")
	public String addform() {
		return "book/addform";
	}
	
	@GetMapping("/book/detail")
	public ModelAndView getDate(@RequestParam String num) {
		
		ModelAndView mview=new ModelAndView();
		
		BookDto dto=mapper.getDataBook(num);
		
		mview.addObject("dto",dto);
		
		mview.setViewName("book/detail");
		
		return mview;
	}
	
	
	@GetMapping("/book/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView mview=new ModelAndView();

		BookDto dto=mapper.getDataBook(num);
		mview.addObject("dto", dto);
		
		mview.setViewName("book/updateform");
		
		return mview;
	}
	
	@GetMapping("/book/list")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		
		List<BookDto> list=mapper.ListOfAllBook();
		int count=mapper.CountOfAllBook();
		
		model.addObject("list",list);
		model.addObject("count",count);
		
		model.setViewName("/book/BookList");
		
		return model;
	}
	
	@PostMapping("/book/insert")
	public String insert(@ModelAttribute BookDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals(""))
			dto.setBookphoto(null);
		else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String Bookphoto="f_"+sdf.format(new Date())+photo.getOriginalFilename();
			dto.setBookphoto(Bookphoto);
		
			try {
				photo.transferTo(new File(path+"\\"+Bookphoto));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertOfBook(dto);
		
		return "redirect:list";
	}
	
	@PostMapping("/book/update")
	public String update(@ModelAttribute BookDto dto,
			@RequestParam MultipartFile photo,
			HttpServletRequest request) {
		
		String path=request.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		String oldFileName=mapper.getDataBook(dto.getNum()).getBookphoto();
		String newFileNmae=photo.getOriginalFilename();
		
		if(photo.isEmpty())
			dto.setBookphoto(oldFileName);
		else {
			dto.setBookphoto(newFileNmae);
			
			//기존사진 save파일에서 삭제
			deleteFile(path, oldFileName);
			
			//실제업로드
			try {
				photo.transferTo(new File(path+"\\"+newFileNmae));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//db저장
		mapper.updateOfBook(dto);
		
		return "redirect:detail?num="+dto.getNum();
	}
	
	
	//파일 삭제하는 메서드
	public void deleteFile(String path, String fileName) {
		File file=new File(path+"\\"+fileName);
		
		if(file.exists()) //해당경로 파일 있을경우 true
		{
			file.delete();
			System.out.println("파일삭제 성공!");
		}
	}
	
	@GetMapping("/book/delete")
	public String deelte(@RequestParam String num,
			HttpServletRequest request) {
		
		String path=request.getServletContext().getRealPath("/photo");
		String fileName=mapper.getDataBook(num).getBookphoto();
		
		deleteFile(path, fileName);
		
		mapper.deleteOfBook(num);
		
		return "redirect:list";
	}
	
}
