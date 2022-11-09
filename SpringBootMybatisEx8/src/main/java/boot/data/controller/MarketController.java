package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MarketDto;
import boot.data.mapper.MarketMapperInter;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "/layout/main";
	}

	@GetMapping("/market/marketlist") // 루트와 리스트를 함께주게되면 나중에 겟매핑이 꼬임
	public ModelAndView list() {

		ModelAndView mview = new ModelAndView();

		//
		List<MarketDto> list = mapper.getAllDatas();

		// db로부터 총개수 얻기
		int totalCount = mapper.getTotalCount();

		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);

		// mview.setViewName("market/marketlist"); //jsp
		mview.setViewName("/market/marketlist"); // tiles

		return mview;
	}

	// 폼이동
	@GetMapping("/market/addform")
	public String form() {
		return "/market/addform";
	}

	// insert
	@PostMapping("/market/insert")
	public String insert(@ModelAttribute MarketDto dto, @RequestParam MultipartFile photo, HttpServletRequest request) {
		// 사진여러개를 주고싶으면 arraylist붙이기

		String path = request.getServletContext().getRealPath("/photo");
		System.out.println(path);

		if (photo.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			// 사진명구해서넣기

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = "f_" + sdf.format(new Date()) + photo.getOriginalFilename();
			dto.setPhotoname(photoname);

			// 실제업로드
			try {
				photo.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		mapper.insertMarket(dto);

		return "redirect:list";
	}

	// update
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto, @RequestParam MultipartFile photo, HttpServletRequest request) {
		// 사진여러개를 주고싶으면 arraylist붙이기

		String path = request.getServletContext().getRealPath("/photo");
		System.out.println(path);

		if (photo.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			// 사진명구해서넣기

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = "f_" + sdf.format(new Date()) + photo.getOriginalFilename();
			dto.setPhotoname(photoname);

			// 실제업로드
			try {
				photo.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		mapper.updateMarket(dto);

		return "redirect:list";
	}

	
	/*
	 * @PostMapping("/market/update") public String update(@ModelAttribute MarketDto
	 * dto ,HttpServletRequest request,
	 * 
	 * @RequestParam MultipartFile photo) {
	 * 
	 * String path=request.getServletContext().getRealPath("/photo");
	 * System.out.println(path);
	 * 
	 * String oldFileNmae=mapper.getdata(dto.getNum()).getPhotoname(); String
	 * newFileName=photo.getOriginalFilename();
	 * 
	 * if(photo.isEmpty()) dto.setPhotoname(oldFileNmae); else {
	 * dto.setPhotoname(newFileName);
	 * 
	 * try { photo.transferTo(new File(path+"\\"+newFileName)); } catch
	 * (IllegalStateException | IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } } mapper.updateMarket(dto);
	 * 
	 * return "redirect:list"; }
	 */

	// delete
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num) {
		mapper.deleteMarket(num);
		return "redirect:list";
	}

	// 겟데이터
	@GetMapping("/market/updateform")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView mview = new ModelAndView();

		MarketDto dto = mapper.getdata(num);

		mview.addObject("dto", dto);

		mview.setViewName("/market/updateform");

		return mview;
	}

}
