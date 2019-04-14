<tr style="font-size:12px;">
      <td>
        Ngày mua 
      </td>
      <td>
        Mã Đơn Hàng
      </td>
      <td>
        Tổng Đơn Hàng
      </td>
      <td>
        Chi Tiết
      </td>
  </tr>
@foreach($order as $item) 
  <tr style="font-size:12px;">
      <td>
      {!! $item->created_at !!}
      </td>
      <td>
      #{!! $item->id !!}
      </td>
      <td>
       {!! number_format((int)$item->total + $item->total_weight,0,'','.') !!} vnđ  
      </td>
      <td>
        @if($status == 0)
         <a href="{{ route('order.show',['id'=>$item->id]) }}" >Chi tiết</a> 
        @else
          <a href="{{ route('agency.order.show',['id'=>$item->id]) }}" >Chi tiết</a> 
        @endif 
      </td>
  </tr>
@endforeach 