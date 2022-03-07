<div
	class="modal-dialog modal-side modal-bottom-left  modal-dialog-centered">
	<div class="modal-content"
		style="background-color: rgb(255, 255, 255); padding: 50px 0px;">
		<div class="d-flex justify-content-center align-items-center h-100">
			<div class="text-white text-center" style="width: 70%;">
				<h1 class="mb-3 text-body">Login</h1>
				<form action="/OnlineEntertaiment/login" method="post">
					<!-- Email input -->
					<div class="form-outline mb-4">
						<input name="username" type="text" id="form2Example1" class="form-control" /> <label
							class="form-label" for="form2Example1">Username</label>
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<input name="password" type="password" id="form2Example2" class="form-control" />
						<label class="form-label" for="form2Example2">Password</label>
					</div>

					<!-- 2 column grid layout for inline styling -->
					<div class="row mb-4">
						<div class="col d-flex justify-content-center">
							<!-- Checkbox -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="form2Example34" checked /> <label
									class="form-check-label text-muted" for="form2Example34">
									Remember me </label>
							</div>
						</div>

						<div class="col">
							<!-- Simple link -->
							<a class="text-muted" href="/OnlineEntertaiment/forgotpass">Forgot
								password?</a>
						</div>
					</div>

					<!-- Submit button -->
					<button type="submit" class="btn btn-primary btn-block mb-4">Sign
						in</button>

					<!-- Register buttons -->
					<div class="text-center">
						<p class="text-muted">
							Not a member? <a href="/OnlineEntertaiment/register">Register</a>
						</p>
						<p class="text-muted">or sign up with:</p>
						<button type="button" class="btn btn-primary btn-floating mx-1">
							<i class="fab fa-facebook-f"></i>
						</button>

						<button type="button" class="btn btn-primary btn-floating mx-1">
							<i class="fab fa-google"></i>
						</button>

						<button type="button" class="btn btn-primary btn-floating mx-1">
							<i class="fab fa-twitter"></i>
						</button>

						<button type="button" class="btn btn-primary btn-floating mx-1">
							<i class="fab fa-github"></i>
						</button>
					</div>
					<h5 class="text-dark mt-5">${message}</h1>
				</form>
			</div>
		</div>
	</div>
</div>