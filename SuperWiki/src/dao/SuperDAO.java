package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class SuperDAO {
	@PersistenceContext
	private EntityManager em;
	
}
