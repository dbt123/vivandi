 <div class="binhluan">
    <div id="d_notification" style="display:none;margin-bottom: 5px;
    color: #009E55;
    font-family: 'RobotoMono';
    font-size: 8.5pt;
    line-height: 22px;"></div>
    <div class="binhluan-form">
        <form id="d_sm_binhluan">
        <input type="hidden" name="frame_id" value="{!! $frame->id !!}">
            <p><input type="text" required name="name" placeholder="Họ và tên"></p>
            <p><textarea name="content" required cols="30" rows="3" placeholder="Nhập nội dung bình luận của bạn ..."></textarea> <button ><img src="{!! asset('frontend/html/img/paper-plane1.svg') !!}" alt="Gửi bình luận"></button></p>
        </form>
    </div>
    @foreach($comment as $item)
    <?php $acount = App\Account::where('id',$item->account_id)->first(); ?>
    <div class="binhluan-content">
        <h5>{!! $acount->username !!} <span> {!! date("d.m.Y", time($item->created_at)) !!}</span></h5>
        <p>{!! $item->comment !!}</p>
    </div>
    @endforeach
</div><!-- end of binhluan -->
<script>
    setTimeout(function(){  
        $("#interactive-wrapscroll").getNiceScroll().remove();
        $("#interactive-wrapscroll").niceScroll({ zindex:"99999",
        cursorborderradius: "0",
        cursorcolor: "#404040",
        cursoropacitymin: 1,
        cursoropacitymax: 1,
        cursorwidth: "2px",
        cursorborder: "none",});
    }, 0);
</script>