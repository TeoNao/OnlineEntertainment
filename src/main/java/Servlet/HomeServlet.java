package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FavoriteDAO;
import Dao.VideoDAO;
import Entity.FavoriteTop;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO vdao = new VideoDAO();
		FavoriteDAO fdao = new FavoriteDAO();
		String uri = req.getRequestURI();
		req.setAttribute("videos", vdao.findAll());
		req.setAttribute("videostopviews", vdao.findTop10Views());
		req.setAttribute("videostopfavorite", fdao.findTop10Favorite());
		if (uri.contains("home")) {
			req.getRequestDispatcher("/views/user/index.jsp").forward(req, resp);
		}
	}
}