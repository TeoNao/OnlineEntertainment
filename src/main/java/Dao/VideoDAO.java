package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Entity.Video;
import Utils.JpaUtils;

public class VideoDAO {
	protected EntityManager em = JpaUtils.getEntityManager();

	public List<Video> findAll() {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> findTop10Views() {
		String sql = "SELECT TOP 10 * FROM video ORDER BY views DESC;";
		Query query = em.createNativeQuery(sql, Video.class);
		return query.getResultList();
	}

	public Video findById(String key) {
		Video user = em.find(Video.class, key);
		return user;
	}

	public List<Video> findRandom() {
		String sql = "SELECT TOP 10 * FROM Video ORDER BY newid()";
		Query query = em.createNativeQuery(sql, Video.class);
		return query.getResultList();
	}

	public void create(Video entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public void update(Video entity) {
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
			Video entity = findById(key);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
