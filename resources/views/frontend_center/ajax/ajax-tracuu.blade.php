<div class="center-col">
    @if($last_order->status == 1)
        <p>Đơn hàng của bạn đang trong tình trạng : <span>Đang đợi</span></p>
    @endif
    @if($last_order->status == 2)
        <p>Đơn hàng của bạn đang trong tình trạng : <span>Bị hủy</span></p>
    @endif
    @if($last_order->status == 3)
        <p>Đơn hàng của bạn đang trong tình trạng : <span>Đang xử lý</span></p>
    @endif
    @if($last_order->status == 4)
        <p>Đơn hàng của bạn đang trong tình trạng : <span>Đang giao hàng</span></p>
    @endif
    @if($last_order->status == 5)
        <p>Đơn hàng của bạn đang trong tình trạng : <span>Đã thanh toán</span></p>
    @endif
    @if($last_order->status == 6)
        <p>Đơn hàng của bạn đang trong tình trạng : <span>Đã nhận hàng</span></p>
    @endif
    <p>{!! $last_order->note_stick !!}</p>
</div>
<div class="tracuu-kq-wrap">
    <div class="scrollbar-dynamic tracuu-kq-wrap-dynamic">
        @foreach($orItem as $item)
            <?php 
                $frame =  App\Frame::where('id',$item->frame_id)->first();
                $product = App\Product::where('id',$frame->product_id)->first();
             ?>
            <table class="tracuu-kq-content">
                <tr>
                    <td><img src="{!! $frame->img !!}" alt="{!! $frame->img !!}"></td>
                    <td>
                        <h1>{!! $frame->name !!} <span> x <input type="text" disabled value="0{!! $item->quantity !!}"></span></h1>
                        <h4 style="color: #404040">{!! $product->name !!}</h4>
                        @if($item->price_sale)
                            <h4>{!! number_format((int)$item->price_sale,0,'','.') !!}đ</h4>
                        @else
                            <h4>{!! number_format((int)$item->price,0,'','.') !!}đ</h4>    
                        @endif
                    </td>
                </tr>
            </table>
        @endforeach
    </div><!-- end of san pham don hang -->
</div>