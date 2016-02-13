package superHeroTest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class SuperTest
{
	public static void main(String[] args)
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("MyPU");
		EntityManager em = emf.createEntityManager();
		//em.getTransaction().begin();
		System.out.println("before query");
		 SuperTeam st = em.find(SuperTeam.class, 1);
		// sp.setName("Captain America");
		 List<SuperPersons> members = st.getMembers();
		 for (SuperPersons superPersons : members) {
			System.out.println(superPersons.getName());
		}
		// SuperPersons sp = new SuperPersons();
		// sp.setName("Captain America");
		// sp.setCreated(1941);
		// sp.setCreator("Stan Lee");
		// em.persist(sp);

	//	SuperPersons sp = em.find(SuperPersons.class, 1);
		// em.remove(sp);

		//em.getTransaction().commit();
		em.close();
		emf.close();
	}
}
