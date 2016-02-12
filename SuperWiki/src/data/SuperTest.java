package data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class SuperTest
{
	public static void main(String[] args)
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("MyPU");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		// SuperPersons sp = em.find(SuperPersons.class, 1);
		// sp.setName("Captain America");
		// System.out.println(sp.getName());

		// SuperPersons sp = new SuperPersons();
		// sp.setName("Captain America");
		// sp.setCreated(1941);
		// sp.setCreator("Stan Lee");
		// em.persist(sp);

		SuperPersons sp = em.find(SuperPersons.class, 1);
		// em.remove(sp);

		em.getTransaction().commit();
		em.close();
		emf.close();
	}
}
