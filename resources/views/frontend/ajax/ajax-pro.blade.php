<a href="{!! route('getProDetail',['id'=>$frame_show[$id]->id,'slug'=>$frame_show[$id]->slug]) !!}"><img src="{{$frame_show[$id]->img}}" alt=""></a>
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
        <a href="javascript:void(0);"><img @if(0 <= $id-1 ) class="p_pro" @endif data-id="{!! $id-1 !!}"  data-gr="{!! $gr !!}" data-pro="{!! $pr->id!!}" src="{!! asset('frontend/html/img/little-thin-left-arrow.svg') !!}" alt=""></a>
        <h4>{{ $frame_show[$id]->name }}</h4>
        <a href="javascript:void(0);"><img @if($id+1 < sizeof($frame_show)) class="p_pro" @endif  data-id="{!! $id+1 !!}"  data-gr="{!! $gr !!}" data-pro="{!! $pr->id!!}" src="{!! asset('frontend/html/img/thin-right-arrow.svg') !!}" alt=""></a>
    </div>
</div>
<div class="home-catagory1-main-bg"></div>