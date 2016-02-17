package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.LoginDAO;
import dao.SuperDAO;
import superHeroTest.Comment;
import superHeroTest.Favorite;
import superHeroTest.SuperPersons;
import superHeroTest.User;

@Controller
@SessionAttributes("user")
public class LoginController {
	@Autowired
	private LoginDAO loginDao;
	@Autowired
	private SuperDAO superDao;
	User user;
	
	@ModelAttribute("user")
	public User createUser()
	{
		user = new User();
		return user;
	}
	

    @RequestMapping(path = "login.do", method = RequestMethod.GET)
    public String showLoginPage() {
    	return "login.jsp";
    }
    @RequestMapping(path = "login.do", method = RequestMethod.GET, params = {"username", "password"})
    public ModelAndView homePage(@RequestParam("username") String username, @RequestParam("password") String password, @ModelAttribute("user") User user) 
    {
    	System.out.println(username+" "+password);
    	user = loginDao.getUser(username, password);
    	System.out.println(user.getId());
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("index.html");
		mv.addObject("user", user);
    	return mv;
    }
    @RequestMapping(path = "addFav.do", method = RequestMethod.POST)
    public ModelAndView addFav(@RequestParam("selectionid") int id, @ModelAttribute("user") User user) {
    	SuperPersons sp = superDao.getById(id);
    	loginDao.addFavorites(sp, user);
    	ModelAndView mv = new ModelAndView();  
    	mv.setViewName("profile.jsp");
    	mv.addObject("user", user);
    	return mv;
    }
    @RequestMapping(path="deleteFavorite.do", method=RequestMethod.POST)
    public ModelAndView deleteFav(@RequestParam("deleteid") int id, @ModelAttribute("user") User user){
    	System.out.println("deleteid" + id);
    	SuperPersons sp = superDao.getById(id);
    	System.out.println(sp.getName());
    	loginDao.deleteFavorite(sp, user);
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("profile.jsp");
    	mv.addObject("user", user);
    	return mv;
    }
    @RequestMapping(path="addComment.do", method=RequestMethod.POST)
	public ModelAndView addComment(Comment comment){
		return null;
	}
}