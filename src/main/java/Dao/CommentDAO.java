package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Entity.Comment;
import Utils.JpaUtils;

public class CommentDAO {
	protected EntityManager em = JpaUtils.getEntityManager();

	public List<Comment> findFavoriteByIdUser(String vid) {
		String jpql = "SELECT o FROM Comment o WHERE o.video.id=:vid";
		TypedQuery<Comment> query = em.createQuery(jpql, Comment.class);
		query.setParameter("vid", vid);
		return query.getResultList();
	}

	public Integer findCountCommentByIbVideo(String vid) {
		try {
			EntityManager em = JpaUtils.getEntityManager();
			String sql = "select COUNT(videoid) from comment where videoId = :vid group by videoId";
			Query query = em.createNativeQuery(sql);
			query.setParameter("vid", vid);
			return (Integer) query.getSingleResult();
		} catch (Exception e) {
			return 0;
		}
	}

	public Comment findOne(Long cid, String vid, String uid) {
		String jpql = "SELECT o FROM Comment o WHERE o.id=:cid AND o.video.id=:vid AND o.user.id=:uid";
		TypedQuery<Comment> query = em.createQuery(jpql, Comment.class);
		query.setParameter("cid", cid);
		query.setParameter("vid", vid);
		query.setParameter("uid", uid);
		List<Comment> list = query.getResultList();
		if (!list.isEmpty()) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public void create(Comment entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	public void delete(Long cid, String videoId, String userId) {
		try {
			em.getTransaction().begin();
			Comment entity = findOne(cid, videoId, userId);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
