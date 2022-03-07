package Servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import Dao.FavoriteDAO;
import Dao.ReportDAO;
import Dao.ShareDAO;
import Dao.UserDAO;
import Dao.VideoDAO;
import Entity.Share;
import Entity.User;
import Entity.Video;

/**
 * Servlet implementation class AdminServlet
 */
@MultipartConfig
@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");

		VideoDAO vdao = new VideoDAO();
		UserDAO udao = new UserDAO();
		ReportDAO rdao = new ReportDAO();
		FavoriteDAO fdao = new FavoriteDAO();
		ShareDAO sdao = new ShareDAO();
		String uri = req.getRequestURI();
		String method = req.getMethod();
		Video video = null;

		if (uri.contains("editvideo")) {
			String idVideo = req.getParameter("vid");
			if (idVideo != null) {
				video = vdao.findById(idVideo);
				req.setAttribute("item", video);
			}
			req.setAttribute("video", vdao.findAll());
			req.getRequestDispatcher("/views/admin/editvideo.jsp").forward(req, resp);
		}
		if (uri.contains("delete-video")) {
			this.handelVideo("delete", req, resp);
			resp.sendRedirect("/OnlineEntertaiment/admin/editvideo");
		}
		if (uri.contains("create-video")) {
			this.handelVideo("create", req, resp);
			resp.sendRedirect("/OnlineEntertaiment/admin/editvideo");
		}
		if (uri.contains("update-video")) {
			this.handelVideo("update", req, resp);
			resp.sendRedirect("/OnlineEntertaiment/admin/editvideo");
		}
		if (uri.contains("edituser")) {
			String idUser = req.getParameter("uid");
			if (idUser != null) {
				User user = udao.findById(idUser);
				req.setAttribute("item", user);
			}
			req.setAttribute("users", udao.findAll());
			req.getRequestDispatcher("/views/admin/edituser.jsp").forward(req, resp);
		}
		if (uri.contains("create-user")) {
			this.handelUser("create", req, resp);
			resp.sendRedirect("/OnlineEntertaiment/admin/edituser");
		}
		if (uri.contains("delete-user")) {
			this.handelUser("delete", req, resp);
			resp.sendRedirect("/OnlineEntertaiment/admin/edituser");
		}
		if (uri.contains("update-user")) {
			this.handelUser("update", req, resp);
			resp.sendRedirect("/OnlineEntertaiment/admin/edituser");
		}

		if (uri.contains("report")) {
			String keyword = req.getParameter("keyword");
			req.setAttribute("favorite", rdao.findReport());
			if (method.equalsIgnoreCase("POST") && uri.contains("user")) {
				req.setAttribute("favoriteuser", fdao.findByKeywordVideo(keyword));
			} else {
				req.setAttribute("favoriteuser", fdao.findAll());
			}
			if (method.equalsIgnoreCase("POST") && uri.contains("email")) {
				req.setAttribute("shares", sdao.findByKeywordShare(keyword));
			} else {
				req.setAttribute("shares", sdao.findAll());
			}
			req.getRequestDispatcher("/views/admin/report.jsp").forward(req, resp);
		}
	}

	protected void handelVideo(String parren, HttpServletRequest req, HttpServletResponse resp) {
		VideoDAO vdao = new VideoDAO();
		Video video = new Video();
		try {
			BeanUtils.populate(video, req.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}

		File dir = new File(req.getServletContext().getRealPath("/upload/images/poster"));
		if (!dir.exists()) {
			dir.mkdirs();
		}

		switch (parren) {
		case "create": {
			try {
				Part photo = req.getPart("poster");
				File photoFile = new File(dir, photo.getSubmittedFileName());
				photo.write(photoFile.getAbsolutePath());

				File oldFile = new File(photoFile.getAbsolutePath());
				File newFile = new File(dir + "\\" + video.getId() + ".jpg");
				oldFile.renameTo(newFile);
				video.setPoster(newFile.getName());
			} catch (Exception e) {
				e.printStackTrace();
			}
			vdao.create(video);
			return;
		}
		case "delete": {
			try {
				video = vdao.findById(video.getId());
				File photoFile = new File(dir, video.getPoster());
				photoFile.delete();
			} catch (Exception e) {
				e.printStackTrace();
			}
			vdao.delete(video.getId());
			return;
		}
		case "update": {
			try {
				Part photo = req.getPart("poster");
				File imgFile = new File(dir + "\\" + video.getId() + ".jpg");
				if (photo.getSize() != 0) {
					imgFile.delete();
					File photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());
					File oldFile = new File(photoFile.getAbsolutePath());
					oldFile.renameTo(imgFile);
				}
				video.setPoster(imgFile.getName());
			} catch (Exception e) {
				e.printStackTrace();
			}
			vdao.update(video);
			return;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + parren);
		}
	}

	protected void handelUser(String parren, HttpServletRequest req, HttpServletResponse resp) {
		UserDAO udao = new UserDAO();
		User user = new User();
		try {
			BeanUtils.populate(user, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		switch (parren) {
		case "create": {
			udao.create(user);
			return;
		}
		case "delete": {
			udao.delete(user.getId());
			return;
		}
		case "update": {
			udao.update(user);
			return;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + parren);
		}
	}

}
