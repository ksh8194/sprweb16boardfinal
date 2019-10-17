package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.BoardDto;

@Controller
public class EditController {
	@Autowired
	private BoardDaoInter inter;
	
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public ModelAndView editProcess(
			@RequestParam("num")String num,
			@RequestParam("page")String page) {
			ModelAndView view = new ModelAndView("edit","data", inter.getDetail(num));
			view.addObject("page",page);
			return view;
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public ModelAndView editSubmits(
			@RequestParam("num")String num,
			@RequestParam("page")String page, 
			BoardBean bean) {
		//비밀번호 비교 
		String pass = inter.selectPass(num);
				
		ModelAndView view = new ModelAndView();
		if(bean.getPass().equalsIgnoreCase(pass)) {
			inter.update(bean);
			view.setViewName("detail");
		}else {
			view.setViewName("edit");
			view.addObject("msg","비밀번호 불일치!!");
		}
		BoardDto dto = inter.getDetail(num);
		view.addObject("page",page);
		view.addObject("data",dto);
		return view;
	}
	
	
}
