package mini.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mini.data.dto.BootShopDto;
import mini.data.mapper.BootShopMapperInter;

@Controller
@RequestMapping("/bootshop")
public class BootShopController {

	@Autowired
	BootShopMapperInter mapper;
	
	/*@GetMapping("/")
	public String start()
	{
		return "/layout/main";
	}*/
	
	@GetMapping("/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		List<BootShopDto> list=mapper.getAllSangpums();
		
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		//mview.setViewName("bootshop/shoplist"); //jsp
		mview.setViewName("/bootshop/shoplist"); //tiles
		return mview;
	}
	
	@GetMapping("/shopform")
	public String form()
	{
		return "/bootshop/addform";
	}
	
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute BootShopDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		if(upload.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname="f_"+sdf.format(new Date())+upload.getOriginalFilename();
			
			dto.setPhotoname(photoname);
			
			//실제업로드
			try {
				upload.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//insert
		mapper.insertBootShop(dto);
		
		//목록
		return "redirect:list";
	}
	
	
	@GetMapping("/updateform")
	public String uform(String num,Model model)
	{
		BootShopDto dto=mapper.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "/sub2/bootshop/updateform";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute BootShopDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		if(upload.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname="f_"+sdf.format(new Date())+upload.getOriginalFilename();
			
			dto.setPhotoname(photoname);
			
			//실제업로드
			try {
				upload.transferTo(new File(path+"/"+photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//update
		mapper.updateBootShop(dto);
		
		//목록
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(String num,HttpSession session)
	{
		
		String path=session.getServletContext().getRealPath("/photo");
		String uploadfile=mapper.getData(num).getPhotoname();
		
		File file=new File(path+"/"+uploadfile);
		
		file.delete();
		
		mapper.deleteShop(num);
		return "redirect:list";
	}
	
}
