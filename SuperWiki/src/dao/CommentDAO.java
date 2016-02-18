package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import superHeroTest.Comment;
import superHeroTest.SuperPersons;
import superHeroTest.User;
@Transactional
public class CommentDAO {
	@PersistenceContext
	private EntityManager em;
	
	public void addComment(SuperPersons sp, String message, User user){
		Comment comment = new Comment(sp, message, user);
		em.persist(comment);
	}
}
