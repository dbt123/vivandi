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
  $frame_show = App\Frame::whereIn('id',$in)->where('status',1)->orderby('updated_at','desc')->get();
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
                    <a href="javascript:void(0);"><img @if(0 <= $i-1 ) class="p_pro" @endif data-id="{!! $i-1 !!}"   data-gr="{!! $group_attr->id !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/little-thin-left-arrow.svg') !!}" alt=""></a>
                    <h4>{{$frame_show[$i]->name}}</h4>
                    <a href="javascript:void(0);"><img @if($i+1 < sizeof($frame_show)) class="p_pro" @endif  data-id="{!! $i+1 !!}"  data-gr="{!! $group_attr->id !!}" data-pro="{!! $pr->id !!}" src="{!! asset('frontend/html/img/thin-right-arrow.svg') !!}" alt=""></a>
                </div>
            </div>
            <div class="home-catagory1-main-bg"></div>
        </div>
    </div>
@endforeach