@extends('frontend.layout')
@section('title',$group_attr->name)
@section('meta')
     <meta name="description" content="{!! $group_attr->description !!}">
@endsection
@section('css')
    
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
                                    @if($group_attr->img)    
                                        <div class="item"><img src="{!! $group_attr->img !!}" alt="{!! $group_attr->img !!}"></div>
                                    @else
                                        <?php $logo = App\Item::where('key_layout','Caterory Banner')->first(); ?>
                                        <div class="item"><img src="{!! $logo->value !!}" alt="{!! $logo->value !!}"></div>
                                    @endif    
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- end of home-slide-top -->
                    <div class="home-catagory1">
                        <h5 class="home-catagory1-title">{!!  $group_attr->name  !!}</h5>
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
                                        <div class="home-catagory1-main" id="p_content_{!! $pr->id !!}_{!! $group_attr->id !!}">
                                            <a href="{!! route('getProDetail',['id'=>$frame_show[$i]->id,'slug'=>$frame_show[$i]->slug]) !!}"><img src="{{$frame_show[$i]->img}}" alt=""></a>
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
                                                    <a href="javascript:void(0);"><img @if(0 <= $i-1 ) class="p_pro" @endif data-id="{!! $i-1 !!}"   data-gr="{!! $group_attr->id !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/little-thin-left-arrow.svg') !!}" alt=""></a>
                                                    <h4>{{ $frame_show[$i]->name }}</h4>
                                                    <a href="javascript:void(0);"><img @if($i+1 < sizeof($frame_show)) class="p_pro" @endif  data-id="{!! $i+1 !!}"  data-gr="{!! $group_attr->id !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/thin-right-arrow.svg') !!}" alt=""></a>
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
                                <li><a class="d_cate" style=" cursor:pointer;" data-page="@if($frames->currentPage() > 1) {{ $frames->currentPage() - 1 }} @endif" data-group="{!! $group_attr->id !!}"  >Trang trước</a></li>
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
                                            <a class="d_cate {{ ($frames->currentPage() == $i) ? 'number-page-active' : '' }}" style="cursor:pointer;" data-page="{{ $i }}" data-group="{!! $group_attr->id !!}" href="{{ $frames->url($i) }}">{{ $i }}</a>
                                        </li>
                                    @endif
                              @endfor
                               <li><a class="d_cate" style="cursor:pointer;" data-page="@if($frames->currentPage() < $frames->lastPage()) {{ $frames->currentPage() + 1 }} @else {!! $frames->currentPage() !!}  @endif" data-group="{!! $group_attr->id !!}">Trang kế</a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div><!-- end of .number-page -->
                    </div><!-- end of home-catagory1 -->
                </div><!-- end of col-md-9 --> 
                <div class="col-md-3 content-right sidebar-offcanvas" id="sidebar" role="navigation">
                    <div class="content-right-seriname">
                        <h2>{!! $group_attr->name !!}</h2>
                        <p>{!! $group_attr->description !!}</p>
                        <div class="sp-blog pull-right">
                            <a href="{!! url('') !!}"><h4 class="pull-left">Sản phẩm</h4></a>
                            <a href="{!! url('/blog') !!}"><h4 class="pull-right">Blog</h4></a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="content-right-model">
                        <?php $group_attr0 = App\GroupAttribute::where('group_id',0)->get(); ?> 
                        @if(sizeof($group_attr0))
                            @foreach($group_attr0 as $key => $item) 
                                <a href="{!! route('get.Category',['id'=>$item->id,'slug'=>$item->slug]) !!}"><h5 style="    text-transform: uppercase;"  @if($group_attr->id == $item->id) class="content-right-model-active" @endif >{!! $item->name !!}</h5></a>
                            @endforeach
                        @endif
                    </div>
                    <div id="d_load_filter">
                        
                    </div>
                    @include('frontend.partinal.right_social')
                    @include('frontend.partinal.foooter')
                </div><!-- end of col-md-9 content-right --> 
            </div>
        </div>
@endsection
@section('js')
<script>
    $.ajax({
        headers: {
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('load.filter.frontend')}}",
        data:{'id':{!! $group_attr->id !!} },
        success:function(data){
            // console.log(data);
            $('#d_load_filter').html(data.html);
        },
        dataType: 'json'
    });
    // phân trang
    $(document).on('click','.d_cate',function(e){
        e.preventDefault();
        page = $(this).data('page');
        id_group = $(this).data('group');
            $.ajax({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            type:"post",
            url:"{{route('ajax.pagination.cate')}}",
            data:{'id_group':id_group,'page':page},
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
        gr = $(this).data('gr');
        pro = $(this).data('pro');
         $.ajax({
           headers: {
               'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
           },
           type:"get",
           url:"{{route('ajax.pro.id.cate')}}",
           data:{'id':id,'gr':gr,'pro':pro},
           success:function(data){
             $("#p_content_"+pro+"_"+gr).html(data.html);
             // console.log(data.html);
           },
           cache:false,
           dataType: 'json'
         });
       });

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
            url:"{{route('load.filter.click.frontend')}}",
            data:{'id':{{$group_attr->id}},'list':filter_list},
            success:function(data){
              $('#d_load_filter').html(data.view);
              $('#d_ajax_paginate').html(data.product_view);
              $('#d_ul_cate').html(data.product_paginate);
            },
            dataType:'json'
        });
    });

    $(document).on('click','.d_cate_click',function(e){
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
            url:"{{route('load.filter.click.frontend')}}",
            data:{'id':{{$group_attr->id}},'list':filter_list,'page':page},
            success:function(data){
              $('#d_load_filter').html(data.view);
              $('#d_ajax_paginate').html(data.product_view);
              $('#d_ul_cate').html(data.product_paginate);
            },
            dataType:'json'
        });
    });
    
</script>
@endsection
