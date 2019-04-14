<?php $name="";?>
<p style="padding-bottom: 19px; font-size: 8.5pt;">{!! $frame->description !!}</p>
<div class="dactinh">
    @foreach($feature1 as $key => $item)
        @if($item->name != $name)
                <div class="dailyban-content">
                    <h5>{!! $item->name !!}</h5>
                    <p><span> 
        @endif
        @if(isset($feature1[$key+1]))
            @if($feature1[$key+1]->name != $feature1[$key]->name)
                    {!! $item->value !!}</span></p>
                </div>
            @else
                {!! $item->value !!}</span>
            @endif
        @else            
                {!! $item->value !!} </span></p>
            </div>
        @endif    
    <?php $name = $item->name;?>        
    @endforeach
</div>
<script>
    setTimeout(function(){  
        $("#interactive-wrapscroll").getNiceScroll().remove();
        $("#interactive-wrapscroll").niceScroll({ zindex:"99999",
        cursorborderradius: "0",
        cursorcolor: "#404040",
        cursoropacitymin: 1,
        cursoropacitymax: 1,
        cursorwidth: "2px",
        cursorborder: "none",});
    }, 0);
</script>