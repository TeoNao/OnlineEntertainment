package Servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.FavoriteDAO;
import Dao.ShareDAO;
import Dao.VideoDAO;
import Entity.Favorite;
import Entity.Share;
import Entity.User;
import Utils.Auth;
import Utils.XMail;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet({ "/favorite", "/like", "/unlike", "/detlike", "/share" })
public class FavoriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		FavoriteDAO fdao = new FavoriteDAO();
		VideoDAO vdao = new VideoDAO();
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		Favorite favorite = new Favorite();
		String vid = req.getParameter("vid");

		if (uri.contains("favorite")) {
			req.setAttribute("favorite", fdao.findFavoriteByIdUser(user.getId()));
			req.getRequestDispatcher("/views/user/favorite.jsp").forward(req, resp);
		}
		if (uri.contains("like")) {
			favorite.setUser(user);
			favorite.setVideo(vdao.findById(vid));
			this.handelFavorite("create", favorite, req, resp);
			if (uri.contains("unlike")) {
				resp.sendRedirect("/OnlineEntertaiment/favorite");
			} else if (uri.contains("detlike")) {
				resp.sendRedirect("/OnlineEntertaiment/detail?vid=" + vid);
			} else {
				resp.sendRedirect("/OnlineEntertaiment/home");
			}
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String vid = req.getParameter("vid");
		ShareDAO sdao = new ShareDAO();
		VideoDAO vdao = new VideoDAO();
		Share share = new Share();
		share.setEmails(req.getParameter("to"));
		share.setUser(Auth.user(req));
		share.setVideo(vdao.findById(vid));
		if (uri.contains("share")) {
			String to = req.getParameter("to");
			String subject = "Shared a video";
			String body = "http://localhost:8080/OnlineEntertaiment/detail?vid="+vid;
			XMail.sendMail(Auth.user(req).getEmail(), to, subject, body, req, resp);
			sdao.create(share);
			resp.sendRedirect("/OnlineEntertaiment/detail?vid=" + vid);
		} else {
			req.getRequestDispatcher("/views/user/detail.jsp").forward(req, resp);
		}
	}

	protected void handelFavorite(String parren, Favorite entity, HttpServletRequest req, HttpServletResponse resp) {
		FavoriteDAO fdao = new FavoriteDAO();
		switch (parren) {
		case "create": {
			Favorite fa = fdao.findOne(entity.getVideo().getId(), entity.getUser().getId());
			if (fa == null) {
				fdao.create(entity);
				return;
			}
		}
		case "delete": {
			fdao.delete(entity.getVideo().getId(), entity.getUser().getId());
			return;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + parren);
		}
	}
}
