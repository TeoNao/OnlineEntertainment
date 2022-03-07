
<div class="modal-dialog modal-side modal-bottom-left  modal-dialog-centered">
	<div class="modal-content"
		style="background-color: rgba(128, 128, 128, 0)">
		<div class="d-flex justify-content-center align-items-center h-100">
			<div class="text-white text-center">
				<h1 class="mb-3">Send video to your friend</h1>
				<form action="/OnlineEntertaiment/share?vid=${param.id}" method="post" class="input-group">
					<div class="form-outline" style="width: calc(100% - 60px);">
						<input name="to" type="email" id="form" class="form-control"
							style="color: white;" /> <label class="form-label"
							style="color: white;" for="form1">Email</label>
					</div>
					<button class="btn btn-light">
						<i class="fas fa-share"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
