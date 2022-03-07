<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/OnlineEntertaiment/style/index.css">
<style type="text/css">
	<jsp:include page="/views/style_all.css"></jsp:include>
</style>
</head>
<body class="bg-dark">
	<title>${video.title}</title>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<header>
		<jsp:include page="nav.jsp"></jsp:include>
	</header>
	<!--Main layout-->
	<main class="mt-3">
		<div class="container">
			<section class="">
				<div class="row">
					<div class="col-md-8">
						<div class="bg-image hover-overlay ripple"
							data-mdb-ripple-color="light">
							<div class="ratio ratio-16x9">
								<iframe width="560" height="315"
									src="https://www.youtube.com/embed/${video.id}?autoplay=1"
									allow='autoplay'></iframe>
							</div>
						</div>
						<div class="mt-3">
							<h5 class="card-title">${video.title}</h5>
							<h5 class="card-text text-white-50"
								style="float: left; font-size: 11pt; margin-top: 2px">${video.views}
								views</h5>

							<div style="float: right;">
								<a onclick="loadMore()"
									href="/OnlineEntertaiment/detlike?vid=${video.id}" id="like"
									class="text-danger"><i class="far fa-heart"
									style="margin-right: 10px;"></i> ${reportvideo.likes}
									${isfavorite} </a> <a href="#!" style="margin-left: 20px;"
									data-mdb-toggle="modal" data-mdb-target="#exampleModal"> <i
									class="fas fa-share" style="margin-right: 10px;"></i>Share
								</a>
							</div>
						</div>
						<hr class="bg-light" style="margin-top: 40px">
						<p class="card-title" style="font-size: 11pt; padding: 0 50px">${video.description}</p>
						<hr class="bg-light">
						<h8 class="text-light float-end">${countcomment} bình luận</h8>
						<form class="col-md-12 mt-4 mb-5"
							action="/OnlineEntertaiment/comment?vid=${video.id}"
							method="post">
							<c:choose>
								<c:when test="${empty sessionScope.user}">
									<label class="form-label text-light" for="form3Example3">Đăng
										nhập đễ bình luận.</label>
								</c:when>
								<c:otherwise>
									<label class="form-label text-light" for="form3Example3">${sessionScope.user.fullname}</label>
								</c:otherwise>
							</c:choose>
							<div class="input-group mb-2">
								<input name="comment" type="search"
									class="form-control rounded bg-dark text-light"
									placeholder="Bình luận công khai..." aria-label="Search"
									aria-describedby="search-addon" />
							</div>
							<button class="btn text-dark shadow-0"
								style="background-color: #3ea6ff; border-radius: 2px; float: right;">Bình
								luận</button>
							<button type="button" class="btn btn-dark shadow-0"
								style="float: right">Huỷ</button>
						</form>
						<div class="col-md-12">
							<c:forEach var="item" items="${comment}" varStatus="count">
								<c:if test="${count.count<5}">
									<div class="card shadow-0 bg-dark"
										style="border: none; margin-bottom: -20px">
										<div
											class="card-body position-relative position-relative-example">
											<h6 class="card-subtitle text-light"
												style="font-size: 10pt; float: left; margin-right: 5px">${item.user.fullname}</h6>
											<h6 class="card-subtitle text-muted" style="font-size: 10pt">
												<c:if test="${item.user.admin==true}">
													<i class="fas fa-xs fa-check-circle text-light"></i>
												</c:if>
												${item.commentDate}
											</h6>
											<p class="card-text text-light"
												style="line-height: 12pt; margin-top: 5px; padding-right: 40px">${item.content}</p>
											<c:if test="${item.user.id==sessionScope.user.id}">
												<a
													href="/OnlineEntertaiment/delcomment?cid=${item.id}&vid=${video.id}"
													class="position-absolute top-0 end-0 mt-4 text-light"
													style="margin-right: 20px"><i
													class="fas fa-xs fa-trash-alt"></i></a>
											</c:if>

										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr class="bg-light">
					</div>
					<div class="col-md-4">
						<c:forEach var="item" items="${videos}">
							<div class="bg-image hover-overlay col-12"
								style="margin-bottom: 10px;" data-mdb-ripple-color="light">
								<div class="col-6" style="float: left;">
									<img
										src="/OnlineEntertaiment/upload/images/poster/${item.poster}"
										class="img-fluid" /> <a
										href="/OnlineEntertaiment/detail?vid=${item.id}">
										<div class="mask"
											style="background-color: rgba(251, 251, 251, 0.15);"></div>
									</a>
								</div>
								<div class="col-6" style="float: left; padding: 0 10px;">
									<h5 class="card-title text-truncate" style="font-size: 12pt;">
										${item.title}</h5>
									<div class="text-white-50"
										style="font-size: 11pt; margin-top: -8px">${item.views}
										views</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</main>
	<!-- Modal -->
	<div class="modal left fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-mdb-backdrop="true" data-mdb-keyboard="true">
		<jsp:include page="sendgmail.jsp">
			<jsp:param value="${video.id}" name="id" />
		</jsp:include>
	</div>
	<div class="modal left fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-mdb-backdrop="true" data-mdb-keyboard="true">
		<jsp:include page="login.jsp"></jsp:include>
	</div>
	<footer class="bg-light text-lg-start"> </footer>
</body>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
</html>