<?php
      $a = route('getProDetail',['id'=>$frame_show[$id]->id,'slug'=>$frame_show[$id]->slug]);
      $pieces = explode('.', $a);
      unset($pieces[0]);
      $b = $pieces[1] .'.'. $pieces[2];
     
    ?>
      <?php
        $dem =0;
      ?>
      @foreach($frame_domain as $fd)
        @if ($fd->id == $frame_show[$id]->id)
          <?php
            $dem = 1;
          ?>
        @endif 
      @endforeach
      @if ($dem==1)
        <a href="{!! route('getProDetaildomain',['id'=>$frame_show[$id]->id,'slug'=>$frame_show[$id]->slug]) !!}">
        <img src="{{$frame_show[$id]->img}}" alt="">
        </a>
      @else
        <a href="//{{$b}}">
        <img class="img-black-white" src="{{$frame_show[$id]->img}}" alt="">
        </a>
      @endif
@if ($frame_show[$id]->label==1)
  <div class="nhan-new">New</div>
@endif
@if ($frame_show[$id]->label==2)
  <div class="nhan-best">Kool</div>
@endif
@if ($frame_show[$id]->label==3)
  <div class="nhan-red">Sale</div>
@endif
<div class="next-catagory">
    <h4>{{$pr->name}}</h4>
    <div class="control-catagory">
        <a href="javascript:void(0);"><img @if(0 <= $id-1 ) class="p_pro" @endif data-id="{!! $id-1 !!}"  data-search="{!! $search_frames !!}" data-pro="{!! $pr->id!!}"  src="{!! asset('frontend/html/img/little-thin-left-arrow.svg') !!}" alt=""></a>
        <h4>{{$frame_show[$id]->name}}</h4>
        <a href="javascript:void(0);"><img @if($id+1 < sizeof($frame_show)) class="p_pro" @endif  data-id="{!! $id+1 !!}"  data-search="{!! $search_frames !!}" data-pro="{!! $pr->id!!}" src="{!! asset('frontend/html/img/thin-right-arrow.svg') !!}" alt=""></a>
    </div>
</div>
<div class="home-catagory1-main-bg"></div>