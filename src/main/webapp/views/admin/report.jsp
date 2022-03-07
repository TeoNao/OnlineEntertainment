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
<title>Registrantion</title>
</head>

<body class="bg-dark">
	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<!-- Tabs navs -->
		<ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active"
				style="background-color: rgba(128, 128, 128, 0.3); color: white;"
				id="ex1-tab-1" data-mdb-toggle="tab" href="#ex1-tabs-1" role="tab"
				aria-controls="ex1-tabs-1" aria-selected="true">Farvorite</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				style="background-color: rgba(128, 128, 128, 0.3); color: white;"
				id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2" role="tab"
				aria-controls="ex1-tabs-2" aria-selected="false">Farvorite Users</a>
			</li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				style="background-color: rgba(128, 128, 128, 0.3); color: white;"
				id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-3" role="tab"
				aria-controls="ex1-tabs-2" aria-selected="false">Shared Friends</a>
			</li>
		</ul>
		<!-- Tabs navs -->

		<!-- Tabs content -->
		<div class="tab-content" id="ex1-content">
			<div class="tab-pane fade show active" id="ex1-tabs-1"
				role="tabpanel" aria-labelledby="ex1-tab-1">
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Video Title</th>
							<th scope="col">Favorite</th>
							<th scope="col">Latest Date</th>
							<th scope="col">Oldest Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${favorite}">
							<tr>
								<th scope="row">${item.group}</th>
								<td>${item.likes}</td>
								<td>${item.newest}</td>
								<td>${item.oldest}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel"
				aria-labelledby="ex1-tab-2">
				<form action="/OnlineEntertaiment/admin/report-user" method="post">
					<div class="input-group">
						<div class="form-outline" style="width: calc(100% - 60px);">
							<input name="keyword" type="search" id="form1"
								class="form-control text-light" /> <label
								class="form-label text-light" for="form1">Search for
								Title</label>
						</div>
						<button class="btn btn-primary">
							<i class="fas fa-search"></i>
						</button>

					</div>
				</form>
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Username</th>
							<th scope="col">Fullname</th>
							<th scope="col">Email</th>
							<th scope="col">Farvorite Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${favoriteuser}">
							<tr>
								<th scope="row">${item.user.id}</th>
								<td>${item.user.fullname}</td>
								<td>${item.user.email}</td>
								<td>${item.likeDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="ex1-tabs-3" role="tabpanel"
				aria-labelledby="ex1-tab-2">
				<form action="/OnlineEntertaiment/admin/report-email" method="post">
					<div class="input-group">
						<div class="form-outline" style="width: calc(100% - 60px);">
							<input name="keyword" type="search" id="form1"
								class="form-control text-light" /> <label
								class="form-label text-light" for="form1">Search for
								Title</label>
						</div>
						<button class="btn btn-primary">
							<i class="fas fa-search"></i>
						</button>

					</div>
				</form>
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Sender Name</th>
							<th scope="col">Sender Email</th>
							<th scope="col">Receiver Email</th>
							<th scope="col">Sent Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${shares}">
							<tr>
								<th scope="row">${item.user.fullname}</th>
								<td>${item.user.email}</td>
								<td>${item.emails}</td>
								<td>${item.shareDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>

		<!-- Tabs content -->
	</div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
</body>

</html>