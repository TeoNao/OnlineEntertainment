package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.Favorite;
import Entity.FavoriteTop;
import Utils.JpaUtils;

public class FavoriteDAO {
	protected EntityManager em = JpaUtils.getEntityManager();

	public List<Favorite> findAll() {
		String jpql = "SELECT o FROM Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		return query.getResultList();
	}
	
	public List<FavoriteTop> findTop10Favorite() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT new FavoriteTop(o.video.id, o.video.title, count(o) as likes) "
				+ "FROM Favorite o " + "GROUP BY o.video.id, o.video.title ORDER BY likes DESC";
		TypedQuery<FavoriteTop> query = em.createQuery(jpql, FavoriteTop.class);
		return query.getResultList();
	}

	public List<Favorite> findFavoriteByIdUser(String id) {
		String jpql = "SELECT o FROM Favorite o WHERE o.user.id=:id";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

	public List<Favorite> findByKeywordVideo(String keyword) {
		String jpql = "SELECT o FROM Favorite o WHERE o.video.title LIKE :keyword";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("keyword", "%"+keyword+"%");
		return query.getResultList();
	}

	public Favorite findOne(String videoId, String userId) {
		String jpql = "SELECT o FROM Favorite o WHERE o.video.id=:videoId AND o.user.id=:userId";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("videoId", videoId);
		query.setParameter("userId", userId);
		List<Favorite> list = query.getResultList();
		if (!list.isEmpty()) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public void create(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public void delete(String videoId, String userId) {
		try {
			em.getTransaction().begin();
			Favorite entity = findOne(videoId, userId);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

}
