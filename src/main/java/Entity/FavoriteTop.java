package Entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class FavoriteTop {
		@Id
		Serializable id;
		Serializable title;
		Long likes;
		
		public FavoriteTop() {}
		
		public FavoriteTop(Serializable id, Serializable title, Long likes) {
			super();
			this.id = id;
			this.likes = likes;
			this.title = title;
		}

		public Serializable getId() {
			return id;
		}

		public void setId(Serializable id) {
			this.id = id;
		}

		public Serializable getTitle() {
			return title;
		}

		public void setTitle(Serializable title) {
			this.title = title;
		}

		public Long getLikes() {
			return likes;
		}

		public void setLikes(Long likes) {
			this.likes = likes;
		}

		
		
}
