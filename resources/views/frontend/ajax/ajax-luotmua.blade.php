@if(sizeof($frame_contruct) > 0)
    @foreach($frame_contruct as $item)
    <?php 
        $content = App\Content_contruct::where('contruct_id',$item->id)->first();
    ?>
    <div class="luotmua-img luotmua">
        <div class="luotmua-content">
            <h5 class="d_active_luotmua" style="cursor:pointer;" data-id="{!! $item->id !!}"><img src="{!! asset('frontend/html/img/camera.svg') !!}" alt="">{!! $item->name !!} <span>{!! date('d.m.Y',time($item->created_at)) !!}</span></h5>
            <span style="line-height:20px !important">{!! $content->content !!}</span>
        </div>
    </div>
    @endforeach
@endif