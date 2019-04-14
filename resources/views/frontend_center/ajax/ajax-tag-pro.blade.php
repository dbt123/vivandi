<h4>Thuộc tính</h4>
<?php
    $list_att = DB::table('frame_attributes')->where('frame_id',$id)->get();
    $d=0;
?>

@foreach($list_att as $la)
<?php
    $att = DB::table('attributes')->where('id',$la->attribute_id)->first();
    $d=$d+1;
    if ($d>5) break;
?>

    @if ($att->init == '')
    <h5>{{$att->value}}</h5>
    @else
    <h5>{{$att->value}}  {{$att->init}}</h5>
    @endif
@endforeach