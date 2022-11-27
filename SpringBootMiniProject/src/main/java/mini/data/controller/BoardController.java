package mini.data.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mini.data.dto.AnswerDto;
import mini.data.dto.BoardDto;
import mini.data.dto.MemberDto;
import mini.data.service.AnswerService;
import mini.data.service.BoardService;
import mini.data.service.MemberService;

@Controller
public class BoardController {

	@Autowired
	BoardService service; //maperinter를 service에서 호출햇으므로 service를 호출

	@Autowired
	MemberService mservice;
	
	@Autowired
	AnswerService aservice;
	
	@GetMapping("/board/list")
	public ModelAndView boardlist(@RequestParam(value="currentPage",defaultValue = "1") int currentPage)
	{
		ModelAndView mview=new ModelAndView();
		
		
		int totalCount=service.getTotalCount();
		
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
		List<BoardDto> list=service.getList(start, perPage);
		
		//각 글 앞에 붙일 시작번호
		//총글이 만약에 20... 1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no=totalCount-(currentPage-1)*perPage;
		
		for(BoardDto d:list)
		{
			d.setAcount(aservice.AllList(d.getNum()).size());
		}
		
		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list); //댓글이 포함된 후 전달
		mview.addObject("totalCount",totalCount);
		mview.addObject("totalPage",totalPage);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("no",no);
		mview.addObject("currentPage",currentPage);		
		mview.addObject("totalCount", totalCount);
		
		
		mview.setViewName("/sub2/board/boardlist");
		
		return mview;
	}
	
	@GetMapping("/board/form")
	public String form() {
		return "/sub2/board/writeform";
	}
	
	@GetMapping("/board/updateform")
	public ModelAndView updateform(@RequestParam String num,
			@RequestParam String currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		BoardDto dto=service.getData(num);
		
		mview.addObject("dto",dto);
		mview.addObject("currentPage", currentPage);

		mview.setViewName("/board/updateform");
		
		return mview;
	}
	
	@PostMapping("/board/insert")
	public String insert(HttpSession session,
			@ModelAttribute BoardDto dto)
	{
		String path=session.getServletContext().getRealPath("/photo");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else {
			String uploadfile="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
		
			dto.setUploadfile(uploadfile);
			
			//dto실제업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			//세션에서 id얻어서 dto에 넣기 ...object니까 string붙여줘야
			String myid=(String)session.getAttribute("myid");
			dto.setMyid(myid);
			
			String name= mservice.getName(myid);
			dto.setName(name);
			
		
		service.insertOfBaoard(dto);
		//return "redirect:list";
		//바로 새로운글의 content로 이동
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@PostMapping("/board/update")
	public String update(HttpSession session,
			@ModelAttribute BoardDto dto,
			@RequestParam String currentPage)
	{
		String path=session.getServletContext().getRealPath("/photo");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile(null);
		else {
			String uploadfile="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
		
			dto.setUploadfile(uploadfile);
			
			//dto실제업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		service.updateOfBoard(dto);
		//return "redirect:list";
		//바로 새로운글의 content로 이동
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
	
	@GetMapping("board/content")
	public ModelAndView content(@RequestParam String num,
			@RequestParam String currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		//조회수 증가
		service.updateReadCount(num);
		
		BoardDto dto=service.getData(num);
		
		//업로드 파일의 확장자 얻기 
		int dotLoc=dto.getUploadfile().lastIndexOf('.'); //점의 마지막 위치
		String ext=dto.getUploadfile().substring(dotLoc+1);
		
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg") )
			mview.addObject("bupload",true);
		else
			mview.addObject("bupload",false);
		
		
		mview.addObject("dto",dto);
		mview.addObject("currentPage",currentPage);
		
		//num에 해당하는 댓글을 db에서 가져와 보낸다
		List<AnswerDto> alist=aservice.AllList(num);
				
		mview.addObject("acount",alist.size());
		mview.addObject("alist",alist);
				
		
		mview.setViewName("/board/content");
		
		return mview;
	}
	
	@GetMapping("board/delete")
	public String delete(@RequestParam String num,
			@RequestParam String currentPage,
			HttpSession session
			) {
		
		String photo=service.getData(num).getUploadfile();
		
		//,로 분리
		if(!photo.equals("no")) {
						
			//실제 업로드 경로
			String path=session.getServletContext().getRealPath("/photo");
			//fname 포이치문으로 경로에서 모두삭제
			
				File file=new File(path+"\\"+photo);
				file.delete();
		
		}
		
		service.deleteOfBoard(num);
		
		return "redirect:list?currentPage="+currentPage;
	}
}
