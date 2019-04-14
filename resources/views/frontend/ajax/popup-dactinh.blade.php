<?php 
    $frameImage = App\FrameImage::where('frame_id',$frame->id)->get();
    $list_session = Session::get('frame');
?>
<style>
    .pac-container {
    z-index: 1051 !important;
    overflow: hidden;
}
</style>
<div class="popup-interactive-slide">
    <!-- img slide -->
    <div id="demo">
        <div class="span12" id="d_add_goo" style="idth:509px;eight:354px;">
            <div id="owl-slide" class="owl-carousel owl-model">    
                @foreach($frameImage as $item)
                    <div class="item"><img src="{!! $item->img !!}" alt=""></div>
                @endforeach
            </div>
        </div>
    </div>
    <!-- luotmua-img MAP -->
    <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.8596722614325!2d105.82509161438612!3d20.998261486014883!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac87dedfb4d9%3A0x6c7c1ed5f42ed994!2zQ8O0bmcgdHkgVGhp4bq_dCBr4bq_IHdlYiBzw6FuZyB04bqhbyBNYXN0ZXJjdXMgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1480477210619" frameborder="0" style="border:0" allowfullscreen></iframe> -->
</div>
<div class="popup-interactive-content">
    <div class="popup-interactive-content-header">
        <div class="popup-interactive-content-header-model">
            <h1>{!! $frame->name !!}</h1>
            <div class="rate">
                @if($frame->price_sale)
                    <h4 class="rate-liemyet"><span>{!! number_format((int)$frame->price,0,'','.') !!}</span>đ</h4>
                    <h4 class="rate-ban"><span>{!! number_format((int)$frame->price_sale,0,'','.') !!}</span>đ</h4>
                @else
                    <h4 class="rate-ban" style="float:left;"><span>{!! number_format((int)$frame->price,0,'','.') !!}</span>đ</h4>
                @endif
            </div>
        </div><!-- end of popup-interactive-content-header-model -->
        <div class="button-like">
            <button class="@if($list_session) <?php $z = 0;?> @foreach($list_session as $item5) <?php $z++;?> @if($frame->id == $item5['frame']->id) button-likedd @else @if($z == 1) art_to_cart @endif @endif @endforeach @else art_to_cart @endif d_del_class_{!! $frame->id !!}" data-id="{!! $frame->id !!}">YÊU THÍCH</button>
            <div class="button-white"></div>
        </div><!-- end of button-like -->
    </div><!-- end of popup-interactive-content-header -->
    <div class="scrollbar-dynamic scrollbar-dynamic-interactive">
        <table class="interactive">
            <tr>
                <td class="d_ajax_binhluan" data-id="{!! $frame->id !!}"><a href="">@if(sizeof($comment) < 10) <span>0{!! sizeof($comment) !!}</span> @else <span>{!! sizeof($comment) !!}</span> @endif B<em class="viettat">ình </em><em class="viettat-dot">.</em>luận</a></td>
                <td class="d_ajax_luotmua" data-id="{!! $frame->id !!}"><a href="">@if(sizeof($order) < 10) <span>0{!! sizeof($order) !!}</span> @else <span>{!! sizeof($order) !!}</span> @endif L<em class="viettat">ượt </em><em class="viettat-dot">.</em>mua</a></td>
               <td><a class="d_ajax_dai_ly" data-id="{!! $frame->id !!}">@if(sizeof($agency_frame) < 10) <span>0{!! sizeof($agency_frame) !!}</span> @else <span>{!! sizeof($agency_frame) !!}</span> @endif Đ<em class="viettat">ại lý có</em><em class="viettat-dot">L</em> bán</a></td>
                <td class="interactive-active d_ajax_dactinh" data-id="{!! $frame->id !!}"><a href="">@if(sizeof($feature0) < 10) <span>0{!! sizeof($feature0) !!}</span> @else <span>{!! sizeof($feature0) !!}</span> @endif Đ<em class="viettat">ặc </em><em class="viettat-dot">.</em>tính</a></td>
            </tr>
        </table><!-- end of interactive -->

        <div id="d_ajax_popup">
        <?php $name="";?>
        <p style="padding-bottom: 19px; font-size: 8.5pt;">{!! $frame->description !!}</p>
        <div class="dactinh">
            @foreach($feature1 as $key => $item)
                @if($item->name != $name)
                    
                        <div class="dailyban-content">
                            <h5>{!! $item->name !!}</h5>
                            <p><span>  
                @endif
                @if(isset($feature1[$key+1]))
                    @if($feature1[$key+1]->name != $feature1[$key]->name)
                            {!! $item->value !!}</span></p>
                        </div>
                    @else
                        {!! $item->value !!}</span>
                    @endif
                @else            
                        {!! $item->value !!} </span></p>
                    </div>
                @endif    
            <?php $name = $item->name;?>        
            @endforeach
        </div>
        </div>
    </div><!-- end of interactive-wrapscroll -->
</div>
<div class="clearfix"></div>
<script>
    $(".owl-model").owlCarousel ({
      navigation : true,
      pagination : false,
      slideSpeed : 200,
      paginationSpeed : 400,
      singleItem : true,
      items : 1,
      autoPlay : true
      });
    $('.owl-model .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow.svg') !!}" alt="">');
    $('.owl-model .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow.svg') !!}" alt="">');
</script>