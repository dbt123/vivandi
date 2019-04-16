<div class="vivaldi-popup-header">
    <h3>Download</h3>
    <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
</div><!-- end of header -->
<div class="clearfix"></div>
<div class="vivaldi-popup-body" >
	<div class="center-col">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
        <div class="popup-download-form">
                <input type="hidden" required name="frame_id" value="{!! $frame->id !!}">
                @if ($infoCus == null)
                    <input type="text" required name="username" placeholder="Họ tên">
                    <input type="text" required name="job" placeholder="Nghề nghiệp của bạn">
                    <input type="text" required name="email" placeholder="Email">
                    <input type="text" required name="phone" placeholder="Số điện thoại">
                    <textarea name="content"  cols="30" rows="5" placeholder="Đôi nét về bạn ..."></textarea>
                @else 
                    <input type="text" value="{{ $infoCus->text_2 }}" required name="username" placeholder="Họ tên">
                    <input type="text" value="{{ $infoCus->text_3 }}" required name="job" placeholder="Nghề nghiệp của bạn">
                    <input type="text" value="{{ $infoCus->text_4 }}" required name="email" placeholder="Email">
                    <input type="text" value="{{ $infoCus->text_5 }}" required name="phone" placeholder="Số điện thoại">
                    <textarea name="content" value="{{ $infoCus->text_6 }}" cols="30" rows="5" placeholder="Đôi nét về bạn ..."></textarea>
                @endif
        </div>
        <div class="button-download">
            <button>Download</button>
            <div class="button-white"></div>
        </div>
    </div>
</div><!-- end of body -->
<div class="clearfix"></div>

