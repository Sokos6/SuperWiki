package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.SuperDAO;
import superHeroTest.SuperPersons;


@Controller
public class SuperController
{
	@Autowired
	private SuperDAO superDao;
	
	@RequestMapping(path = "selectID.do", params = "id")
	public ModelAndView getById(@RequestParam("id") int id)
	{
		SuperPersons SP = superDao.getById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("result", SP);
		return mv;
	}
	@RequestMapping(path = "select.do", params = "text")
	public ModelAndView getByName(@RequestParam("text") String text)
	{
		SuperPersons SP = superDao.getByName(text);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("result", SP);
		return mv;
	}
	@RequestMapping(path = "allSuperheroes.do")
	public ModelAndView getAllSuperheroes()
	{
		List<SuperPersons> superPersons = superDao.getAllSuperheroes();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultList.jsp");
		mv.addObject("result", superPersons);
		return mv;
	}
	
}