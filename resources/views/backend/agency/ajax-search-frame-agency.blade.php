@if(sizeof($frame) > 0)
<table class="table table-striped b-t" style="margin-bottom:0px;">
  <tbody>   
  <tr style="font-size:12px;">
    <td style="width:10%!important;text-align:center!important;">
      Chọn
    </td>
    <td style="width:30%!important;text-align:center!important;">
      Ảnh 
    </td>
    <td style="width:30%!important;text-align:center!important;">
      Tên
    </td>
    <td style="width:30%!important;text-align:center!important;">
      Mã
    </td>
  </tr>
  @foreach($frame as $item)
  <tr style="font-size:12px;">
    <td style="width:10%!important;text-align:center!important;">
      <label class="ui-check m-a-0">
        <input type="checkbox" class="has-value choose-frame" value="{!! $item->id !!}" name="frame_agency[]" >
        <i class="dark-white" ></i>
      </label>
    </td>
    <td  style="width:30%!important;text-align:center!important;">
     <img src="{!! $item->img !!}" style="width:55px;height:auto;"  alt="">
    </td>
    <td  style="width:30%!important;text-align:center!important;">
     {!! $item->name !!}
    </td>
    <td  style="width:30%!important;text-align:center!important;">
     {!! $item->code_frame !!}
    </td>
  </tr>
  @endforeach
</tbody>
</table>
@endif