package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.Share;
import Utils.JpaUtils;

public class ShareDAO {
	protected EntityManager em = JpaUtils.getEntityManager();

	public List<Share> findAll() {
		String jpql = "SELECT o FROM Share o";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		return query.getResultList();
	}

	public List<Share> findByKeywordShare(String keyword) {
		String jpql = "SELECT o FROM Share o WHERE o.video.title LIKE :keyword";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		query.setParameter("keyword", "%"+keyword+"%");
		return query.getResultList();
	}

	public void create(Share entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
