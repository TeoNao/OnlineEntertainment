package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.FavoriteDAO;
import Dao.HistoryDAO;
import Dao.VideoDAO;
import Entity.Favorite;
import Entity.User;
import Utils.Auth;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet({ "/history", "/deletehis" })
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String method = req.getMethod();
		String vid = req.getParameter("vid");
		HistoryDAO hdao = new HistoryDAO();
		if (uri.contains("history")) {
			req.setAttribute("history", hdao.findHistoryByIdUser(Auth.user(req).getId()));
			req.getRequestDispatcher("/views/user/history.jsp").forward(req, resp);
		}
		if (uri.contains("deletehis")) {
			hdao.delete(vid, Auth.user(req).getId());
			resp.sendRedirect("/OnlineEntertaiment/history");
		}
	}
}
