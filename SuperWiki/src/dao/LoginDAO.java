package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.Favorite;
import superHeroTest.SuperPersons;
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
	
	public void addFavorites(SuperPersons sp, User user){
		Favorite fav = new Favorite(user, sp);
		System.out.println(fav);
		if(!(user.getFavorites().contains(fav))){
			System.out.println("in if statement" + fav);
			for( Favorite favorite : user.getFavorites()) {
				System.out.println("in foreach");
				if(!(fav.equals(favorite))){
					em.persist(fav);
					break;
				}
			}
			
		}
		user.addFavorites(fav);
	}

	public void deleteFavorite(SuperPersons sp, User user)
	{
		String query = "SELECT f from Favorite f where f.superPerson.id = " + sp.getId() + " AND f.user.id= " + user.getId() + "";
		System.out.println("before create query");
		System.out.println(query);
		Favorite fav = em.createQuery(query, Favorite.class).getSingleResult();
		user.removeFavorites(fav);
		em.remove(fav);
	}
	public User refreshUser(User user){
		user = em.merge(user);
		em.refresh(user);
		return user;
	}
}
