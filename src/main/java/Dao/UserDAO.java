package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.User;
import Entity.Video;
import Utils.JpaUtils;

public class UserDAO {
	protected EntityManager em = JpaUtils.getEntityManager();	
	
	public List<User> findAll() {
		String jpql = "SELECT o FROM User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		return query.getResultList();
	}
	
	public User findOne(String username, String password) {
		String jpql = "SELECT o FROM User o WHERE o.id=:id AND o.password=:pw";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("id", username);
		query.setParameter("pw", password);
		List<User> list = query.getResultList();
		if (!list.isEmpty()) {
			return list.get(0);
		}else {
			return null;
		}	
	}
	
	public User findById(String key) {
		User user = em.find(User.class, key);
		return user;
	}
	
	public void create(User entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public void update(User entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public void delete(String key) {
		try {
			em.getTransaction().begin();
			User entity = findById(key);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
