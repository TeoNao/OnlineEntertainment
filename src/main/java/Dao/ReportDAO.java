package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import Entity.Report;
import Utils.JpaUtils;

public class ReportDAO {
	protected EntityManager em = JpaUtils.getEntityManager();

	public List<Report> findReport() {
		String jpql = "SELECT new Report(o.video.title, count(o), max(o.likeDate), min(o.likeDate)) "
				+ "FROM Favorite o " + "GROUP BY o.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		return query.getResultList();
	}

	public Report findReportByVideo(String idVideo) {
		String jpql = "SELECT new Report(o.video.title, count(o), " + "max(o.likeDate), min(o.likeDate)) "
				+ "FROM Favorite o " + "WHERE o.video.id=:idVideo " + "GROUP BY o.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		query.setParameter("idVideo", idVideo);
		List<Report> list = query.getResultList();
		if (!list.isEmpty()) {
			return list.get(0);
		} else {
			return null;
		}
	}
}
