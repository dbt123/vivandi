<?php 
    $list_session = Session::get('frame');
    $share = Session::get('share');
    $Configure_discounts = App\Configure_discounts::where('value','config_tichdiem')->first();
    $total = 0;
?>
@if($list_session)
    <div class="popup-interactive-content">
        <div class="dathang-yeuthich">
                <h3>Yêu thích</h3>
                <div class="scrollbar-dynamic dathang-yeuthich-dynamic">
                        @foreach($list_session as $item)
                <div class="dathang-yeuthich-divwrap">
                    <table class="tracuu-kq-content d_tab_remove_{!! $item['frame']->id !!}">
                        <?php
                            if($item['frame']->price_sale){
                                $price = $item['frame']->price_sale;
                            }else{
                                $price = $item['frame']->price;
                            }
                            $price = $price;
                            $total += $price * $item['num'];
                            $num = $item['num'];
                        ?>
                            <tr>
                                <td>
                                    <div class="dathang-xoasp d_remove_cart" data-id="{!! $item['frame']->id !!}">×</div>
                                    <img style="width:136px;height:136px;" src="{!! $item['frame']->img !!}" alt="">
                                </td>
                                <td>
                                    <h1>{!! $item['frame']->name !!}
                                        <span> x 
                                            <select class="select d_select" data-id="{!! $item['frame']->id !!}">
                                                <option @if($num==1) selected @endif value="1">01</option>
                                                <option @if($num==2) selected @endif value="2">02</option>
                                                <option @if($num==3) selected @endif value="3">03</option>
                                                <option @if($num==4) selected @endif value="4">04</option>
                                                <option @if($num==5) selected @endif value="5">05</option>
                                                <option @if($num==6) selected @endif value="6">06</option>
                                            </select>
                                        </span>
                                    </h1>
                                    <?php 
                                            $product = App\Product::where('id',$item['frame']->product_id)->first();
                                        ?>
                                        <h4 style="color: #404040">{!! $product->name !!}</h4>
                                    <h4 class="d_all_some_{!! $item['frame']->id !!}" data-value="@if($item['frame']->price_sale) {!! $item['frame']->price_sale !!} @else {!! $item['frame']->price !!} @endif">@if($item['frame']->price_sale){!! number_format((int)$item['frame']->price_sale,0,'','.') !!}đ @else {!! number_format((int)$item['frame']->price,0,'','.') !!}đ @endif</h4>
                                </td>
                            </tr>
                    </table>
                </div><!-- end of san pham don hang -->
                @endforeach
                </div>
            </div><!-- end of dathang-yeuthich -->
            <div class="dathang-dathang">
                <h3>Đặt hàng</h3>
                <?php
                    $link_domain = explode('.',url('/'));
                    $domain = null;
                    if (sizeof($link_domain)>2){
                        $ld =explode('/', $link_domain[0]);
                        $domain = App\Agency::where('subdomain',$ld[2])->first();
                    }
                    $discount_ = 0;
                    $discount_type = "";
                    $event_avaiable = false;
                    if($domain){
                        $event_active = $domain->event_active;
                        $EventSale = App\EventSale::find($event_active);
                        if($EventSale){
                            $curdate = date("d-m-Y");
                            $startdate = $EventSale->start_day;
                            $end_day = $EventSale->end_day;
                            $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                            $timestamp_c = $dtime1->getTimestamp();
                            $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                            $timestamp_s = $dtime2->getTimestamp();
                            $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                            $timestamp_e = $dtime3->getTimestamp();
                            if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                                // Nếu trong thời gian event
                                // => tính discount
                                // Kiểu event Giảm % hoặc trừ tiền
                                $event_avaiable  = true;
                                if($EventSale->type == 0 ){
                                    // Giảm theo phần trăm
                                    if($EventSale->share && $share[0]){
                                        // Kiểm tra điều kiện share
                                        $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                        $discount_type = $EventSale->percent."%";
                                    }
                                    if($EventSale->share == 0){
                                        $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                        $discount_type = $EventSale->percent."%";
                                    }
                                    // $order->percent = $percent;
                                    
                                }else{
                                    // Giảm theo hóa đơn
                                    if($EventSale->share && $share[0]){
                                        // Kiểm tra điều kiện share
                                        if($total >=  $EventSale->money_min){
                                            $discount_ = $EventSale->money_sale;
                                            $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                        }
                                    }
                                    if($EventSale->share == 0){
                                        if($total >=  $EventSale->money_min){
                                            $discount_ = $EventSale->money_sale;
                                            $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                        }
                                    }
                                }
                            }
                        }
                    }else{
                        $EventSale = App\EventSale::where('vivandi',1)->first();
                        if($EventSale){
                            $curdate = date("d-m-Y");
                            $startdate = $EventSale->start_day;
                            $end_day = $EventSale->end_day;
                            $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                            $timestamp_c = $dtime1->getTimestamp();
                            $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                            $timestamp_s = $dtime2->getTimestamp();
                            $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                            $timestamp_e = $dtime3->getTimestamp();
                            if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){

                               // Nếu trong thời gian event
                               // => tính discount
                               // Kiểu event Giảm % hoặc trừ tiền
                               $event_avaiable  = true;
                               if($EventSale->type == 0 ){

                                    // Giảm theo phần trăm
                                    if($EventSale->share && $share[0]){
                                        // Kiểm tra điều kiện share
                                        $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                        $discount_type = $EventSale->percent."%";
                                    }
                                    if($EventSale->share == 0){
                                        $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                        $discount_type = $EventSale->percent."%";
                                    }
                               }else{
                                    // Giảm theo hóa đơn
                                    if($EventSale->share && $share[0]){

                                        // Kiểm tra điều kiện share
                                        if($total >=  $EventSale->money_min){
                                         $discount_ = $EventSale->money_sale;
                                         $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                        }
                                    }
                                    if($EventSale->share == 0){
                                        if($total >=  $EventSale->money_min){
                                         $discount_ = $EventSale->money_sale;
                                         $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                        }
                                    }
                               }
                            }
                        }
                    }
                ?>
                <table class="dathang-top">
                    <tr>
                        <td><h5>Tổng giá trị đơn hàng</h5></td>
                        <td><h5><span class="d_total">{!! number_format((int)$total,0,'','.') !!}đ</span></h5></td>
                    </tr>
                    @if($event_avaiable)
                        @if($discount_type)
                        <tr>
                            <td><h5>Giảm</h5></td>
                            <td><h5><span id="d_discount">{{ $discount_type }}</span></h5></td>
                        </tr>
                        @else
                            <tr>
                                <td><h5>Giảm</h5></td>
                                <td><h5><span id="d_discount">Chưa đủ điều kiện</span></h5></td>
                            </tr>
                        @endif
                    @else
                        <tr>
                            <td><h5>Giảm</h5></td>
                            <td><h5><span id="d_discount">Chưa có chương trình</span></h5></td>
                        </tr>
                    @endif
                </table>
                @if($event_avaiable)
                <div class="dathang-center">
                    <?php 
                        $discount = App\Configure_discounts::where('id',1)->first();
                    ?>
                            @if($EventSale->description)
                            <p>{{$EventSale->description}}</p>
                            @else
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                            @endif
                            @if($EventSale->share)
                            <div style="margin-top: 11px;margin-bottom: 6px;background-color: #3B5998;width: 120px;height: 30px;border-radius: 1px;line-height: 28px;box-shadow: 0 0 4pt rgba(0, 0, 0, 0.2) !important;">
                                <a href="#" onclick="shareOnFacebook();" style="color: #fff;font-family: 'RobotoMono';"><img src="{{ asset('frontend/html/img/facebook-letter-logo.svg') }}" alt="" style="width: 32px;padding-left: 7px;padding-right: 7px;border-right: solid 1px rgba(255, 255, 255, 0.5);margin-right: 20px;">Chia sẻ</a>
                            </div>
                            @endif
                </div>
                @endif
                <table class="dathang-bottom">
                    <tr>
                        <td><h5>Tổng tiền thực toán</h5></td>
                        <td><h5><span class="d_total_all" data-total="{!! $total !!}">

                            @if($discount_type)
                            <?php 
                                // $total_ = ((float)$total*(float)$Configure_discounts->percent)/100;
                                $total_tong = (int)$total - $discount_;
                            ?>
                                {!! number_format((float)$total_tong,0,'','.') !!}đ
                            @else
                                {!! number_format((int)$total,0,'','.') !!}đ
                            @endif
                        </span></h5></td>
                    </tr>
                </table>
            </div><!-- end of dathang-dathang -->
            <div class="clearfix"></div>
            <div class="button-download">
                <button id="d_dat_hang">Đặt hàng</button>
                <div class="button-white"></div>
            </div>
    </div>
    <script>
        jQuery('.scrollbar-dynamic').scrollbar();
    </script>
@endif