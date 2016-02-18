package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.Favorite;
import superHeroTest.SuperPersons;
import superHeroTest.SuperType;
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

	public void addFavorites(SuperPersons sp, User user)
	{
		Favorite fav = new Favorite(user, sp);
		System.out.println(user.getId());
		boolean match = true;
		System.out.print("size = ");
		System.out.println(user.getFavorites().size());
		if (user.getFavorites().size() == 0) {
			user.addFavorites(fav);
			System.out.println("before");
			em.persist(fav);
			System.out.println("after");
		} else {
			for (Favorite favorite : user.getFavorites()) {
				System.out.print("new fav id = ");
				System.out.println(fav.getId());
				System.out.print("fav list id = ");
				System.out.println(favorite.getId());
				System.out.println("if statement");
				if ((favorite.getSuperPerson().getId()) == (fav.getSuperPerson().getId())) {
					// tryin to add a fav that's already in list
					match = false;
					System.out.println("MATCH!!!!!!");
					break;
				}
			}
			if (match) {
				user.addFavorites(fav);
				em.persist(fav);
			}
		}
	}

	public void deleteFavorite(SuperPersons sp, User user)
	{
		String query = "SELECT f from Favorite f where f.superPerson.id = " + sp.getId() + " AND f.user.id= "
				+ user.getId() + "";
		System.out.println("before create query");
		System.out.println(query);
		Favorite fav = em.createQuery(query, Favorite.class).getSingleResult();
		user.removeFavorites(fav);
		em.remove(fav);
	}

	public User refreshUser(User user)
	{
		System.out.println("in refresh user");
		user = em.merge(user);
		em.refresh(user);
		System.out.println("leaving refresh user");
		return user;
	}

	public List<User> getAllUsers()
	{
		return em.createNamedQuery("User.getAllUsers", User.class).getResultList();
	}

	public User getUser(int id)
	{
		return em.find(User.class, id);
	}

	public void deleteUser(User user)
	{
		user = refreshUser(user);
		user.getFavorites().clear();
		//user = refreshUser(user);
		em.remove(user);
	}

}
