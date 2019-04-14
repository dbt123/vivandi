@extends('frontend.layout')
@section('title',$post->title)
@section('meta')
<meta name="description" content="{!! $post->description !!}">
<meta property="og:url"           content="{{URL::route('Get.Blog.Detail',['id'=>$post->id,'slug'=>$post->slug])}}" />
    <meta property="og:type"          content="website" />
    <meta property="og:title"         content="{!! $post->title !!}" />
    <meta property="og:description"   content="{!! $post->description!!}" />
    @if ($post->img)
    <meta property="og:image"         content="{!! asset($post->img) !!}" />
    @endif
@endsection
@section('css')
    <link rel="stylesheet" href="{!! asset('frontend/html/css/css/blog-detail.css') !!}" />
@endsection
@section('content')
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
                <!-- end of Button off-canvas -->
                <div class="col-md-9 wrap-blog-detail-main">
                    <div class="blog-detail-main">
                        <div>
                            <h1>{!! $post->title !!}</h1>
                            <p class="blog-detail-date">{!! date('d.m.Y',time($post->created_at)) !!}</p>
                            <p class="blog-detail-content">
                                <?php $contents = $post->contents;
                                    $cate = $post->getCategory()->first();
                                ?>
                                @foreach($contents as $content)
                                    {!!$content->content!!}
                                @endforeach
                            </p>
                            <div style="padding-top:30px;">
                                <div class="fb-comments" data-href="{!! route('Get.Blog.Detail',['id'=>$post->id,'slug'=>$post->slug]) !!}" data-numposts="5" data-width="100%"></div>
                            </div>
                        </div>
                        <div class="blog-detail-share">
                        <?php $url = route('Get.Blog.Detail',['id'=>$post->id,'slug'=>$post->slug]); ?>
                            <a class="share-facebook" href="http://www.facebook.com/sharer.php?u={{$url}}"><i class="fa fa-facebook"></i></a>
                            <a class="share-twitter" href="http://twitter.com/share?url={{$url}}"><i class="fa fa-twitter"></i></a>
                            <a class="share-google-plus" href="https://plus.google.com/share?url={{$url}}"><i class="fa fa-google-plus"></i></a>
                            <a class="share-instagram" href="https://www.instagram.com/share?url={{$url}}"><i class="fa fa-instagram"></i></a>
                        </div>
                        <?php $tag = $post->getPostTag()->get();
                            $arr = array();
                            foreach ($tag as $key => $value) {
                                array_push($arr,$value->id);
                            }
                            $tag_lquan = App\Tag_post::select("posts.*",'tag_post.tag_id')->wherein('tag_post.tag_id',$arr)->where('tag_post.post_id',"<>",$post->id)->groupby('tag_post.post_id')->leftjoin('posts','tag_post.post_id','=','posts.id')->limit(6)->get();
                         ?>
                        <div class="blog-detail-suggest">
                            <h3>bài biết liên quan</h3>
                            <div id="demo">
                                <div class="span12">
                                    <div id="slide-catagory" class="owl-carousel owl-blog-detail">    
                                        @foreach($tag_lquan as $item)
                                            <div class="item">
                                                <div class="bd-hover-img">
                                                    <div class="bd-hover-img2">
                                                        <a href="{!! route('Get.Blog.Detail',['id'=>$item->id,'slug'=>$item->slug]) !!}"><img src="{!! $item->img !!}" alt="{!! $item->img !!}"></a>
                                                    </div>
                                                </div>
                                                <a href=""><h3>{!! $item->title !!}</h3></a>
                                                <p class="blog-detail-date">{!! date("d.m.Y",time($item->created_at)) !!}</p>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div> <!-- end of demo -->
                        </div>
                    </div>
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
                            <a href=""><h4 class="pull-right">Blog</h4></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                   <div class="content-right-model">
                        <!-- <span href=""><h5 class="content-right-model-active">Catagory 1</h5></span> -->
                        <?php
                            $danhmuc = DB::table('categories')->where('parent_id',0)->where('editable',0)->get();
                        ?>
                        @foreach($danhmuc as $dm)
                            <span><a href="{{route('frontend.blog.cate',['prefix'=>$dm->prefix,'id'=>$dm->id])}}"><h5 style="text-transform:uppercase">{{$dm->name}}</h5></a></span>
                        @endforeach
                    </div>
                    <div class="content-right-dieukhoan content-right-blog-tag">
                        <h4>Tag</h4>
                        @foreach($tag as $key => $item)
                            @if($key < 5 ) 
                                <h5><a style="cursor:pointer;">{!! $item->tag !!}</a></h5>
                            @endif
                        @endforeach
                    </div>
                    @include('frontend.partinal.right_social')
                    @include('frontend.partinal.foooter')
                </div><!-- end of col-md-9 content-right --> 
            </div>
        </div>
@endsection
@section('js')
<script>
            $(document).ready(function() {
              $(".owl-blog-detail").owlCarousel ({
              navigation : true,
              pagination : false,
              slideSpeed : 1000,
              paginationSpeed : 1000,
              items : 2,
              autoPlay : true,
              });
            });
            $(document).ready(function() {
                $('.owl-blog-detail .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow1.svg') !!}" alt="">');
                $('.owl-blog-detail .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow1.svg') !!}" alt="">');
            });
   
</script>
@endsection
