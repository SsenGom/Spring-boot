package mini.data.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mini.data.dto.BoardDto;
import mini.data.dto.ReBoardDto;
import mini.data.service.ReBoardService;

@Controller
public class ReBoardController {

	@Autowired
	ReBoardService service;
	
	@GetMapping("/reboard/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn", required = false)String sc,
			@RequestParam(value = "searchword", required = false)String sw
			//req =false 는 값이 없을 때 null값 표시 
			) {
	
		ModelAndView mview=new ModelAndView();
		
		//전체갯수
		int totalCount=service.getReTotalCount(sc, sw);
		
		//페이징에 필요한 변수
				int totalPage; //총 페이지 수
				int startPage; //각 블럭의 시작페이지
				int endPage; //각블럭의 끝 페이지
				int start; //각페이지의 싲가번호
				int perPage=5; //한페이지에 보여질 글의 갯수
				int perBlock=5; //한 블럭당 보여지는 페이지 갯수

				
				//총페이지갯수 구하기
				totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

				//각 블럭의 시작페이지 (현재페이지 3: 시작 1 끝 5)
				//각 블럭의 시작페이지 (현재페이지 6: 시작 6 끝 10)
				startPage=(currentPage-1)/perBlock*perBlock+1;
				endPage=startPage+perBlock-1;

				//총페이지수가 8 ... 2번째 블럭은 startpage=6 endpage=10 ... endpage 8로 수정
				if(endPage>totalPage) {
				   endPage=totalPage;
				}
				//각페이지에서 블러올 시작번호
				//현재페이지가 1일경우 start 1,2 일경우 6
				start=(currentPage-1)*perPage;

				//각페이지에서 필요한 게시글 불러오기
				List<ReBoardDto> list=service.getReList(sc, sw, start, perPage);
				
				//각 글 앞에 붙일 시작번호
				//총글이 만약에 20... 1페이지는 20부터 2페이지는 15부터
				//출력해서 1씩 감소하면서 출력
				int no=totalCount-(currentPage-1)*perPage;
				
				/*
				 * for(BoardDto d:list) { d.setAcount(aservice.AllList(d.getNum()).size()); }
				 */
				
				//출력에 필요한 변수들을 request에 저장
				mview.addObject("list",list); //댓글이 포함된 후 전달
				mview.addObject("totalCount",totalCount);
				mview.addObject("totalPage",totalPage);
				mview.addObject("startPage",startPage);
				mview.addObject("endPage",endPage);
				mview.addObject("no",no);
				mview.addObject("currentPage",currentPage);		
				
		
		mview.setViewName("/sub2/reboard/boardlist");
		
		return mview;
	}
	
	@GetMapping("/reboard/form")
	public String form(
					 @RequestParam(defaultValue="0")int num,
					 @RequestParam(defaultValue="0")int regroup,
					 @RequestParam(defaultValue="0")int restep,
					 @RequestParam(defaultValue="0")int relevel,
					 @RequestParam(defaultValue="1")int currentPage,
					 Model model) {
	
		
		//답글일 경우에만 넘어오는 값들
		//새글일 경우 모두 null이므로 디폴트값으로 전달
		model.addAttribute("num",num);
		model.addAttribute("regroup",regroup);
		model.addAttribute("restep",restep);
		model.addAttribute("relevel",relevel);
		model.addAttribute("currentPage",currentPage);
	
		return "/sub2/reboard/boardform";
	}
	
	@PostMapping("/reboard/insert")
	public String insert(@ModelAttribute ReBoardDto dto,
			@RequestParam int currentPage,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session) {
		
		//경로
		String path=session.getServletContext().getRealPath("/photo");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");

		//업로드 안햇을 때 0번지파일이 ""이된다
		//업로드 안해도 upload size()는 1
		//System.out.println(upload.size());
		String photo="";

		if(upload.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
		
			for(MultipartFile f:upload) {
				
				String fName="f" + sdf.format(new Date()) + f.getOriginalFilename();
				photo+=fName+ ",";
			
				
				try {
					f.transferTo(new java.io.File(path+"\\"+fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			photo=photo.substring(0,photo.length()-1);
			
		}
		dto.setPhoto(photo);

		service.insertReBoard(dto);
		
		return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/reboard/detail")
	public ModelAndView detail(int num, int currentPage) {
		ModelAndView mview=new ModelAndView();
		
		//조회수 증가
		service.updateReadcount(num);
		
		//num에 해당하는 dto
		ReBoardDto dto=service.getData(num);
		
		//저장
		mview.addObject("dto",dto);
		mview.addObject("currentPage",currentPage);
		//포워드
		mview.setViewName("/sub2/reboard/detail");
		
		return mview;
	}
	
	//추천수 증가
	@GetMapping("/reboard/likes")
	@ResponseBody
	public Map<String,Integer> likes(int num){
		
		service.likesUpdate(num);
		int likes=service.getData(num).getLikes();
		
		Map<String, Integer> map =new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
	
}
