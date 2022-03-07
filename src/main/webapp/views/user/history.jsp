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
<link rel="stylesheet" href="/OnlineEntertaiment/style/index.css">
<link rel="stylesheet" href="style/article.css">
<style type="text/css">
	<jsp:include page="/views/style_all.css"></jsp:include>
</style>
<title>OnlineEntertaimenr History</title>
</head>

<body class="bg-dark">
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<jsp:include page="nav.jsp"></jsp:include>
	<main class="mt-5">
		<div class="container">
			<section class="h5" style="margin-top: -30px;">
				<h4>
					<strong style="color: rgba(255, 255, 255, 0.7);">Phim đã xem</strong>
				</h4>
				<hr class="bg-light"/>
				<div class="row">
					<c:forEach var="item" items="${history}">
						<jsp:include page="card_list.jsp">
							<jsp:param value="${item.video.id}" name="id" />
							<jsp:param value="${item.video.poster}" name="poster" />
							<jsp:param value="${item.video.title}" name="title" />
							<jsp:param value="${item.video.views}" name="views" />
							<jsp:param value="far fa-trash-alt" name="icon" />
							<jsp:param value="deletehis" name="link" />
						</jsp:include>
					</c:forEach>
				</div>
			</section>
		</div>
	</main>
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

	<script src="https://wowjs.uk/dist/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.js"></script>
	<script src="style/js.js"></script>
</body>

</html>