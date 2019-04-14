<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8">
		<style type="text/css">
			.wrap {
				
				font-size: 11pt;
				padding: 5px 20px 20px 20px;
			}
			.logo-cfr {
				width: 70px;
			}
			.text-cfr {
				border-top: 1px solid #bbb;
				margin-top: 20px;
			}
		</style>
	</head>
	<body>
		<div class="wrap">
			
			<div>
				<p>Chào bạn {!! $name !!} !!
				Gần đây, chúng tôi đã nhận được thông báo của bạn (hoặc người khác được bạn ủy quyền) đã quên mật khẩu đăng nhập vào hệ thống <a href="{{url('')}}">vivandi.com</a></p>
				<ol>
					<li>Nếu do người khác mạo danh, bạn vui lòng bỏ qua Email này.</li>
					<li>Nếu đúng, bạn vui lòng nhấn vào <a href="{{ $link }}">link</a> này để thay đổi mật khẩu mới.</li>
				</ol>
				<p>Cảm ơn bạn đã tin dùng!</p>
			</div>
		</div>
	</body>
</html>
