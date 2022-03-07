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
		<ul class="nav nav-tabs mb-3" id="ex1" role="tablist"
			style="width: 100%; background-color: gray">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="ex1-tab-1" data-mdb-toggle="tab"
				href="#ex1-tabs-1" role="tab" aria-controls="ex1-tabs-1"
				aria-selected="true">Cập Nhật</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2" role="tab"
				aria-controls="ex1-tabs-2" aria-selected="false">Danh Sách</a></li>
		</ul>
		<!-- Tabs navs -->

		<!-- Tabs content -->
		<div class="tab-content" id="ex1-content">
			<div class="tab-pane fade show active" id="ex1-tabs-1"
				role="tabpanel" aria-labelledby="ex1-tab-1">
				<form action="/lab5/home" method="post">
					<div class="input-group mb-3">
						<div class="form-outline" style="width: 100%;">
							<input value="${item.id}" name="id" type="search" id="form1"
								class="form-control text-light" /> <label
								class="form-label text-light" for="form1">Username</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="form-outline" style="width: 100%;">
							<input value="${item.password}" name="password" type="search"
								id="form1" class="form-control text-light" /> <label
								class="form-label text-light" for="form1">Password</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="form-outline" style="width: 100%;">
							<input value="${item.fullname}" name="fullname" type="search"
								id="form1" class="form-control text-light" /> <label
								class="form-label text-light" for="form1">Fullname</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="form-outline" style="width: 100%;">
							<input value="${item.email}" name="email" type="search"
								id="form1" class="form-control text-light" /> <label
								class="form-label text-light" for="form1">Email Address</label>
						</div>
					</div>
					<hr>
					<button formaction="/OnlineEntertaiment/admin/create-user"
						class="btn btn-light" data-mdb-ripple-color="dark">Create</button>
					<button formaction="/OnlineEntertaiment/admin/update-user"
						class="btn btn-light" data-mdb-ripple-color="dark">Update</button>
					<button formaction="/OnlineEntertaiment/admin/delete-user"
						class="btn btn-light" data-mdb-ripple-color="dark">Delete</button>
					<button formaction="/OnlineEntertaiment/admin/reset-user"
						class="btn btn-light" data-mdb-ripple-color="dark">Reset</button>

				</form>
			</div>
			<div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel"
				aria-labelledby="ex1-tab-2">
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">USERNAME</th>
							<th scope="col">PASSWORD</th>
							<th scope="col">FULLNAME</th>
							<th scope="col">EMAIL</th>
							<th scope="col">ROLE</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<c:forEach var="item" items="${users}">
						<tbody>
							<tr>
								<th scope="row">${item.id}</th>
								<td>${item.password}</td>
								<td>${item.fullname}</td>
								<td>${item.email}</td>
								<td>${item.admin?'Admin':'User'}</td>
								<td><a href="/OnlineEntertaiment/admin/edituser?uid=${item.id}">Edit</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

			</div>
		</div>

		<!-- Tabs content -->
	</div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
</body>

</html>