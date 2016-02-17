package superHeroTest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class SuperTest {
	public static void main(String[] args)
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("MyPU");
		EntityManager em = emf.createEntityManager();
		 em.getTransaction().begin();
		System.out.println("before query");
//		SuperTeam st = em.find(SuperTeam.class, 1);
		User user = em.find(User.class, 1);
		SuperPersons superPerson = em.find(SuperPersons.class, 1);
		Favorite fav = new Favorite(user, superPerson);
		System.out.println(em.contains(fav));
		em.persist(fav);
		System.out.println(em.contains(fav));
		em.getTransaction().commit();
		em.close();
		emf.close();
	}
}
