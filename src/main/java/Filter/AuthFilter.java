package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.User;


/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter({"/admin/*", "/favorite", "/like", "/detlike", "/unlike", "/share", "/history", "/deletehis", "/comment", "/delcomment", "/editprofile"})
public class AuthFilter extends HttpFilter implements Filter {
       
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		String error = "";
		if (user == null) {
			error = response.encodeURL("Vui lòng đăng nhập!");
		}else if (!user.getAdmin() && uri.contains("/admin/")) {
			error = response.encodeURL("Vui lòng đăng nhập với vai trò admin!");
		}
		if (!error.isEmpty()) {
			request.getSession().setAttribute("securi", uri);
			response.sendRedirect("/OnlineEntertaiment/home?error="+response.encodeURL(error));
		}else {
			chain.doFilter(request, response);
		}
	}

}
