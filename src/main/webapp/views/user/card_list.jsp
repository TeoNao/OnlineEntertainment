<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div
	class="col-lg-3 col-md-4 mb-4 position-relative position-relative-example">
	<div class="bg-image hover-overlay ripple"
		data-mdb-ripple-color="light" id="box-card">
		<img style="width: 100%;"
			src="/OnlineEntertaiment/upload/images/poster/${param.poster}"
			class="img-fluid" /> <a
			href="/OnlineEntertaiment/detail?vid=${param.id}">
			<div class="mask"
				style="background-color: rgba(128, 128, 128, 0.233);"></div>
		</a>
		<div class="position-absolute top-50 start-50 translate-middle"
			id="ls-btn">
			<a href="/OnlineEntertaiment/${param.link}?vid=${param.id}"
				class="btn btn-danger btn-floating"> <i
				class="${param.icon}"></i>
			</a> <a href="#" data-mdb-toggle="modal" data-mdb-target="#exampleModal"
				class="btn btn-primary btn-floating"
				> <i class="fas fa-share"></i>
			</a>
		</div>
	</div>
	<div class="mt-2">
		<h8 class="card-title">${param.title}</h8>
		<p class="card-text text-white-50" style="font-size: 10pt">${param.views}
			views</p>
	</div>
</div>
