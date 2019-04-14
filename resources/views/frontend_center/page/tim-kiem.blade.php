@extends('frontend_center.layout')
@if($status == 0)
@section('title', 'Vivandi — '.$search_frames )
@endif
@section('meta')
@if($status == 0)
<meta name="description" content="Có {!! sizeof($frame_des) !!} Kết quả tìm kiếm với từ khóa: {!!  $search_frames  !!}">
@endif
@endsection
@section('css')
    <style>
        .d-no-search {
            position: relative;
            font-size: 9pt;
            margin-left: 18px;
            margin-top: 35px;
        }
        .d-no-search::before {
            position: absolute;
            content: '';
            width: 50px;
            height: 1px;
            background: #0d0d0d;
            top: 8px;
            left: -60px;
        }
    </style>
@endsection
@section('content')
    <div class="container main-content">
            <div class="row row-offcanvas row-offcanvas-right">
                <div class="col-md-9 wrap-home">
                    <div class="home-slide-top">
                        <div id="demo">
                            <div class="row">
                                <div class="span12">
                                    <div>
                                        <?php $logo = App\Item::where('key_layout','Caterory Banner')->first(); ?>
                                        <div class="item"><img src="{!! $logo->value !!}" alt="{!! $logo->value !!}"></div>   
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- end of home-slide-top -->
                    @if($status == 1)
                        <div class="d-no-search">Không tìm thấy sản phẩm nào phù hợp với từ khóa: {!! $search_frames !!}</div>
                    @else
                        <div class="home-catagory1">
                        <h5 class="home-catagory1-title">Có {!! sizeof($frame_des) !!} Kết quả với : {!!  $search_frames  !!}</h5>
                        <div class="row" >
                             <div id="d_ajax_paginate">
                                @foreach($frames as $item)
                                <?php
                                $id_product = $item->product_id;
                                $pr = DB::table('products')->where('id',$id_product)->first(); 
                                $frame_str =  $item->frame_str;
                                $list_frame = explode(",",$frame_str);
                                  $in = array();
                                  foreach ($list_frame as $key => $id_frame) {
                                      if($id_frame){
                                        array_push($in, $id_frame);
                                      }
                                  }
                                  $frame_show = App\Frame::whereIn('id',$in)->where('status',1)->get();
                                    $i = 0;
                                 ?>
                                    <div class="col-xs-6 col-sm-4 col-md-4 col-home-catagory">
                                        <div class="home-catagory1-main" id="p_content_{!! $pr->id !!}">
                                            <?php
                                              $a = route('getProDetail',['id'=>$frame_show[$i]->id,'slug'=>$frame_show[$i]->slug]);
                                              $pieces = explode('.', $a);
                                              unset($pieces[0]);
                                              $b = $pieces[1] .'.'. $pieces[2];
                                             
                                            ?>
                                              <?php
                                                $dem =0;
                                              ?>
                                              @foreach($frame_domain as $fd)
                                                @if ($fd->id == $frame_show[$i]->id)
                                                  <?php
                                                    $dem = 1;
                                                  ?>
                                                @endif 
                                              @endforeach
                                              @if ($dem==1)
                                                <a href="{!! route('getProDetaildomain',['id'=>$frame_show[$i]->id,'slug'=>$frame_show[$i]->slug]) !!}">
                                                <img src="{{$frame_show[$i]->img}}" alt="">
                                                </a>
                                              @else
                                                <a href="//{{$b}}">
                                                <img class="img-black-white" src="{{$frame_show[$i]->img}}" alt="">
                                                </a>
                                              @endif
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
                                                    <h4>{{ $frame_show[$i]->name }}</h4>
                                                    <a href="javascript:void(0);"></a>
                                                    @else
                                                    <a href="javascript:void(0);"><img @if(0 <= $i-1 ) class="p_pro" @endif data-id="{!! $i-1 !!}" data-search="{!! $search_frames !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/little-thin-left-arrow.svg') !!}" alt=""></a>
                                                    <h4>{{ $frame_show[$i]->name }}</h4>
                                                    <a href="javascript:void(0);"><img @if($i+1 < sizeof($frame_show)) class="p_pro" @endif  data-id="{!! $i+1 !!}" data-search="{!! $search_frames !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/thin-right-arrow.svg') !!}" alt=""></a>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="home-catagory1-main-bg"></div>
                                        </div>
                                    </div>
                                @endforeach
                             </div>  
                        </div>
                        <div class="number-page" id="d_ul_cate">
                        <?php $link_limit = 9;  ?>
                            <ul>
                                <li><a class="d_search" style=" cursor:pointer;" data-page="@if($frames->currentPage() > 1) {{ $frames->currentPage() - 1 }} @endif" data-search="{!! $search_frames !!}"  >Trang trước</a></li>
                                @for ($i = 1; $i <= $frames->lastPage(); $i++)
                                    <?php
                                    $half_total_links = floor($link_limit / 2);
                                    $from = $frames->currentPage() - $half_total_links;
                                    $to = $frames->currentPage() + $half_total_links;
                                    if ($frames->currentPage() < $half_total_links) {
                                       $to += $half_total_links - $frames->currentPage();
                                    }
                                    if ($frames->lastPage() - $frames->currentPage() < $half_total_links) {
                                        $from -= $half_total_links - ($frames->lastPage() - $frames->currentPage()) - 1;
                                    }
                                    ?>
                                    @if ($from < $i && $i < $to)
                                        <li>
                                            <a class="d_search {{ ($frames->currentPage() == $i) ? 'number-page-active' : '' }}" data-search="{!! $search_frames !!}" style="cursor:pointer;" data-page="{{ $i }}" href="{{ $frames->url($i) }}&search={!! $search_frames !!}">{{ $i }}</a>
                                        </li>
                                    @endif
                              @endfor
                               <li><a class="d_search" style="cursor:pointer;" data-page="@if($frames->currentPage() < $frames->lastPage()) {{ $frames->currentPage() + 1 }} @else {!! $frames->currentPage() !!}  @endif" data-search="{!! $search_frames !!}" >Trang kế</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div><!-- end of .number-page -->
                    </div><!-- end of home-catagory1 -->
                    @endif
                </div><!-- end of col-md-9 --> 
                <div class="col-md-3 content-right sidebar-offcanvas" id="sidebar" role="navigation">
                    <div class="content-right-seriname">
                        <h2>seriname</h2>
                        <p>description</p>
                        <div class="sp-blog pull-right">
                            <a href="{!! url('') !!}"><h4 class="pull-right">Sản phẩm</h4></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="content-right-model">
                        <?php $group_attr0 = App\GroupAttribute::where('group_id',0)->get(); ?> 
                        @if(sizeof($group_attr0))
                            @foreach($group_attr0 as $key => $item) 
                                <a href="{!! route('get.Categorydomain',['id'=>$item->id,'slug'=>$item->slug]) !!}"><h5 style="    text-transform: uppercase;"   {{-- class="content-right-model-active" --}} >{!! $item->name !!}</h5></a>
                            @endforeach
                        @endif
                    </div>
                   <div id="d_load_filter">
                        
                    </div>
                    @include('frontend_center.partinal.right_social')
                    @include('frontend_center.partinal.foooter')
                </div><!-- end of col-md-9 content-right --> 
            </div>
        </div>
@endsection
@section('js')
<script>
    @if($status == 0)
    // load filter search
    $.ajax({
        headers: {
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('load.filter.searchdomain')}}",
        data:{'search':"{{$search_frames}}" },
        success:function(data){
            $('#d_load_filter').html(data.html);
        },
        dataType: 'json'
    });
    //click filter search
    $(document).on('click','.filter_click',function(e){
        e.preventDefault();
        $(this).toggleClass('chucnag-active');
        x = $('.chucnag-active');
        filter_list = [];
        $.each(x,function(i, v) {
            id = $(v).data('filter');
            filter_list.push(id);
        });
        $.ajax({
            headers: {
                  'X-CSRF-TOKEN': "{{csrf_token()}}"
            },
            type:"post",
            url:"{{route('load.filter.click.searchdomain')}}",
            data:{'search':"{!! $search_frames !!}",'list':filter_list},
            success:function(data){
              $('#d_load_filter').html(data.view);
              $('#d_ajax_paginate').html(data.product_view);
              $('#d_ul_cate').html(data.product_paginate);
            },
            dataType:'json'
        });
    });

    // phân trang click filter ajax
    $(document).on('click','.d_search_click',function(e){
        e.preventDefault();
        page = $(this).data('page');
        $(this).toggleClass('chucnag-active');
        x = $('.chucnag-active');
        filter_list = [];
        $.each(x,function(i, v) {
            id = $(v).data('filter');
            filter_list.push(id);
        });
        $.ajax({
            headers: {
                  'X-CSRF-TOKEN': "{{csrf_token()}}"
            },
            type:"post",
            url:"{{route('load.filter.click.searchdomain')}}",
            data:{'search':"{{$search_frames}}",'list':filter_list,'page':page},
            success:function(data){
              $('#d_load_filter').html(data.view);
              $('#d_ajax_paginate').html(data.product_view);
              $('#d_ul_cate').html(data.product_paginate);
            },
            dataType:'json'
        });
    });

    // phân trang
    $(document).on('click','.d_search',function(e){
        e.preventDefault();
        search = $(this).data('search');
        page = $(this).data('page');
            $.ajax({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            type:"post",
            url:"{{route('ajax.pagination.search.domain')}}",
            data:{'search':search,'page':page},
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
    $(document).on('click','.p_pro',function(e){
            e.preventDefault();
            p_pro=this;
        id = $(this).data('id');
        pro = $(this).data('pro');
        search = $(this).data('search');
         $.ajax({
           headers: {
               'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
           },
           type:"get",
           url:"{{route('ajax.pro.search.domain')}}",
           data:{'id':id,'search':search,'pro':pro},
           success:function(data){
             $("#p_content_"+pro).html(data.html);
           },
           cache:false,
           dataType: 'json'
         });
       });
@endif
   
</script>
@endsection
