<?php 
    $list_look = Session::get('l_frame');
?>
 <table class="sp-daxem-img">
    @if(sizeof($list_look))
        <?php $c = 0; ?>
        @foreach($list_look as $key => $item)
            @if($c % 4 == 0)
                <tr>
            @endif
                <td><a href="{!! route('getProDetail',['id'=>$item['l_frame']->id,'slug'=>$item['l_frame']->slug]) !!}"><img src="{{ $item['l_frame']->img }}" alt="{{ $item['l_frame']->img }}"></a></td>
            @if($c % 4 == 3 || $key == sizeof($list_look)-1)    
                </tr>
            @endif  
            <?php $c++; ?>  
        @endforeach
    @endif
</table>
       