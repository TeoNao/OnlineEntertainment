package Servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import Dao.UserDAO;
import Entity.User;
import Utils.XMail;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet({ "/login", "/logout", "/forgotpass", "/register", "/editprofile" })
public class AccountServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String method = req.getMethod();

		if (uri.contains("login")) {
			if (method.equalsIgnoreCase("POST")) {
				this.doLogin(req, resp);
				resp.sendRedirect("/OnlineEntertaiment/home");
			}
		}
		if (uri.contains("logout")) {
			this.doLogout(req, resp);
			resp.sendRedirect("/OnlineEntertaiment/home");
		}
		if (uri.contains("forgotpass")) {
			if (method.equalsIgnoreCase("POST")) {
				this.doForgotPassword(req, resp);
			}else {
				req.getRequestDispatcher("/views/user/forgotpass.jsp").forward(req, resp);
			}
		}
		if (uri.contains("register")) {
			if (method.equalsIgnoreCase("POST")) {
				this.handelAccount("create", req, resp);
			} else {
				req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
			}
		}
		if (uri.contains("editprofile")) {
			if (method.equalsIgnoreCase("POST")) {
				this.handelAccount("update", req, resp);
			} else {
				req.getRequestDispatcher("/views/user/editprofile.jsp").forward(req, resp);
			}
		}
	}

	protected void doLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		if (!username.equals("") || !password.equals("")) {
			User user = udao.findOne(username, password);
			if (user != null) {
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
			}
		}
	}

	protected void doLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
	}
	
	protected void doForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAO();
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String erro = "";
		
		if (!username.equals("") || !email.equals("")) {
			User user = new User();
			user = udao.findById(username);
			if (user != null) {
				if (user.getEmail().equalsIgnoreCase(email)) {
					
//					String passNew = String.valueOf(Math.random()*1000000).substring(0, 6);
//					user.setPassword(passNew);
//					udao.update(user);
					
					String from = "thaipro1321@gmail.com";
					String to = req.getParameter("email");
					String subject = "Forgot Password";
					String body = "Mật khẩu cũ của bạn là: " + user.getPassword()
							+ " Login: http://localhost:8080/OnlineEntertaiment/home";
					XMail.sendMail(from, to, subject, body, req, resp);
					req.setAttribute("message", "Vui lòng kiểm tra Gmail: "+user.getEmail());
					req.getRequestDispatcher("/views/user/forgotpass.jsp").forward(req, resp);
				}else {
					erro = "Email không đúng!";
				}
			}else {
				erro = "Tài khoản không tồn tại!";
			}
		}else {
			erro = "Vui lòng nhập đầy đủ thông tin!";
		}
		if (!erro.isEmpty()) {
			req.setAttribute("message", erro);
			req.getRequestDispatcher("/views/user/forgotpass.jsp").forward(req, resp);
		}
	}

	public static void main(String[] args) {
		Random ran = new Random();
		System.out.println();
	}

	protected void handelAccount(String parren, HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		User user = new User();
		UserDAO udao = new UserDAO();
		HttpSession session = req.getSession();
		String erro = "";
		try {
			BeanUtils.populate(user, req.getParameterMap());
			if (!user.getId().isEmpty()) {
				if (user.getPassword().equalsIgnoreCase(req.getParameter("password1"))) {
					switch (parren) {
					case "create": {
						if (udao.findById(user.getId()) == null) {
							udao.create(user);
							session.setAttribute("user", user);
							resp.sendRedirect("/OnlineEntertaiment/home");
						} else {
							req.setAttribute("message", "Tài khoản đã tồn tại!");
							req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
						}
						return;
					}
					case "update": {
						User ssUser = (User) session.getAttribute("user");
						if (ssUser.getId().equalsIgnoreCase(user.getId())) {
							udao.update(user);
							session.setAttribute("user", user);
							resp.sendRedirect("/OnlineEntertaiment/home");
						} else {
							req.setAttribute("message", "Tài khoản không đúng!");
							req.getRequestDispatcher("/views/user/editprofile.jsp").forward(req, resp);
						}
						return;
					}
					default:
						throw new IllegalArgumentException("Unexpected value: ");
					}
				}else {
					erro = "Nhập lại mật khẩu không đúng!";
				}
			}else {
				erro = "Chưa nhập tài khoản!";
			}
		} catch (Exception e) {
			erro = "Cập nhật thất bại!";
		}
		if (!erro.isEmpty()) {
			req.setAttribute("message", erro);
			req.getRequestDispatcher("/views/user/"+req.getRequestURI().substring(20)+".jsp").forward(req, resp);
		}

	}
}
