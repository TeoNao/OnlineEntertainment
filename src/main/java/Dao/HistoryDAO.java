package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.History;
import Utils.JpaUtils;

public class HistoryDAO {
	protected EntityManager em = JpaUtils.getEntityManager();

	public List<History> findAll() {
		String jpql = "SELECT o FROM History o";
		TypedQuery<History> query = em.createQuery(jpql, History.class);
		return query.getResultList();
	}

	public List<History> findHistoryByIdUser(String id) {
		String jpql = "SELECT o FROM History o WHERE o.user.id=:id";
		TypedQuery<History> query = em.createQuery(jpql, History.class);
		query.setParameter("id", id);
		return query.getResultList();
	}
	
	public History findOne(String vid, String uid) {
		String jpql = "SELECT o FROM History o WHERE o.video.id=:vid AND o.user.id=:uid";
		TypedQuery<History> query = em.createQuery(jpql, History.class);
		query.setParameter("vid", vid);
		query.setParameter("uid", uid);
		List<History> list = query.getResultList();
		if (!list.isEmpty()) {
			return list.get(0);
		}else {
			return null;
		}	
	}

	public void create(History entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
	
	public void delete(String vid, String uid) {
		try {
			em.getTransaction().begin();
			History entity = findOne(vid, uid);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
