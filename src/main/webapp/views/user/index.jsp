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
<link rel="stylesheet" href="https://wowjs.uk/css/libs/animate.css">
<style type="text/css">
	<jsp:include page="/views/style_all.css"></jsp:include>
</style>
<title>OnlineEntertaiment</title>
</head>
<body class="bg-dark">

	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<!--Main Navigation-->
	<header>
		<!-- Navbar -->
		<jsp:include page="nav.jsp"></jsp:include>
		<!-- Navbar -->

		<!-- Carousel wrapper -->
		<div id="introCarousel"
			class="carousel slide carousel-fade shadow-2-strong"
			data-mdb-ride="carousel">

			<!-- Inner -->
			<div class="carousel-inner">
				<!-- Single item -->
				<div class="carousel-item active bg-1" style="height: 50vh;">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center">
								<h1 class="mb-3">Attack on Titan</h1>
								<h5 class="mb-4">The film with the highest grossing grosses
									in 2021</h5>
								<h5 class="mb-4">Best movie 2022</h5>
								<a class="btn btn-outline-light btn-lg m-2"
									href="/OnlineEntertaiment/detail?vid=cvTipU9gN5g" role="button"
									rel="nofollow" target="_blank">Movie</a>
							</div>
						</div>

					</div>

				</div>

				<!-- Single item -->
				<div class="carousel-item bg-2" style="height: 50vh;">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-left">
								<h1 class="mb-3">Spidermen No Way Home</h1>
								<h5 class="mb-4">The film with the highest grossing grosses
									in 2021</h5>
								<a class="btn btn-outline-light btn-lg m-2"
									href="/OnlineEntertaiment/detail?vid=3Svs_hl897c" role="button"
									rel="nofollow" target="_blank">Movie</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Single item -->
				<div class="carousel-item bg-3" style="height: 50vh;">
					<div class="mask"
						style="background: linear-gradient(45deg, rgba(29, 236, 198, 0.226), rgba(91, 14, 214, 0.7) 100%);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center" style="text-align: right;">
								<h2>Avengers</h2>
								<a class="btn btn-outline-light btn-lg m-2"
									href="/OnlineEntertaiment/detail?vid=APuAy8pmZ0M"
									target="_blank" role="button">Movie</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Inner -->

			<!-- Controls -->
			<a class="carousel-control-prev" href="#introCarousel" role="button"
				data-mdb-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#introCarousel" role="button"
				data-mdb-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<!-- Carousel wrapper -->
	</header>
	<!--Main Navigation-->

	<!--Main layout-->
	<main class="mt-5">
		<div class="container">
			<!-- Section: Basic example -->
			<section class="">
				<h4>
					<strong style="color: rgba(255, 255, 255, 0.7);">Phim được
						xem nhiều nhất.</strong>
				</h4>
				<hr class="bg-light" style="margin-top: -5px; margin-bottom: -50px;" />
				<div class="text-light my-5">
					<!-- Carousel wrapper -->
					<div id="carouselBasicExample1"
						class="carousel slide carousel-dark text-center"
						data-mdb-ride="carousel">
						<!-- Controls -->
						<div class="d-flex justify-content-center position-relative">
							<!-- Inner -->
							<div class="carousel-inner py-4">
								<!-- Single item -->
								<div class="carousel-item active" style="width: 100%;">
									<div class="row">
										<c:forEach var="item" items="${videostopviews}"
											varStatus="count">
											<c:if test="${count.count<5}">
												<jsp:include page="card_slide.jsp">
													<jsp:param value="${item.title}" name="title" />
													<jsp:param value="${item.poster}" name="poster" />
													<jsp:param value="${item.id}" name="id" />
													<jsp:param value="${item.views} views" name="event" />
												</jsp:include>
											</c:if>
										</c:forEach>
									</div>
								</div>

								<!-- Single item -->
								<div class="carousel-item">
									<div class="row">
										<c:forEach var="item" items="${videostopviews}"
											varStatus="count">
											<c:if test="${count.count>4 && count.count<9}">
												<jsp:include page="card_slide.jsp">
													<jsp:param value="${item.title}" name="title" />
													<jsp:param value="${item.poster}" name="poster" />
													<jsp:param value="${item.id}" name="id" />
													<jsp:param value="${item.views} views" name="event" />
												</jsp:include>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- Inner -->
							<button
								class="bg-dark carousel-control-prev position-absolute top-50 start-0 translate-middle"
								style="width: 50px; height: 80%; margin-left: 25px;"
								type="button" data-mdb-target="#carouselBasicExample1"
								data-mdb-slide="prev">
								<i class="fas fa-angle-left"></i>
							</button>
							<button
								class="bg-dark carousel-control-next position-absolute top-50 start-100 translate-middle"
								style="width: 50px; height: 80%; margin-left: -25px;"
								type="button" data-mdb-target="#carouselBasicExample1"
								data-mdb-slide="next">
								<i class="fas fa-angle-right"></i>
							</button>
						</div>
					</div>
				</div>
			</section>
			<!-- Section: Basic example -->
			<section class="" style="margin-top: -40px">
				<h4>
					<strong style="color: rgba(255, 255, 255, 0.7);">Phim được
						yêu thích nhiều nhất</strong>
				</h4>
				<hr class="bg-light" style="margin-top: -5px; margin-bottom: -50px;" />
				<div class="text-light my-5">
					<!-- Carousel wrapper -->
					<div id="carouselBasicExample"
						class="carousel slide carousel-dark text-center"
						data-mdb-ride="carousel">
						<!-- Controls -->
						<div class="d-flex justify-content-center mb-4 position-relative">
							<!-- Inner -->
							<div class="carousel-inner py-4">
								<!-- Single item -->
								<div class="carousel-item active" style="width: 100%;">
									<div class="row">
										<c:forEach var="item" items="${videostopfavorite}"
											varStatus="count">
											<c:if test="${count.count<5}">
												<jsp:include page="card_slide.jsp">
													<jsp:param value="${item.title}" name="title" />
													<jsp:param value="${item.id}.jpg" name="poster" />
													<jsp:param value="${item.id}" name="id" />
													<jsp:param value="${item.likes} like" name="event" />
												</jsp:include>
											</c:if>
										</c:forEach>
									</div>
								</div>

								<!-- Single item -->
								<div class="carousel-item">
									<div class="row">
										<c:forEach var="item" items="${videostopfavorite}"
											varStatus="count">
											<c:if test="${count.count>4 && count.count<9}">
												<jsp:include page="card_slide.jsp">
													<jsp:param value="${item.title}" name="title" />
													<jsp:param value="${item.id}.jpg" name="poster" />
													<jsp:param value="${item.id}" name="id" />
													<jsp:param value="${item.likes} like" name="event" />
												</jsp:include>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- Inner -->
							<button
								class="bg-dark carousel-control-prev position-absolute top-50 start-0 translate-middle"
								style="width: 50px; height: 80%; margin-left: 25px;"
								type="button" data-mdb-target="#carouselBasicExample"
								data-mdb-slide="prev">
								<i class="fas fa-angle-left"></i>
							</button>
							<button
								class="bg-dark carousel-control-next position-absolute top-50 start-100 translate-middle"
								style="width: 50px; height: 80%; margin-left: -25px;"
								type="button" data-mdb-target="#carouselBasicExample"
								data-mdb-slide="next">
								<i class="fas fa-angle-right"></i>
							</button>
						</div>

					</div>
					<!-- Carousel wrapper -->
				</div>

			</section>
			<!--Section: Content-->
			<section class="" style="margin-top: -30px;">
				<h4>
					<strong style="color: rgba(255, 255, 255, 0.7);">Phim mới
						nhất.</strong>
				</h4>
				<hr class="bg-light" style="margin-top: -5px; margin-bottom: 30px;" />
				<div class="row wow bounceInUp">
					<c:forEach var="item" items="${videos}">
						<jsp:include page="card_list.jsp">
							<jsp:param value="${item.poster}" name="poster" />
							<jsp:param value="${item.title}" name="title" />
							<jsp:param value="${item.views}" name="views" />
							<jsp:param value="${item.id}" name="id" />
							<jsp:param value="far fa-heart" name="icon" />
							<jsp:param value="like" name="link" />
						</jsp:include>
					</c:forEach>
				</div>
			</section>
			<!--Section: Content-->

			<hr class="my-5" />
			<section class="text-center">
				<div aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</div>
			</section>
		</div>
	</main>
	<!--Main layout-->

	<!-- Modal -->
	<div class="modal left fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-mdb-backdrop="true" data-mdb-keyboard="true">
		<jsp:include page="sendgmail.jsp"></jsp:include>
	</div>
	<div class="modal left fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-mdb-backdrop="true" data-mdb-keyboard="true">
		<jsp:include page="login.jsp"></jsp:include>
	</div>
	<!-- Footer -->
	<footer class="text-center text-lg-start bg-light text-muted">
		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block">
				<span>Get connected with us on social networks:</span>
			</div>
			<!-- Left -->

			<!-- Right -->
			<div>
				<a href="" class="me-4 text-reset"> <i class="fab fa-facebook-f"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-twitter"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-google"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-instagram"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-linkedin"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-github"></i>
				</a>
			</div>
			<!-- Right -->
		</section>
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class="">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Company name
						</h6>
						<p>Here you can use rows and columns to organize your footer
							content. Lorem ipsum dolor sit amet, consectetur adipisicing
							elit.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Products</h6>
						<p>
							<a href="#!" class="text-reset">Angular</a>
						</p>
						<p>
							<a href="#!" class="text-reset">React</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Vue</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Laravel</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
						<p>
							<a href="#!" class="text-reset">Pricing</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Settings</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Orders</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Help</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
						<p>
							<i class="fas fa-home me-3"></i> New York, NY 10012, US
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> info@example.com
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> + 01 234 567 88
						</p>
						<p>
							<i class="fas fa-print me-3"></i> + 01 234 567 89
						</p>
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
		</section>
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">
			© 2021 Copyright: <a class="text-reset fw-bold"
				href="https://mdbootstrap.com/">MDBootstrap.com</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->
	<!--Footer-->
	<!-- MDB -->
	<script src="https://wowjs.uk/dist/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>

</body>

</html>