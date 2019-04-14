@extends('frontend.layout')
<?php
    $meta_title = DB::table('items')->where('key_layout','Meta Home')->where('key_item','title')->first();
    $meta_des = DB::table('items')->where('key_layout','Meta Home')->where('key_item','description')->first();
    $meta_img = DB::table('items')->where('key_layout','Meta Home')->where('key_item','image')->first();
?>
@if (sizeof($meta_title))
@section('title',$meta_title->value)
@else
@section('title',"No name")
@endif
@section('meta')
    @if (sizeof($meta_des))
    <meta name="description" content="{!! $meta_des->value !!}">
    @endif
    <!-- share -->
    <meta property="og:url"           content="{{URL::route('home')}}" />
    <meta property="og:type"          content="website"/>

    @if (sizeof($meta_title))
    <meta property="og:title"         content="{!! $meta_title->value !!}" />
    @endif

    @if (sizeof($meta_des))
    <meta property="og:description"   content="{!! $meta_des->value!!}" />
    @endif

    @if (sizeof($meta_img))
    <meta property="og:image"         content="{!! asset($meta_img->value) !!}" />
    @endif
@endsection
@section('css')
   <!-- Parallax Slideshow --> <!-- story -->
    <link rel="stylesheet" href="{!! asset('frontend/html/css/css/parallaxSlideshow.css')!!}" /> 
    <link rel="stylesheet" href="{!! asset('frontend/html/css/css/hover-min.css')!!}" /> 
@endsection
@section('content')
    <div class="container main-content">
            <div class="row row-offcanvas row-offcanvas-right">
                <div class="col-md-9 wrap-home">
                    <div class="home-slide-top">
                        <div id="demo">
                            <div class="row">
                                <div class="span12">
                                    <div id="owl-slide" class="owl-carousel owl-model">  
                                        <?php
                                            $slide = DB::table('slides')->where('type','Home')->where('status',1)->get();
                                        ?>
                                        @if(sizeof($slide))
                                        @foreach($slide as $s)  
                                        <div class="item"><img src="{{$s->img_1}}" alt=""></div>
                                        @endforeach
                                        @else
                                        <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=73&txt=851%C3%97292&w=851&h=292" alt=""></div>
                                        <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=73&txt=851%C3%97292&w=851&h=292" alt=""></div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of home-slide-top -->

                    @foreach($group as $key => $gr)
                        <div class="home-catagory1">
                            <h5 class="home-catagory1-title">{{$gr->name}}</h5>
                            <div class="row">
                            <?php
                              $pro_cate = DB::table('product_category')->where('cate_pro_id',$gr->id)->get();
                            ?>
                            @foreach($pro_cate as $pc)
                              <?php
                                $fra_cate = DB::table('frame_categorys')->where('cate_pro_id',$gr->id)->get();
                                $in = array();
                              ?>
                              @foreach($fra_cate as $fc)
                                <?php
                                  $frame = DB::table('frames')->where('id',$fc->frame_id)->where('product_id',$pc->product_id)->where('status',1)->first();

                                ?>
                                @if (sizeof($frame)>0)                             
                                 
                                    <?php 
                                      array_push($in, $frame->id);
                                    ?>
                                  
                                @endif
                              @endforeach
                                @if (sizeof($in)>0)
                                  <?php
                                    $frame_show = App\Frame::whereIn('id',$in)->get();
                                    $i=0;
                                  ?>
                                  <?php $pr = DB::table('products')->where('id',$pc->product_id)->first(); ?>
                                  <div class="col-xs-6 col-sm-4 col-md-4 col-home-catagory">
                                        <div class="home-catagory1-main" id="p_content_{!! $pr->id !!}_{!! $gr->id !!}">
                                            <a href="{!! route('getProDetail',['id'=>$frame_show[$i]->id,'slug'=>$frame_show[$i]->slug]) !!}"><img src="{{$frame_show[$i]->thumb_images}}" alt=""></a>
                                            @if ($frame_show[$i]->label==1)
                                              <div class="nhan-new">New</div>
                                            @endif
                                            @if ($frame_show[$i]->label==2)
                                              <div class="nhan-best">Kool</div>
                                            @endif
                                            @if ($frame_show[$i]->label==3)
                                              <div class="nhan-red">Sale</div>
                                            @endif
                                            <div class="next-catagory">
                                                <h4>{{$pr->name}}</h4>
                                                <div class="control-catagory">
                                                    @if (sizeof($frame_show)==1)
                                                      <a href="javascript:void(0);"></a>
                                                      <h4>{{$frame_show[$i]->name}}</h4>
                                                      <a href="javascript:void(0);"></a>
                                                    @else
                                                      <a href="javascript:void(0);"><img @if(0 <= $i-1 ) class="p_pro" @endif data-id="{!! $i-1 !!}"   data-gr="{!! $gr->id !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/little-thin-left-arrow.svg') !!}" alt=""></a>
                                                      <h4>{{$frame_show[$i]->name}}</h4>
                                                      <a href="javascript:void(0);"><img @if($i+1 < sizeof($frame_show)) class="p_pro" @endif  data-id="{!! $i+1 !!}"  data-gr="{!! $gr->id !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/thin-right-arrow.svg') !!}" alt=""></a>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="home-catagory1-main-bg"></div>
                                        </div>
                                  </div>
                                @endif
                            @endforeach  
                            
                            </div>     
                        </div>
                        @if ($key==0)
                          <div class="slide-catagory">
                        <h5 class="home-catagory1-title">Baner layout</h5>
                        <div id="demo">
                            <div class="row">
                                <div class="span12">
                                    <div id="slide-catagory" style="z-index:10" class="owl-carousel owl-catagory">
                                        <?php
                                            $slide = DB::table('slides')->where('type','Banner Home')->where('status',1)->get();
                                        ?>
                                        @if(sizeof($slide))
                                        @foreach($slide as $s)  
                                        <a href="{{$s->link_1}}"><div class="item"><img src="{{$s->img_1}}" alt=""></div></a>
                                        @endforeach
                                        @else
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                            <div class="item"><img src="https://placeholdit.imgix.net/~text?txtsize=40&txt=423%C3%97280&w=423&h=280" alt=""></div>
                                        @endif    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of slide-catagory -->
                        @endif
                    @endforeach
                    <div class="home-catagory3 ">
                        
                    </div><!-- end of home-catagory1 -->
                </div><!-- end of col-md-9 --> 
                <div class="col-md-3 content-right sidebar-offcanvas" id="sidebar" role="navigation">
                    <div class="content-right-seriname">
                        <?php
                            $slogan = DB::table('items')->where('key_layout','Slogan')->where('key_item','Slogan')->first();
                            $description = DB::table('items')->where('key_layout','Slogan')->where('key_item','Description')->first();
                        ?>
                        @if(sizeof($slogan))
                        <h2>{{$slogan->value}}</h2>
                        @else
                        <h2>Series name</h2>
                        @endif

                        @if(sizeof($description))
                        <p>{{$description->value}}</p>
                        @else
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</p>
                        @endif
                        <div class="sp-blog pull-right">
                            <a href="{!! url('') !!}"><h4 class="pull-left">Sản phẩm</h4></a>
                            <a href="{!! url('/blog') !!}"><h4 class="pull-right">Blog</h4></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- danhmuc -->
                    <div class="content-right-model">
                        <?php $group_attr = App\GroupAttribute::where('group_id',0)->get(); ?> 
                        @if(sizeof($group_attr))
                            @foreach($group_attr as $key => $item) 
                                <a href="{!! route('get.Category',['id'=>$item->id,'slug'=>$item->slug]) !!}"><h5 style="    text-transform: uppercase;" >{!! $item->name !!}</h5></a>
                            @endforeach
                        @endif
                    </div>
                    <!-- end danhmuc -->
                    @include('frontend.partinal.right_social')
                    @include('frontend.partinal.foooter')
                </div><!-- end of col-md-9 content-right --> 
            </div>
        </div>

<?php
  $story_slide =  DB::table('slides')->where('type','Slide Story')->where('status',1)->get();
?>
@foreach($story_slide as $key => $ss)
  <input type="hidden" name="slide_{!! $key !!}" value="{{$ss->des_1}}" id="slideid_{!! $key !!}" >
@endforeach
@endsection

@section('js')
<!-- Scrollify --> <!-- story -->
        <script type="text/javascript" src="{!! asset('frontend/html/js/jquery.scrollify.js') !!}"></script>
        <!-- Smooth scrool --> <!-- story -->
        <script type="text/javascript" src="{!! asset('frontend/html/js/smoothScroll.js') !!}"></script>
        <!-- Parallax slideshow --> <!-- story -->
        <script type="text/javascript" src="{!! asset('frontend/html/js/parallax-slideshow.js') !!}"></script>
        <script type="text/javascript">
           var slider1 = [
          {
            text: $('#slideid_0').val(),
          }
        ]
        var slider2 = [
          {
            text: $('#slideid_1').val(),
          }
        ]
        var slider3 = [
          {
            text: $('#slideid_2').val(),
          }
        ]
        var slider4 = [
          {
            text: $('#slideid_3').val(),
          }
        ]
        var slider5 = [
          {
            text: $('#slideid_4').val(),
          }
        ]
        var slider6 = [
          {
            text: $('#slideid_5').val(),
          }
        ]
       

        $(function() {
          $('#slider-0-content').typelink({
            pages: slider1
          });
        });

        $('.arrow.a2').on('click', function() {
          $('#slider-1-content').typelink({
            pages: slider2
          });
        });

        $('.arrow.a3').on('click', function() {
          $('#slider-2-content').typelink({
            pages: slider3
          });
        });
        $('.arrow.a4').on('click', function() {
          $('#slider-3-content').typelink({
            pages: slider4
          });
        });
        $('.arrow.a5').on('click', function() {
          $('#slider-4-content').typelink({
            pages: slider5
          });
        });
        $('.arrow.a6').on('click', function() {
          $('#slider-5-content').typelink({
            pages: slider5
          });
        });
        </script>
        <script>
            $(function() {
                $.scrollify({
                    section : ".example-classname",
                    interstitialSection : "",
                    easing: "easeOutExpo",
                    scrollSpeed: 1500,
                    offset : 0,
                    scrollbars: true,
                    standardScrollElements: "",
                    setHeights: false,
                    overflowScroll: true,
                    updateHash: false,
                    touchScroll:false,
                    before:function() {},
                    after:function() {

                    },
                    afterResize:function() {},
                    afterRender:function() {}
                });
            });
        </script>
        <script type="text/javascript">
          $(document).on('click','.off-story',function(e){
                e.preventDefault();
              id=1;
              thiss = this;
              $("#a").removeClass("margin-story");
                 $("#b").removeClass("vivandi-none");
                 $("#pscroll" ).attr( "id", "scroll-animate" );
                 $("#pscroll-m" ).attr( "id", "scroll-animate-main" );
                 // $(".vivandi-stories").remove();
                 $(thiss).remove();
            
           });
        </script>
     <script>
            // open popup interactive
            $(document).on('click','.modal-popup-interactive',function(){
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
                        close: function () {
                            $("#interactive-wrapscroll").niceScroll().remove();
                        }
                    }
                });
                // $("body").css('overflow','hidden');
                // close magific-popup and nice-scroll
                setTimeout(function(){
                    $("#interactive-wrapscroll").niceScroll({
                        zindex:"99999",
                        cursorborderradius: "0",
                        cursorcolor: "#404040",
                        cursoropacitymin: 1,
                        cursoropacitymax: 1,
                        cursorwidth: "2px",
                        cursorborder: "none",
                    });
                }, 150);
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
              // "singleItem:true" is a shortcut for:
              items : 1,
              autoPlay : true
              // itemsDesktop : false,
              // itemsDesktopSmall : false,
              // itemsTablet: false,
              // itemsMobile : false
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
              // singleItem : true,
              // "singleItem:true" is a shortcut for:
              items : 4,
              autoPlay : true,
              // itemsDesktop : false,
              // itemsDesktopSmall : false,
              // itemsTablet: false,
              // itemsMobile : false
              });
            });
        </script>
        <script>
            $(document).ready(function() {
              $(".owl-catagory").owlCarousel ({
              navigation : true,
              pagination : false,
              slideSpeed : 200,
              paginationSpeed : 400,
              // singleItem : true,
              // "singleItem:true" is a shortcut for:
              items : 2,
              autoPlay : true,
              // itemsDesktop : false,
              // itemsDesktopSmall : false,
              // itemsTablet: false,
              // itemsMobile : false
              });
            });
        </script>

        <!-- add next... slide -->
        <script>
            $(document).ready(function() {
                $('.owl-model .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow.svg') !!}" alt="">');
                $('.owl-model .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow.svg') !!}" alt="">');
                $('.owl-suggest .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow1.svg') !!}" alt="">');
                $('.owl-suggest .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow1.svg') !!}" alt="">');
                $('.owl-catagory .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow1.svg') !!}" alt="">');
                $('.owl-catagory .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow1.svg') !!}" alt="">');
            });
        </script>
        <!-- click button yêu thích -->
        <script>
            $(document).on('click','.button-like',function() {
                $('.button-like button').toggleClass('button-liked');
                if($(this).children('button').hasClass('button-liked')){
                    $(this).find('.duycon').text('Đã');
                }else{
                     $(this).find('.duycon').text('Yêu');
                }
            });
        </script>

        <script>
            $(document).on('click','.p_pro',function(e){
                e.preventDefault();
                p_pro=this;
            id = $(this).data('id');
            gr = $(this).data('gr');
            pro = $(this).data('pro');
             $.ajax({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
               },
               type:"get",
               url:"{{route('ajax.pro.id')}}",
               data:{'id':id,'gr':gr,'pro':pro},
               success:function(data){
                 $("#p_content_"+pro+"_"+gr).html(data.html);
                 // console.log(data.html);
               },
               cache:false,
               dataType: 'json'
             });
           });
        </script>
@endsection
