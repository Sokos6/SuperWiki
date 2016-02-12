package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.SuperDAO;


@Controller
public class SuperController
{
	@Autowired SuperDAO SuperDAO;
	
	@RequestMapping(path = "select.do", params = "text")
	public ModelAndView getMonthName(@RequestParam("text") String text)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("result", text);
		return mv;
	}
}