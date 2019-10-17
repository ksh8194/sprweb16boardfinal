package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import pack.model.BoardDaoInter;
import pack.model.BoardDto;

@Controller
public class ListController {
	@Autowired
	@Qualifier("boardDaoImpl")
	private BoardDaoInter inter;
	
	private int tot; // 전체 레코드 수
	private int plist = 5; // 페이지 당 행의 수
	private int pagesu; // 전체 페이지 수
	
	
		@RequestMapping("list")
		public Model process(Model model, @RequestParam("page")int page) {
			tot = inter.totalCnt(); // 전체 페이지 수 얻기
			
			ArrayList<BoardDto> list = inter.getList();
			
			ArrayList<BoardDto> result = new ArrayList<BoardDto>();
			result = getList(list, page);
			
			
			// model.addAttribute("data", list); // 전체를 jsp로 전송
			model.addAttribute("data", result);  // 일부를 jsp로 전송
			model.addAttribute("page", page);
			model.addAttribute("pagesu", getPageSu());
			
			return model;
		}
		
		public int getPageSu() {  //총 페이지 수
			pagesu = tot / plist;
			if(tot % plist > 0) pagesu += 1; // 자투리 페이지 꼐산
			return pagesu;
		}
		
		public ArrayList<BoardDto> getList(ArrayList<BoardDto> list, int page){
			ArrayList<BoardDto> result = new ArrayList<BoardDto>();
			int start = (page - 1) * plist; // 0, 5 , 10 , 15 ....
			int size = plist <= list.size() - start?plist:list.size() - start;
			System.out.println("start:" + start + ",size:" + size);
			
			for(int i = 0; i < size; i ++) {
				result.add(i,list.get(start + i));
			} 
			
			
			
			return result;
			
		}
}
