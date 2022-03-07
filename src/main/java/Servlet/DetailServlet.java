package Servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CommentDAO;
import Dao.FavoriteDAO;
import Dao.HistoryDAO;
import Dao.ReportDAO;
import Dao.VideoDAO;
import Entity.Comment;
import Entity.Favorite;
import Entity.History;
import Entity.User;
import Utils.Auth;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet({ "/detail", "/comment", "/delcomment" })
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO vdao = new VideoDAO();
		ReportDAO rdao = new ReportDAO();
		FavoriteDAO fdao = new FavoriteDAO();
		HistoryDAO hdao = new HistoryDAO();
		CommentDAO cdao = new CommentDAO();
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String uri = req.getRequestURI();
		String vid = req.getParameter("vid");
		if (uri.contains("detail")) {
			req.setAttribute("videos", vdao.findRandom());
			req.setAttribute("video", vdao.findById(vid));
			req.setAttribute("reportvideo", rdao.findReportByVideo(vid));
			req.setAttribute("comment", cdao.findFavoriteByIdUser(vid));
			req.setAttribute("countcomment", cdao.findCountCommentByIbVideo(vid));
			try {
				Favorite favorite = fdao.findOne(vid, user.getId());
				if (favorite == null) {
					req.setAttribute("isfavorite", "Like");
				} else {
					req.setAttribute("isfavorite", "Unlike");
				}
			} catch (Exception e) {
				req.setAttribute("isfavorite", "Like");
			}
			if (Auth.user(req) != null) {
				if (hdao.findOne(vid, Auth.user(req).getId()) == null) {
					History history = new History();
					history.setUser(Auth.user(req));
					history.setVideo(vdao.findById(vid));
					hdao.create(history);
				}
			}
			req.getRequestDispatcher("/views/user/detail.jsp").forward(req, resp);
		}
		if (uri.contains("comment")) {
			Comment comment = new Comment();
			comment.setUser(Auth.user(req));
			comment.setVideo(vdao.findById(vid));
			if (uri.contains("del")) {
				Long cid = Long.valueOf(req.getParameter("cid"));
				if (cdao.findOne(cid, vid, Auth.user(req).getId()) != null) {
					cdao.delete(cid, vid, Auth.user(req).getId());
				}
			} else {
				comment.setContent(req.getParameter("comment"));
				cdao.create(comment);
			}

			resp.sendRedirect("/OnlineEntertaiment/detail?vid=" + vid);
		}
	}

}
