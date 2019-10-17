package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;

@Controller
public class ReplyController {
	@Autowired
	private BoardDaoInter inter;

	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public ModelAndView replyProcess(@RequestParam("num") String num, 
			@RequestParam("page") String page) {
		ModelAndView view = new ModelAndView("reply", "data", inter.getDetail(num));
		view.addObject("page", page);
		return view;

	}

	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String replyProcess(BoardBean bean,@RequestParam("page") String page) {
		bean.setOnum(bean.getOnum() + 1); // onum 갱신
		inter.updateOnum(bean);
		
		// 저장 
		bean.setBdate();
		bean.setNum(inter.currentNum() + 1 ); //새 글 번호
		bean.setNested(bean.getNested() + 1 ); // 들여 쓰기
		ModelAndView view = new ModelAndView();
		
		
		if(inter.insertReply(bean)) {
			return "redirect:/list?page=" + page;
		}else{			
			return "redirect:/error";
		}
	}
	
}
