package mini.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mini.data.dto.BoardDto;
import mini.data.dto.SmartShopDto;
import mini.data.service.SmartShopService;

@Controller
public class SmartShopController {

	@Autowired
	SmartShopService service;
	
	
	@GetMapping("smart/list")
	public ModelAndView smartlist(@RequestParam(value="currentPage",defaultValue = "1") int currentPage) {
		
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
		List<SmartShopDto> list=service.getShopList(start, perPage);
		
		//각 글 앞에 붙일 시작번호
		//총글이 만약에 20... 1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no=totalCount-(currentPage-1)*perPage;
		
		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list); //댓글이 포함된 후 전달
		mview.addObject("totalCount",totalCount);
		mview.addObject("totalPage",totalPage);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("no",no);
		mview.addObject("currentPage",currentPage);		
		mview.addObject("totalCount", totalCount);
		
		mview.setViewName("/smartshop/shoplist");
		
		return mview;
	}

	@GetMapping("smart/smartform")
	public String smartform() {
				
		return "/smartshop/smartform";
	}
	
	@PostMapping("smart/insert")
	public String insert(@ModelAttribute SmartShopDto dto
			) {
		
		service.insertShop(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("smart/getdate")
	public String getdate(@RequestParam String num,
			@RequestParam String currentPage,
			Model model) {
		
		SmartShopDto dto=service.getGoods(num);
		
		model.addAttribute("dto",dto);
		model.addAttribute("currentPage",currentPage);

		
		return "/smartshop/detailpage";
	}
}
