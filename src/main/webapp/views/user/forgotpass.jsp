<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>Forgot Password</title>
</head>

<body class="bg-dark">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-dark d-lg-block"
		style="z-index: 2000;">
		<div class="container">
			<!-- Navbar brand -->
			<a class="navbar-brand nav-link" href="home"> <strong>ONLINE
					ENTERTAIMENT</strong>
			</a>
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
				aria-controls="navbarExample01" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarExample01">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>

				<ul class="navbar-nav list-inline">
					<!-- Dropdown -->
					<li class="nav-item dropdown"><a class="nav-link" href="/OnlineEntertaiment/home"
						id="navbarDropdown" role="button" aria-expanded="false">
						Login
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="mb-5 mt-5">
		<h4 class="mb-5 text-center text-light">
			<strong>Forgot Password</strong>
		</h4>
		<div class="row d-flex justify-content-center">
			<div class="col-md-6">
				<form action="/OnlineEntertaiment/forgotpass" method="post">
					<!-- 2 column grid layout with text inputs for the first and last names -->
					<div class="row mb-4">
						<div class="col">
							<div class="form-outline"> 
								<input name="username" type="text" id="form3Example1" class="form-control text-light" /> <label
									class="form-label text-light" for="form3Example1">User
									name</label>
							</div>
						</div>
					</div>

					<!-- Email input -->
					<div class="form-outline mb-4">
						<input name="email" type="email" id="form3Example3" class="form-control text-light" /> <label
							class="form-label text-light" for="form3Example3">Email
							address</label>
					</div>
					<div class="text-center">
						<p class="text-muted">
							Not a member? <a href="/OnlineEntertaiment/register">Register</a>
						</p>
					</div>
					<!-- Submit button -->
					<button class="btn btn-primary btn-block mb-4">
						Forgot password</button>

				</form>
				<h5 class="text-center text-light">${message}</h5>
			</div>
		</div>
	</section>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
</body>

</html>