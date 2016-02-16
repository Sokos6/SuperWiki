package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.SuperDAO;
import superHeroTest.SuperPersonType;
import superHeroTest.SuperPersons;
import superHeroTest.SuperTeam;
import superHeroTest.SuperType;

@Controller
public class SuperController {
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

	@RequestMapping(path = "allVillains.do")
	public ModelAndView getAllVillains()
	{
		List<SuperPersons> villains = superDao.getAllVillains();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("resultList.jsp");
		mv.addObject("result", villains);
		return mv;
	}

	@RequestMapping(path = "addSuperhero.do", method = RequestMethod.GET)
	public ModelAndView addSuperForm()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addSuperhero.jsp");
		mv.addObject(new SuperPersons());
		return mv;
	}

	@RequestMapping(path = "addSuperhero.do", method = RequestMethod.POST)
	public ModelAndView addSuperhero(SuperPersons sp, @RequestParam("good") boolean superhero)
	{

		
		if (superhero) {
			sp.setSuperType(SuperType.superhero);

		} else {
			sp.setSuperType(SuperType.villain);
		}
		superDao.addSuperPerson(sp);
		ModelAndView mv = getByName(sp.getName());
		return mv;
	}
	

}