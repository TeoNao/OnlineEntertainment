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
<title>Editprofile</title>
</head>

<body class="bg-dark">

	<jsp:include page="nav.jsp"></jsp:include>

	<section class="mb-5 mt-5">
		<h4 class="mb-5 text-center text-light">
			<strong>Edit Profile</strong>
		</h4>
		<div class="row d-flex justify-content-center">
			<div class="col-md-6">
				<form action="/OnlineEntertaiment/editprofile" method="post">
					<!-- 2 column grid layout with text inputs for the first and last names -->
					<div class="row mb-4">
						<div class="col">
							<div class="form-outline">
								<input name="id" value="${user.id}" type="text"
									id="form3Example1" class="form-control text-light" /> <label
									class="form-label text-light" for="form3Example1">User
									name</label>
							</div>
						</div>
						<div class="col">
							<div class="form-outline">
								<input name="fullname" value="${user.fullname}" type="text"
									id="form3Example2" class="form-control text-light" /> <label
									class="form-label text-light" for="form3Example2">Full
									name</label>
							</div>
						</div>
					</div>

					<!-- Email input -->
					<div class="form-outline mb-4">
						<input name="email" value="${user.email}" type="email"
							id="form3Example3" class="form-control text-light" /> <label
							class="form-label text-light" for="form3Example3">Email
							address</label>
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<input name="password" value="${user.password}" type="password"
							id="form3Example4" class="form-control text-light" /> <label
							class="form-label text-light" for="form3Example4">Password</label>
					</div>

					<div class="form-outline mb-5">
						<input name="password1" value="${user.password}" type="password"
							id="form3Example4" class="form-control text-light" /> <label
							class="form-label text-light" for="form3Example4">Password</label>
					</div>

					<!-- Submit button -->
					<button class="btn btn-primary btn-block mb-4">
						Update</button>
						<h5 class="text-center text-light">${message}</h5>
				</form>
			</div>
		</div>
	</section>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
</body>

</html>