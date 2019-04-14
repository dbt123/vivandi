<div id="owl-slide" class="owl-carousel owl-model">  
    @foreach($list_image as $item)  
        <div class="item"><img style="width:100%;height:355px;" src="{!! asset($item->img) !!}" alt=""></div>
    @endforeach
</div>

