<?php $product = App\Product::where('id',$frame->product_id)->first();
 $url = route('getProDetail',['id'=>$frame->id,'slug'=>$frame->slug]); 
?>
@extends('frontend_center.layout')
@section('title',$product->name)
@section('meta')
    <meta name="description" content="{!! $product->description !!}">
    <!-- share -->
    <meta property="og:url"           content="{{URL::route('getProDetail',['id'=>$frame->id,'slug'=>$frame->slug])}}" />
    <meta property="og:type"          content="website" />
    <meta property="og:title"         content="{!! $product->name !!}" />
    <meta property="og:description"   content="{!! $product->description!!}" />
    @if ($product->img)
    <meta property="og:image"         content="{!! asset($product->img) !!}" />
    @else
    <meta property="og:image"         content="{!! asset($frame->img) !!}" />
    @endif
@endsection
@section('css')

@endsection
@section('content')
<style>
    .d_style{
        position: fixed;
        right: 84px;
        bottom:20px;
    }
    .d_style1{
        position: fixed;
        right: 84px;
        top:148px;
    }

</style>
        <!-- BODY ///////////////////////////////////////////////////////////////////////////// -->
        <div class="container main-content">
            <div class="row row-offcanvas row-offcanvas-right">
                <!-- Button off-canvas -->
                <!-- <div class="container container-offcanvas">
                    <div class="row">
                        <p class="pull-right visible-xs visible-sm">
                            <button type="button" class="btn btn-primary btn-xs btn-sm" data-toggle="offcanvas">Off Canvas</button>
                        </p>
                        <div class="clearfix"></div>
                    </div>
                </div> -->
                <?php 
                    $list_session = Session::get('frame');
                    $total = 0;
                ?>
                <!-- end of Button off-canvas -->
                <div class="col-md-9">
                    @foreach($list_frame as $item)
                    <?php 
                        $comment = App\CommentFrame::where('frame_id',$item->id)->where('status',1)->get();
                        $order = App\OrderItem::leftjoin('orders','order_items.order_id','=','orders.id')->select('order_items.*')->where('orders.status','>',4)->where('order_items.frame_id',$item->id)->get();
                     ?>
                        <div class="section" data-id="{!! $item->id !!}" id="active-{!! $item->id !!}">
                        <div class="row">
                            <?php 
                                $list_frame_image = App\FrameImage::where('frame_id',$item->id)->get();
                                $agency_frame =  App\Agency_frame::where('frame_id',$item->id)->get();
                            ?>
                            <div class="col-xs-8 slide-img">
                                <div id="demo">
                                    <div class="row">
                                        <div class="span12 youtube_{!! $item->id !!}">
                                            <div id="owl-slide" class="owl-carousel owl-model " >  
                                                @foreach($list_frame_image as $item2)  
                                                    <div class="item"><img src="{!! $item2->img !!}" alt=""></div>
                                                @endforeach    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end of col-md-6 slide-img -->
                            <div class="col-xs-4 infomation">
                                <div>
                                    <h1>{!! $item->name !!} </h1>
                                    <div class="rate">
                                        @if($item->price_sale)
                                            <h4 class="rate-liemyet"><span>{!! number_format((int)$item->price,0,'','.') !!}</span>đ</h4>
                                            <h4 class="rate-ban"><span>{!! number_format((int)$item->price_sale,0,'','.') !!}</span>đ</h4>
                                        @else
                                            <h4 class="rate-ban"><span>{!! number_format((int)$item->price,0,'','.') !!}</span>đ</h4>
                                        @endif
                                    </div>
                                    <div class="like">
                                        <div class="button-like">
                                            <button class="@if($list_session) <?php $z = 0;?> @foreach($list_session as $item5) <?php $z++;?> @if($item->id == $item5['frame']->id) button-likedd @else @if($z == 1) art_to_cart @endif @endif @endforeach @else art_to_cart @endif d_del_class_{!! $item->id !!}" data-id="{!! $item->id !!}">Yêu thích</button>
                                            <div class="button-white"></div>
                                        </div>
                                        <p class="d_like_{!! $item->id !!}">{!! $item->like_frame !!} <img src="{!! asset('frontend/html/img/favorite-FFC000.svg')  !!}"></p>
                                    </div>
                                    <!-- <div class="seri">
                                        <p class="seri-number">Số seri <span>{!! $item->code_frame !!}</span> <div class="clearfix"></div></p>
                                        <p class="feature d_dactinh " data-id="{!! $item->id !!}"><a href=""><img src="{!! asset('frontend/html/img/Feature.png')  !!}" alt=""> Mô tả</a></p>
                                        <p class="name-file @if($item->file) d_dowload @endif" @if($item->file) style="cursor:pointer;" @endif data-id="{!! $item->id !!}"><a ><img src="{!! asset('frontend/html/img/download.svg')  !!}" alt="">@if($item->file) {!! $item->file !!} @else No File @endif</a></p>
                                        <?php 
                                            $youtube = json_decode($item->youtube_link);
                                        ?>
                                        @if($item->youtube_link !="[]")
                                        <p class="seri-youtube" id="p_youtube" data-id="{!! $item->id !!}"><a class="popup-with-zoom-anim" href="#modal-popup-youtube"><img src="{!! asset('frontend/html/img/youtube.svg')  !!}" alt="">Hướng dẫn lắp đặt</a></p>
                                        @else
                                        <p class="seri-youtube"><img src="{!! asset('frontend/html/img/youtube.svg')  !!}" alt="">Không có video</p>
                                        @endif
                                    </div> -->
                                    <div class="seri">
                                        <p class="seri-number">Số seri <span>{!! $item->code_frame !!}</span> <div class="clearfix"></div></p>
                                        <div class="seri-detail-dropdown"><p class="feature"><a href="javascript:void(0);"><!-- <img src="img/Feature.png" alt="">  -->Chi tiết sản phẩm <img class="seri-detail-dropdown-img" src="{!! asset('frontend/html/img/down-arrow.svg') !!}" alt=""></a></p></div><!-- end of seri-detail-dropdown -->
                                        <div class="seri-detail-dropdown-content">
                                            <p class="feature d_dactinh " data-id="{!! $item->id !!}"><a href=""><img src="{!! asset('frontend/html/img/Feature.png')  !!}" alt=""> Mô tả</a></p>
                                        <p class="name-file @if($item->file) d_dowload @endif" @if($item->file) style="cursor:pointer;" @endif data-id="{!! $item->id !!}"><a ><img src="{!! asset('frontend/html/img/download.svg')  !!}" alt="">@if($item->file) {!! $item->file !!} @else No File @endif</a></p>
                                        <?php 
                                            $youtube = json_decode($item->youtube_link);
                                        ?>
                                        @if($item->youtube_link !="[]")
                                        <p class="seri-youtube" id="p_youtube" data-id="{!! $item->id !!}"><a class="popup-with-zoom-anim" href="#modal-popup-youtube"><img src="{!! asset('frontend/html/img/youtube.svg')  !!}" alt="">Hướng dẫn lắp đặt</a></p>
                                        @else
                                        <p class="seri-youtube"><img src="{!! asset('frontend/html/img/youtube.svg')  !!}" alt="">Không có video</p>
                                        @endif
                                        </div>
                                    </div>
                                    <table class="interactive">
                                        <tr>
                                            <td ><a class=" d_binhluan" data-id="{!! $item->id !!}" >@if(sizeof($comment) < 10) <span>0{!! sizeof($comment) !!}</span> @else <span>{!! sizeof($comment) !!}</span> @endif Bình luận</a></td>
                                            <td><a class=" d_luotmua" data-id="{!! $item->id !!}"  >@if(sizeof($order) < 10) <span>0{!! sizeof($order) !!}</span> @else <span>{!! sizeof($order) !!}</span> @endif Lượt mua</a></td>
                                            <td><a class=" d_daily" data-id="{!! $item->id !!}"  >@if(sizeof($agency_frame) < 10) <span>0{!! sizeof($agency_frame) !!}</span> @else <span>{!! sizeof($agency_frame) !!}</span> @endif Đại lý <span class="cos-hidden"> có</span> bán</a></td>
                                        </tr>
                                    </table>
                                </div>
                            </div><!-- end of col-md-6 infomation -->
                        </div>
                    </div><!-- end of section -->
                    @endforeach
                    <div class="suggest">
                        <h5>Suggest</h5>
                        <div id="demo">
                            <div class="row">
                                <div class="span12">
                                    <div id="slide-suggest" style="z-index:10" class="owl-carousel owl-suggest">    
                                        <?php
                                            $att_id = array();
                                        ?>
                                        @foreach($list_frame as $lf)
                                            <?php
                                                $list_att = DB::table('frame_attributes')->where('frame_id',$lf->id)->get();
                                                $d=0;
                                                foreach($list_att as $la){
                                                    if (!in_array($la->attribute_id, $att_id))
                                                    {
                                                        array_push($att_id, $la->attribute_id);
                                                    }
                                                }
                                            ?>
                                        @endforeach    
                                        <?php
                                            $f_id = array();
                                            for ($i=0 ; $i<sizeof($att_id); $i++){
                                                $allframe = DB::table('frame_attributes')->where('attribute_id',$att_id[$i])->get();
                                                foreach ($allframe as $aa) {
                                                    if (!in_array($aa->frame_id, $f_id))
                                                    {
                                                        array_push($f_id, $aa->frame_id);
                                                    }
                                                }
                                            }
                                        ?>
                                        <?php
                                            $fr_list = array();
                                        ?>
                                        @foreach($list_frame as $lf)
                                            <?php
                                                    if (!in_array($lf->id, $fr_list))
                                                    {
                                                        array_push($fr_list, $lf->id);
                                                    }
                                            ?>
                                        @endforeach
                                        <?php
                                            $fr_sug = DB::table('frames')->wherein('id',$f_id)->wherenotin('id',$fr_list)->get();
                                        ?>
                                        @foreach($fr_sug as $fs)
                                            <?php
                                                $kt_frame = 0;
                                            ?>
                                            @foreach($frame_domain as $fd)
                                                @if($fs->id == $fd->id)
                                                    <?php
                                                        $kt_frame =1;
                                                    ?>
                                                @endif
                                            @endforeach
                                            @if ($kt_frame ==1)
                                                <a href="{{route('getProDetaildomain',['id'=>$fs->id,'slug'=>$fs->slug])}}"><div class="item"><img src="{{$fs->img}}" alt=""></div></a>
                                            @else
                                                <?php
                                                  $a = route('getProDetail',['id'=>$fs->id,'slug'=>$fs->slug]);
                                                  $pieces = explode('.', $a);
                                                  unset($pieces[0]);
                                                  $b = $pieces[1] .'.'. $pieces[2];
                                                ?>
                                                <a href="//{{$b}}"><div class="item"><img class="img-black-white" src="{{$fs->img}}" alt=""></div></a>
                                            @endif
                                            
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of suggest -->
                </div><!-- end of col-md-9 --> 
                <div class="col-md-3 content-right sidebar-offcanvas" id="sidebar" role="navigation">
                    <div class="content-right-seriname">
                        <h2>{!! $product->name !!}</h2>
                        <p>{!! $product->description !!}</p>
                        <div class="sp-blog pull-right">
                            <a href=""><h4 class="pull-left">Sản phẩm</h4></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="content-right-model">
                        <?php $group_attr = App\GroupAttribute::where('group_id',0)->get(); ?> 
                        @if(sizeof($group_attr))
                            @foreach($group_attr as $key => $item) 
                                <a href="{!! route('get.Categorydomain',['id'=>$item->id,'slug'=>$item->slug]) !!}"><h5 style="    text-transform: uppercase;" >{!! $item->name !!}</h5></a>
                            @endforeach
                        @endif
                    </div>
                    <div class="content-right-model">
                        @foreach($list_frame as $item3)
                            <span style="cursor:pointer;" href="#active-{!! $item3->id !!}" class="d_scoll" data-name="{!! $item3->name !!}" data-id="{!! $item3->id !!}" data-slug="{!! $item3->slug !!}"><h5 id="d_active_{!! $item3->id !!}" @if($item3->id == $frame->id) class="content-right-model-active" @endif >{!! $item3->name !!}</h5></span>
                        @endforeach    
                    </div>
                    @include('frontend_center.partinal.right_social')
                    @include('frontend_center.partinal.foooter')
                </div><!-- end of col-md-9 content-right -->
            </div>
        </div>
        
        <!-- POPUP ///////////////////////////////////////////////////////////////////////////// -->
        <div class="vivaldi-popup">
            <!--Popup download-->
            <div id="modal-popup-download" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content" >
               <form id="d_popup_dowload">
                   
               </form>
            </div>
            <!--Hết popup download-->

            <!--Popup interactive-->
            <div id="modal-popup-interactive" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
                <div id="d_popup_all">
                        
                </div>
            </div>
            <!--Hết popup interactive-->
            <!-- Popup youtube -->
            <div id="modal-popup-youtube" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
                <div class="vivaldi-popup-header">
                    <h3>Hướng dẫn lắp đặt</h3>
                    <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
                </div><!-- end of header -->
                <div class="clearfix"></div>
                <div class="vivaldi-popup-body" id="id_youtube">
                    
                </div><!-- end of body -->
                <div class="clearfix"></div>
            </div>
            <!-- end of popup youtube -->
                  
        </div>
        <!-- javascript libraries / javascript files set #1 -->
@endsection
@section('js')      
         <!-- click button yêu thích -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBmwyLJTrzp-qw9wKYK6Ind6Wd7mnoxEPY&libraries=places"></script>
        <script>
            $(document).ready(function() {
                $("#interactive-wrapscroll").niceScroll({cursorcolor:"#00F"});
                $('.button-likedd').removeClass('art_to_cart').text("ĐÃ ThÍCH").css('color','#0D0D0D');
            });
        </script>
        <script>
        $(document).ready(function() {
              $(".owl-model").owlCarousel ({
              navigation : true,
              pagination : false,
              slideSpeed : 200,
              paginationSpeed : 400,
              singleItem : true,
              items : 1,
              autoPlay : true
              });
            });
        </script>
        <script>
            $(document).ready(function() {
              $(".owl-suggest").owlCarousel ({
              navigation : true,
              pagination : false,
              slideSpeed : 200,
              paginationSpeed : 400,
              items : 4,
              autoPlay : true,
              });
            });
        </script>
        <!-- add next... slide -->

        <script>
            $(document).on('click', '.d_scoll', function(event){
                id = $(this).data('id');
                list = {!! $list_frame[0]->id !!};
                slug = $(this).data('slug');
                name = $(this).data('name');
                if(list == id){
                    $('html, body').animate({
                        scrollTop: ($( $.attr(this, 'href') ).offset().top-149)
                    }, 700);
                }else{
                    $('html, body').animate({
                        scrollTop: ($( $.attr(this, 'href') ).offset().top-50)
                    }, 700);
                }
                $(this).parent().find('.content-right-model-active').removeClass('content-right-model-active');
                $(this).children('h5').addClass('content-right-model-active');
                link = '{!! url('/san-pham-domain/chi-tiet-san-pham') !!}'+"/"+slug+'-'+id;
                window.history.pushState({},"", link);
                document.title = name;
                
            });
            
            //Basic Usage
            $(document).scroll(function(){
                x = $('#sidebar').height();
                if(x > ($('#sidebar').height() - 148)){
                    a = $('#sidebar').height()- 405;
                    b = $(document).scrollTop();
                    if(b >= a){
                        // id = $(document).$('.section').offset().data('id');
                        // console.log(id);
                        $('#sidebar').addClass('d_style'); 
                    }else{

                        $('#sidebar').removeClass('d_style');

                    } 
                }else{
                    $('#sidebar').addClass('d_style1'); 
                }
                
            });

            $(document).ready(function() {
                id = {!! $frame->id !!};
                list = {!! $list_frame[0]->id !!};
                if(list == id){
                    $('html, body').animate({
                        scrollTop: ($('#active-'+id).offset())
                    }, 700);
                }else{
                     $('html, body').animate({
                        scrollTop: ($('#active-'+id).offset().top-50)
                    }, 700);
                }
            });
            
            $(document).on('click','.d_dowload',function(e){
                e.preventDefault();
                id = $(this).data('id');
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('popup.dowload.file')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $.magnificPopup.open({
                                items: {
                                    src: '#modal-popup-download'
                                },
                                type: 'inline',
                                blackbg: true,
                                zoom: {
                                        enabled: true,
                                        duration: 300 
                                       },
                                mainClass: 'my-mfp-zoom-in',
                                callbacks: {
                                   beforeOpen: function() {
                                      $('#d_popup_dowload').html(data.html);
                                   }
                                }
                            });
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });

            $(document).on('submit', '#d_popup_dowload', function(e) {
                e.preventDefault();
                var form = $('#d_popup_dowload')[0];
                var formData = new FormData(form);
                $.ajax({
                    headers: {
                                  'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                    type:"post",
                    url:"{{route('submit.dowload.file')}}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success:function(data){
                        if(data.status == true){
                            link = '{!! route('submit.dowload.file2') !!}'+'?filename='+data.frame.file;
                            window.open(link);
                            $("#d_popup_dowload")[0].reset();
                            $('#modal-popup-download').magnificPopup('close');
                        }
                    },
                    dataType:"json"
                });
            });
            
            $(document).on('click','.d_list_xem',function(e){
                e.preventDefault();
                 $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-sp-daxem' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    callbacks: {
                       beforeOpen: function() {
                          
                       },
                       beforeClose: function() {
                           
                       }
                    }
                });
            });
             // open popup interactive
            $(document).on('click','.d_binhluan',function(e){
                e.preventDefault();
                id = $(this).data('id');
                $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-interactive' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    callbacks: {
                       beforeOpen: function() {
                         
                       },
                        beforeClose: function () {
                            $("#interactive-wrapscroll").getNiceScroll().remove();
                        }
                    }
                });
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.popup.binhluan')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_popup_all').html(data.html);
                            $('#d_ajax_l_xem').html(data.html_list_xem);
                            $('.count_list').text(data.list_look.length);
                            if(data.frame.id == id){
                                $('.button-likedd').removeClass('art_to_cart').css('color','#0D0D0D').text("ĐÃ THÍCH");
                            }
                            jQuery('.scrollbar-dynamic').scrollbar();
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });

            spbinhluan =0;
                $(document).on('submit','#d_sm_binhluan',function(e){
                    e.preventDefault();
                    var form = $('#d_sm_binhluan')[0];
                    var formData = new FormData(form);
                    if(spbinhluan == 0){
                        spbinhluan++;
                        $.ajax({
                        headers: {
                                      'X-CSRF-TOKEN': '{{ csrf_token() }}'
                                },
                        type:"post",
                        url:"{{route('ajax.sm.binhluan')}}",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success:function(data){
                            spbinhluan = 0;
                            if(data.status == true){
                                $("#d_sm_binhluan")[0].reset();
                                $('#d_notification').text('Cảm ơn bạn đã để lại bình luận. Bình luận của bạn được chờ duyệt bởi quản trị viên.').css({'display':'block'}).delay(4000).slideUp();
                            }
                        },
                        dataType:"json"
                    });
                    }
                    spbinhluan =1;
                });

             // open popup interactive
            $(document).on('click','.d_luotmua',function(e){
                e.preventDefault();
                id = $(this).data('id');
                $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-interactive' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    callbacks: {
                       beforeOpen: function() {
                         
                       },
                        beforeClose: function () {
                            $("#interactive-wrapscroll").getNiceScroll().remove();
                        }
                    }
                });
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.popup.luotmua')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_popup_all').html(data.html);
                            $('#d_ajax_l_xem').html(data.html_list_xem);
                            $('.count_list').text(data.list_look.length);
                            if(data.frame.id == id){
                                $('.button-likedd').removeClass('art_to_cart').css('color','#0D0D0D').text("ĐÃ THÍCH");
                            }
                            jQuery('.scrollbar-dynamic').scrollbar();
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });
             // open popup interactive
            $(document).on('click','.d_dactinh',function(e){
                e.preventDefault();
                id = $(this).data('id');
                $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-interactive' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    callbacks: {
                       beforeOpen: function() {
                         
                       },
                        beforeClose: function () {
                            $("#interactive-wrapscroll").getNiceScroll().remove();
                        }
                    }
                });
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.popup.dactinh')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_popup_all').html(data.html);
                            $('#d_ajax_l_xem').html(data.html_list_xem);
                            $('.count_list').text(data.list_look.length);
                            if(data.frame.id == id){
                                $('.button-likedd').removeClass('art_to_cart').css('color','#0D0D0D').text("ĐÃ THÍCH");
                            }
                            jQuery('.scrollbar-dynamic').scrollbar();
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });
             // open popup interactive
            $(document).on('click','.d_daily',function(e){
                e.preventDefault();
                id = $(this).data('id');
                $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-interactive' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    callbacks: {
                       beforeOpen: function() {
                         
                       },
                        beforeClose: function () {
                            $("#interactive-wrapscroll").getNiceScroll().remove();
                        },
                        open: function() {
                            $('html').css('overflow', 'hidden');
                        }
                    }
                });
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.popup.daily')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_popup_all').html(data.html);
                            $('#d_ajax_l_xem').html(data.html_list_xem);
                            $('.count_list').text(data.list_look.length);
                            if(data.frame.id == id){
                                $('.button-likedd').removeClass('art_to_cart').css('color','#0D0D0D').text("ĐÃ THÍCH");
                            }
                            jQuery('.scrollbar-dynamic').scrollbar();
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });



            //ajax popup binh luan
            $(document).on('click','.d_ajax_binhluan',function(e){
                e.preventDefault();
                id = $(this).data('id');
                container = $(this);
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.binhluan')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_ajax_popup').html(data.html);
                            $('#d_add_goo').html(data.view);
                            $('.interactive-active').removeClass('interactive-active');
                            container.addClass('interactive-active');
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });
            //ajax popup luot mua
            $(document).on('click','.d_ajax_luotmua',function(e){
                e.preventDefault();
                id = $(this).data('id');
                container = $(this);
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.luotmua')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_ajax_popup').html(data.html);
                            $('#d_add_goo').html(data.view);
                            $('.interactive-active').removeClass('interactive-active');
                            container.addClass('interactive-active');
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });
            //ajax popup dac tinh
            $(document).on('click','.d_ajax_dactinh',function(e){
                e.preventDefault();
                id = $(this).data('id');
                container = $(this);
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.dactinh')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_ajax_popup').html(data.html);
                            $('#d_add_goo').html(data.view);
                            $('.interactive-active').removeClass('interactive-active');
                            container.addClass('interactive-active');
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });

            $(document).on('click','.d_ajax_dai_ly',function(e){
                e.preventDefault();
                id = $(this).data('id');
                container = $(this);
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.daily')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_ajax_popup').html(data.html);
                            $('#d_add_goo').html(data.view);
                            $('.interactive-active').removeClass('interactive-active');
                            container.addClass('interactive-active');

                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });

            $(document).on('click','#d_google_maps',function(e){
                e.preventDefault();
                id = $(this).data('id');
                loca = $(this).data('loca');
                $('.abc').removeClass('dailyban-img-active')
                $('.d_maps_'+id).addClass('dailyban-img-active');
                function initMap() {
                 if( typeof(loca) !== "undefined") {
                    var lat      = parseFloat(loca.split(',')[0]);
                    var lng      =  parseFloat(loca.split(',')[1]);
                    
                    var myLatLng = {lat: lat, lng: lng};
                    var map = new google.maps.Map(document.getElementById('d_add_goo'), {
                        center: myLatLng,
                        zoom: 13,
                        disableDefaultUI: true,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    });

                    new google.maps.Marker({
                        map: map,
                        position: myLatLng
                    });
                 }
                
                }
                initMap();
            });

            $(document).on('click','.d_active_luotmua',function(e){
                e.preventDefault();
                id = $(this).data('id');
                container = $(this);
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.active.contructs')}}",
                    data:{'id':id},
                    success:function(data){
                        if(data.status == true){
                            $('#d_add_goo').html(data.html);
                            $('.luotmua-img-active').removeClass('luotmua-img-active');
                            container.addClass('luotmua-img-active');
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });

            // phong
            $(document).on('click','#p_youtube',function(){
            id = $(this).data('id');
             $.ajax({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
               },
               type:"get",
               url:"{{route('ajax.youtube.id')}}",
               data:{'id':id},
               success:function(data){
                 $("#id_youtube").html(data.html);
                 console.log(data.html);
               },
               cache:false,
               dataType: 'json'
             });
           });

            $(document).on('click','#p_video',function(){
            id = $(this).data('id');
            vid = $(this).data('vid');

            $.ajax({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
               },
               type:"get",
               url:"{{route('ajax.video.id')}}",
               data:{'id':id,'vid':vid},
               success:function(data){
                 $("#id_youtube").html(data.html);
                 console.log(data.html);
               },
               cache:false,
               dataType: 'json'
             });
            });

            $(document).ready(function() {
                $('.owl-model .owl-controls .owl-next').append('<img src="{!! asset('frontend/html/img/right-arrow.svg') !!}" alt="">');
                $('.owl-model .owl-controls .owl-prev').append('<img src="{!! asset('frontend/html/img/left-arrow.svg') !!}" alt="">');
                $('.owl-suggest .owl-controls .owl-next').append('<img src="{!! asset('frontend/html/img/right-arrow1.svg') !!}" alt="">');
                $('.owl-suggest .owl-controls .owl-prev').append('<img src="{!! asset('frontend/html/img/left-arrow1.svg') !!}" alt="">');
            });

            $(document).on('click','.seri-detail-dropdown',function() {
                $(this).next().slideToggle("slow");
                $(this).children().children().children().toggleClass('seri-detail-dropdown-rotate');
            });
  
        </script>
        <!-- nice scroll -->
@endsection