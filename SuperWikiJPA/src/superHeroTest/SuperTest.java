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
		Comment comment = em.find(Comment.class, 8);
		comment.setMessage("changing a message");
		em.persist(comment);
		System.out.println(em.contains(comment));
		
		em.getTransaction().commit();
		em.close();
		emf.close();
	}
}
