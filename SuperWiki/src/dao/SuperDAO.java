package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.SuperPersons;

@Transactional
public class SuperDAO {
	@PersistenceContext
	private EntityManager em;
	
	public SuperPersons getByName(String name) {
		return em.createNamedQuery("SuperPersons.getName",SuperPersons.class).setParameter("name", name).getSingleResult();
	}
	
	public SuperPersons getById(int Id) {
		return em.find(SuperPersons.class, Id); 
	}
	
	public List<SuperPersons> getAllSuperheroes()
	{
		return em.createQuery("select s from SuperPersons s", SuperPersons.class).getResultList();
	}
}
