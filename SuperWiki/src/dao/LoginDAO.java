package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.User;

@Transactional
public class LoginDAO {
	@PersistenceContext
	private EntityManager em;
	public User getUser(String username, String password)
	{
		String query = "select u from User u where u.username = '" + username + "' and u.password = '" + password + "'";
		return em.createQuery(query, User.class).getSingleResult(); 
	}
}
