package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.SuperPersonType;
import superHeroTest.SuperPersons;
import superHeroTest.SuperType;

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
		return em.createQuery("select s from SuperPersons s JOIN SuperPersonType sp ON s.id = sp.superPerson.id WHERE sp.superType = :supertype", SuperPersons.class).setParameter("supertype", SuperType.superhero).getResultList();
	}
	public List<SuperPersons> getAllVillains()
	{
		return em.createQuery("select s from SuperPersons s JOIN SuperPersonType sp ON s.id = sp.superPerson.id WHERE sp.superType = :supertype", SuperPersons.class).setParameter("supertype", SuperType.villain).getResultList();
	}
}