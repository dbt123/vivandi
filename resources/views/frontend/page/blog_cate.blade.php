@extends('frontend.layout')
<?php
    $meta = DB::table('categories')->where('id',$id_dm)->first();
?>
@section('title',$meta->name)
@section('meta')
    <meta name="description" content="{!! $meta->description !!}">
    <!-- share -->

    <meta property="og:url"           content="{{URL::route('frontend.blog.cate',['prefix'=>$meta->prefix,'id'=>$meta->id])}}" />
    <meta property="og:type"          content="website"/>
    <meta property="og:title"         content="{!! $meta->name !!}" />
    @if ($meta->description)
    <meta property="og:description"   content="{!! $meta->description!!}" />
    @endif
    @if ($meta->img)
    <meta property="og:image"         content="{!! asset($meta->img) !!}" />
    @endif
@endsection
@section('css')
            <!-- blog detail -->
        <link rel="stylesheet" href="{!! asset('frontend/html/css/css/blog-detail.css') !!}" />
            <!-- blog catagory -->
        <link rel="stylesheet" href="{!! asset('frontend/html/css/css/blog-catagory.css') !!}" />
@endsection
    <style type="text/css">
        .p-no-blog-category {
            position: relative;
            font-size: 9pt;
            margin-left: 18px;
            margin-top: 8px;
        }
        .p-no-blog-category::before {
            position: absolute;
            content: '';
            width: 50px;
            height: 1px;
            background: #0d0d0d;
            top: 8px;
            left: -60px;
        }
    </style>
@section('content')        
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
                <!-- end of Button off-canvas -->
                @if($status==0)
                <div class="col-md-9 wrap-blog-detail-main blog-catagory1">
                    <div>
                            <div id="d_ajax_paginate">
                                <?php 
                                    $kt =0;
                                ?>
                                @foreach($post as $p)
                                <?php
                                    $kt=$kt+1;
                                ?>
                                @if ($kt % 2 != 0)
                                    <div class="blog-catagory-section">
                                        <div class="row">
                                            <div class="col-sm-6 col-blog-catagory-left">
                                                <img src="{{$p->img}}" alt="">
                                            </div><!-- end of col-md-6 -->
                                            <div class="col-sm-6 col-blog-catagory-right">
                                                <div class="wrap-blog-catagory-content">
                                                    <h1>{{$p->title}}</h1>
                                                    <?php $date = new DateTime($p->created_at);?>
                                                    <p class="blog-detail-date">{{$date->format(' d.m.Y ')}}</p>
                                                    <p class="blog-catagory-content">{!! substr( $p->description,  0, 140); !!} <span>...</span></p>
                                                    <a href="{!! route('Get.Blog.Detail',['id'=>$p->id,'slug'=>$p->slug]) !!}">
                                                        <div class="button-download">
                                                            <button>Chi tiết</button>
                                                            <div class="button-white"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div><!-- end of col-md-6 -->
                                        </div>
                                    </div>
                                    <!-- end of blog-catagory-section -->
                                @else
                                    <div class="blog-catagory-section">
                                        <div class="row">
                                            <div class="col-sm-6 col-blog-catagory-left">
                                                <img src="{{$p->img}}" alt="">
                                            </div><!-- end of col-md-6 -->
                                            <div class="col-sm-6 col-blog-catagory-right">
                                                <div class="wrap-blog-catagory-content">
                                                    <h1>{{$p->title}}</h1>
                                                    <?php $date = new DateTime($p->created_at);?>
                                                    <p class="blog-detail-date">{{$date->format(' d.m.Y ')}}</p>
                                                    <p class="blog-catagory-content">{!! substr( $p->description,  0, 140); !!} <span>...</span></p>
                                                    <a href="{!! route('Get.Blog.Detail',['id'=>$p->id,'slug'=>$p->slug]) !!}">
                                                        <div class="button-download">
                                                            <button>Chi tiết</button>
                                                            <div class="button-white"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div><!-- end of col-md-6 -->
                                        </div>
                                    </div>
                                    <!-- end of blog-catagory-section -->
                                @endif
                                @endforeach
                            </div>
                        <div class="clearfix"></div>
                        <div class="number-page" id="d_ul_cate">
                                    <?php $link_limit = 9;  ?>
                                    <ul>
                                        <li><a class="d_cate" style=" cursor:pointer;" data-page="@if($post->currentPage() > 1) {{ $post->currentPage() - 1 }} @endif" data-id="{{$id_dm}}">Trang trước</a></li>
                                        @for ($i = 1; $i <= $post->lastPage(); $i++)
                                            <?php
                                            $half_total_links = floor($link_limit / 2);
                                            $from = $post->currentPage() - $half_total_links;
                                            $to = $post->currentPage() + $half_total_links;
                                            if ($post->currentPage() < $half_total_links) {
                                               $to += $half_total_links - $post->currentPage();
                                            }
                                            if ($post->lastPage() - $post->currentPage() < $half_total_links) {
                                                $from -= $half_total_links - ($post->lastPage() - $post->currentPage()) - 1;
                                            }
                                            ?>
                                            @if ($from < $i && $i < $to)
                                                <li>
                                                    <a class="d_cate {{ ($post->currentPage() == $i) ? 'number-page-active' : '' }}" style="cursor:pointer;" data-page="{{ $i }}" data-id="{{$id_dm}}"  href="{{ $post->url($i) }}">{{ $i }}</a>
                                                </li>
                                            @endif
                                      @endfor
                                       <li><a class="d_cate" style="cursor:pointer;" data-page="@if($post->currentPage() < $post->lastPage()) {{ $post->currentPage() + 1 }} @else {!! $post->currentPage() !!}  @endif" data-id="{{$id_dm}}">Trang kế</a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                        </div><!-- end of .number-page -->
                    </div>
                </div><!-- end of col-md-9 --> 
                @else
                    <div class="col-md-9 wrap-blog-detail-main blog-catagory1">
                        <div class="p-no-blog-category">Danh mục này chưa có bài viết nào.</div>
                    </div>
                @endif
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
                            @if ($dm->id==$id_dm)
                            <a href="{{route('frontend.blog.cate',['prefix'=>$dm->prefix,'id'=>$dm->id])}}"><h5 style="text-transform:uppercase" class="content-right-model-active">{{$dm->name}}</h5></a>
                            @else
                            <a href="{{route('frontend.blog.cate',['prefix'=>$dm->prefix,'id'=>$dm->id])}}"><h5 style="text-transform:uppercase">{{$dm->name}}</h5></a>
                            @endif
                        @endforeach
                    </div>
                    <!-- <div class="content-right-dieukhoan content-right-blog-new">
                        <h4>Blog mới</h4>
                        <?php
                            $title = DB::table('posts')->orderby('id','desc')->limit(5)->get();
                        ?>
                        @foreach($title as $t)
                        <h5><a href="">{{$t->title}}</a></h5>
                        @endforeach
                    </div> -->
                    <div class="content-right-dieukhoan content-right-blog-tag">
                        <h4>Tag</h4>
                        <?php
                            $tag  = DB::table('tags')->get();
                            $d =0;
                        ?>
                        @foreach($tag as $t)
                            <?php
                                $tag_post = DB::table('tag_post')->where('tag_id',$t->id)->get();
                                $kt =0;
                            ?>
                            @if(sizeof($tag_post>0))
                            @foreach($tag_post as $tp)
                                <?php
                                    $post_tag = DB::table('posts')->where('id',$tp->post_id)->where('status',1)->first();
                                    if(sizeof($post_tag)>0){
                                        $kt=1;
                                    }
                                ?>
                            @endforeach
                                @if($kt==1)
                                    <h5><a href="{{route('frontend.blog.tag',['prefix'=>$t->tag,'id'=>$t->id])}}">{{$t->tag}}</a></h5>
                                    <?php
                                        $d =$d+1;
                                        if ($d==5) break;
                                    ?>
                                @endif
                            @endif
                        @endforeach
                    </div> 
                    @include('frontend.partinal.right_social')
                    @include('frontend.partinal.foooter')
                </div><!-- end of col-md-9 content-right --> 
            </div>
        </div>
        <!-- POPUP ///////////////////////////////////////////////////////////////////////////// -->
        
        <!-- end of vivaldi popup -->
@endsection
@section('js')
<script type="text/javascript">
// phân trang
    $(document).on('click','.d_cate',function(e){
        e.preventDefault();
        page = $(this).data('page');
        id = $(this).data('id');
            $.ajax({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            type:"post",
            url:"{{route('ajax.pagination.blogcate')}}",
            data:{'page':page,'id':id},
            success:function(data){
                if(data.status == true){
                    $('#d_ajax_paginate').html(data.html);
                    $('#d_ul_cate').html(data.ul);
                }
            },
            cache:false,
            dataType: 'json'
        });
    }); 
    //
</script>
@endsection 
