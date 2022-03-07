package Filter;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import Dao.VideoDAO;
import Entity.Video;

/**
 * Servlet Filter implementation class ViewCountFilter
 */
@WebFilter("/detail")
public class ViewCountFilter extends HttpFilter implements Filter {

	Video video;
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String vid = request.getParameter("vid");
		VideoDAO vdao = new VideoDAO();
		if (vid != null) {
			video = new Video();
			video = vdao.findById(vid);
			try {
				Thread viewCount = new Thread() {
					public void run() {
						for (int i = 0; i <= 10; i++) {
							try {
								Thread.sleep(1000);
								if (i == 10) {
									video.setViews(video.getViews() + 1);
									vdao.update(video);
									return;
								}
							} catch (InterruptedException e) {

							}
						}
					}
				};
				viewCount.start();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		chain.doFilter(request, response);
	}

}
