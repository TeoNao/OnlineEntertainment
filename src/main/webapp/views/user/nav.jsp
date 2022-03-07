<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<li class=""><a class="nav-link"
							href="/OnlineEntertaiment/register" rel="nofollow"> Join </a></li>
					</c:when>
					<c:otherwise>
						<li class=""><a class="nav-link" href="favorite"
							rel="nofollow"> <i class="far fa-heart"></i>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- Dropdown -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<!-- Dropdown -->
					<li class="nav-item dropdown"><c:choose>
							<c:when test="${empty sessionScope.user}">
								<c:set var="isLogin" value="false"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="isLogin" value="true"></c:set>
							</c:otherwise>
						</c:choose> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-mdb-toggle="${isLogin?'dropdown':'modal'}"
						data-mdb-target="#exampleModal1" aria-expanded="false">
							${isLogin?sessionScope.user.fullname:'Login'}</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:choose>
								<c:when test="${sessionScope.user.admin==true}">
									<li><a class="dropdown-item"
										href="/OnlineEntertaiment/admin/editvideo">Admin</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="dropdown-item"
										href="/OnlineEntertaiment/editprofile">Edit profile</a></li>
								</c:otherwise>
							</c:choose>
							<li><a class="dropdown-item"
										href="/OnlineEntertaiment/history">History</a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item"
								href="/OnlineEntertaiment/logout">Sign out</a></li>
						</ul></li>
				</ul>
			</ul>
		</div>
	</div>
</nav>