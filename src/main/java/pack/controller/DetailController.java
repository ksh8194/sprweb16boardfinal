package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import pack.model.BoardDaoInter;

@Controller
public class DetailController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping("detail")
	public Model detailProcess(Model model, 
			@RequestParam("num")String num, 
			@RequestParam("page")String page) {
		// 조회수 증가
		inter.updateReadCnt(num);
		
		
		// 해당 레코드 읽기
		model.addAttribute("data", inter.getDetail(num));
		model.addAttribute("page", page );
		
			return model;
	}
}
