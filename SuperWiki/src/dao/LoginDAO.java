package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.Favorite;
import superHeroTest.SuperPersons;
import superHeroTest.User;

@Transactional
public class LoginDAO
{
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
		user.addFavorites(fav);
		em.persist(fav);
	}

	public void deleteFavorite(SuperPersons sp, User user)
	{
		String query = "SELECT f from Favorite f where f.superPerson.id = " + sp.getId() + " AND f.user.id= " + user.getId() + "";
		System.out.println("before create query");
		System.out.println(query);
<<<<<<< HEAD
//		Favorite fav = (Favorite) em.createQuery(query, Favorite.class);
		Favorite fav = em.find(Favorite.class, sp.getId());
		for (Favorite favorite : user.getFavorites())
		{
			System.out.print("favorite = ");
			System.out.println(favorite.toString());
			if (fav.getId() == (favorite.getId()))
			{
				System.out.println(favorite);
				user.removeFavorites(favorite);
			}
		}
		System.out.print("fav = " + fav);
//		((User) user.getFavorites()).removeFavorites(fav);
//		user.removeFavorites(fav);
//		for (Favorite favorite : user.getFavorites())
//		{
//			System.out.print("favorite = ");
//			System.out.println(favorite);
//			if (fav.equals(favorite))
//			{
//				user.removeFavorites(fav);
//			}
//		}
=======
		Favorite fav = em.createQuery(query, Favorite.class).getSingleResult();
		user.removeFavorites(fav);
		em.remove(fav);
>>>>>>> b4e3bb70bb7344dadc6f0e2111b36a3a56b96394
	}

	public User refreshUser(User user)
	{
		user = em.merge(user);
		em.refresh(user);
		return user;
	}
}
