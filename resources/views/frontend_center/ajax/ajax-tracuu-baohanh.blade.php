<div class="center-col">
<div class="scrollbar-dynamic kq-tracuu-dynamic">
    @foreach($order as $item)
    <?php  $orItem = $item->getItem()->get(); ?>
        @foreach($orItem as $item2)
        <?php $frame = App\Frame::where('id',$item2->frame_id)->first(); ?>
            <table>
                <tr>
                    <td class="kq-tracuu-tittle"><h5>Tên sản phẩm</h5></td>
                    <td><a href="{!! route('getProDetail',['id'=>$frame->id,'slug'=>$frame->slug]) !!}"  target="_blank"><h5 >{!! $frame->name !!}</h5></a></td>
                </tr>
                <tr>
                    <td class="kq-tracuu-tittle"><h5>Tên khách hàng</h5></td>
                    <td><h5>{!! $item->fullname !!}</h5></td>
                </tr>
                <tr>
                    <td class="kq-tracuu-tittle"><h5>Ngày mua</h5></td>
                    <td><h5>{!! date("d.m.Y",time($item->created_at)) !!}</h5></td>
                </tr>
                <tr>
                    <td class="kq-tracuu-tittle"><h5>Ngày hết hạn bảo hành</h5></td>
                    <td><h5>{!! date('d.m.Y', strtotime($item->created_at . "+".$frame->assurance." months") ) !!}</h5></td>
                </tr>
            </table>
        @endforeach
    @endforeach    
</div>
<a class="close-popup-kq-tracuu">
        <div class="button-download">
            <button id="d_esc" >Đóng lại</button>
            <div class="button-white"></div>
        </div>
    </a>
</div>