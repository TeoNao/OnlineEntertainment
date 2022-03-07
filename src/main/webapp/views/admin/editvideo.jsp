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
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<!-- Navbar -->
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">

		<!-- Tabs navs -->
		<ul class="nav nav-tabs mb-3" id="ex1" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active"
				style="background-color: rgba(128, 128, 128, 0.3); color: white;"
				id="ex1-tab-1" data-mdb-toggle="tab" href="#ex1-tabs-1" role="tab"
				aria-controls="ex1-tabs-1" aria-selected="true">Video Edition</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				style="background-color: rgba(128, 128, 128, 0.3); color: white;"
				id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2" role="tab"
				aria-controls="ex1-tabs-2" aria-selected="false">Vide List</a></li>
		</ul>
		<!-- Tabs navs -->

		<!-- Tabs content -->
		<div class="tab-content" id="ex1-content">
			<div class="tab-pane fade show active" id="ex1-tabs-1"
				role="tabpanel" aria-labelledby="ex1-tab-1">
				<form class="row mt-5" method="post" enctype="multipart/form-data">
					<div class="col-md-6">
						<label class="form-label text-light" for="form3Example3">Thumbnail</label>
						<div class="ratio ratio-16x9 border border-light">
							<c:if test="${item.poster!=null}">
								<img
									src="/OnlineEntertaiment/upload/images/poster/${item.poster}">
							</c:if>
						</div>
						<input name="poster" type="file" id="formFileMultiple" multiple />
					</div>
					<div class="col-md-6">
						<label class="form-label text-light" for="form3Example3">Youtube
							Id?</label>
						<div class="form-outline mb-1">
							<input name="id" value="${item.id}" type="text"
								id="form3Example3" class="form-control text-light" />
						</div>
						<label class="form-label text-light" for="form3Example3">Video
							Title?</label>
						<div class="form-outline mb-1">
							<input name="title" value="${item.title}" type="text"
								id="form3Example3" class="form-control text-light" />
						</div>
						<label class="form-label text-light" for="form3Example3">View
							Count?</label>
						<div class="form-outline mb-1">
							<input name="views" value="${item.views}" type="text"
								id="form3Example3" class="form-control text-light" />
						</div>
						<div class="form-check form-check-inline mt-2">
							<input ${item.active?'checked':'unchecked'} name="active"
								class="form-check-input bg-dark" type="radio"
								id="inlineCheckbox1" value="true" /> <label
								class="form-check-label text-light" for="inlineCheckbox1">Active</label>
						</div>
						<div class="form-check form-check-inline">
							<input name="active" class="form-check-input bg-dark"
								type="radio" id="inlineCheckbox2" value="false" /> <label
								class="form-check-label text-light" for="inlineCheckbox2">Inactive</label>
						</div>
						<div class="col-md-12">
							<div class="form-outline mt-3">
								<textarea name="description" class="form-control text-light"
									id="form4Example3" rows="4">${item.description}</textarea>
								<label class="form-label text-light" for="form4Example3">Description</label>
							</div>
						</div>
						<div class="col-md-12 mt-3">
							<button formaction="/OnlineEntertaiment/admin/create-video"
								class="btn btn-primary">Create</button>
							<button formaction="/OnlineEntertaiment/admin/delete-video"
								class="btn btn-primary">Delete</button>
							<button formaction="/OnlineEntertaiment/admin/update-video"
								class="btn btn-primary">Update</button>
							<button formaction="/OnlineEntertaiment/admin/reset-video"
								class="btn btn-primary">Reset</button>
						</div>
					</div>
				</form>
			</div>
			<div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel"
				aria-labelledby="ex1-tab-2">
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Youtube Id</th>
							<th scope="col">Video Title</th>
							<th scope="col">Views Count</th>
							<th scope="col">Status</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${video}">
							<tr>
								<th scope="row">${item.id}</th>
								<td>${item.title}</td>
								<td>${item.views}</td>
								<td>${item.active?'Public':'Private'}</td>
								<td><a
									href="/OnlineEntertaiment/admin/editvideo?vid=${item.id}">Edit</a></td>
								<td><a
									href="#"><i
										class="fas fa-trash-alt"></i></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
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
		</div>
		<!-- Tabs content -->
	</div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
</body>

</html>