package Filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.User;

/**
 * Servlet Filter implementation class LoggerFilter
 */
@WebFilter("/admin/*")
public class LoggerFilter extends HttpFilter implements Filter {

	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		User user = (User) request.getSession().getAttribute("user");
		String uri = request.getRequestURI();
		Date time = new Date();
		chain.doFilter(request, response);
	}

}
