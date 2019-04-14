<?php
    $list_look = Session::get('l_frame');
    $list_session = Session::get('frame');
    $total = 0;
    $share = Session::get('share');
    $Configure_discounts = App\Configure_discounts::where('value','config_tichdiem')->first();
?>


<style type="text/css">
    /*Button img search header*/
        @media (min-width: 768px) {
            header .btn-search-rps {
                display: none !important;
            }
        }
        @media (max-width: 767px) {
            header .btn-search-desktop {
                display: none !important;
            }
        }
</style>
<header>
    @if (session('story'))
        @if(isset($storycheck))
            <div class="open-slide hvr-bob off-story" style="cursor:pointer">
                <div class="open-slide-icon">
                    <img src="{!! asset('frontend/html/img/right-arrow ffc000.svg') !!}" alt="">
                </div>
                <p>Open Slide</p>
                <div style="clear: both"></div>
            </div>
            

        @endif
    @else
            <?php
                Session::put('story', 1);
            ?>
    @endif
    <div id="click-to-home"></div>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="row">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <!-- <button class="filter-right">
                        <img src="img/four-squares-list.svg" alt="">
                    </button> -->
                    <p class="pull-left visible-xs visible-sm">
                        <button type="button" class="btn btn-primary btn-xs btn-sm button-offcanvas" data-toggle="offcanvas">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </p>
                     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <div class="triangle-down"></div>
                    </button>
                    <div class="navbar-right wrap-navbar-center">
                        <form class="navbar-form navbar-left" action="{!! route('frontend.search.frame') !!}">
                            <button type="submit" class="btn btn-default btn-search-desktop">
                                <img src="{!! asset('frontend/html/img/search.svg') !!}" alt="">
                            </button>
                            <button type="submit" class="btn btn-default btn-search-rps">
                                <img src="{!! asset('frontend/html/img/search.svg') !!}" alt="">
                            </button>

                            <div class="form-group">
                                <input type="text" name="search" class="form-control" placeholder="Tìm sản phẩm...">
                            </div>
                        </form>
                        <ul class="nav navbar-nav navbar-right navbar-icon">
                            <li><a class="d_list_xem" style="cursor:pointer;">
                                <div class="header-icon">
                                    <div class="notify notify-clock count_list">@if($list_look){!! sizeof($list_look) !!} @else 0 @endif</div>
                                    <img src="{!! asset('frontend/html/img/clock.svg') !!}" alt="">
                                </div>
                            </a></li>
                            <li><a class="d_click_tracuu" style="cursor:pointer;" >
                                <div class="header-icon">
                                    <div class="notify notify-file ">0</div>
                                    <img src="{!! asset('frontend/html/img/file.svg') !!}" alt="">
                                </div>
                            </a></li>
                            <li class="shopping_cart d_list_cart"><a style="cursor:pointer;">
                                <div class="header-icon">

                                    <div class="notify notify-favorite counts">@if($list_session){!! sizeof($list_session) !!} @else 0 @endif</div>
                                    <img src="{!! asset('frontend/html/img/favorite.svg') !!}" alt="">
                                </div>
                            </a></li>
                        </ul>
                    </div>
                    <a class="navbar-brand" href="{!! url('') !!}">
                    <?php 
                        $logo = App\Item::where('key_layout','Logo header')->first();
                        if(isset($logo)) $img_logo = asset($logo->value);
                        else $img_logo = "https://placeholdit.imgix.net/~text?txtsize=16&txt=197%C3%9764&w=197&h=64";
                    ?>
                        <img src="{!! $img_logo !!}" alt="{!! $img_logo !!}">
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-left wrap-navbar-menu">
                        <?php
                            $menu = DB::table('menus')->orderby('order','asc')->get();
                        ?>
                        
                        <!-- 16.12.16 -->
                                <li>
                                    <ul class="nav navbar-nav navbar-right navbar-icon">
                                        <li><a class="d_list_xem" style="cursor:pointer;">
                                            <div class="header-icon">
                                                <div class="notify notify-clock count_list">@if($list_look){!! sizeof($list_look) !!} @else 0 @endif</div>
                                                <img src="{!! asset('frontend/html/img/clock.svg') !!}" alt="">
                                            </div>
                                        </a></li>
                                        <li><a class="d_click_tracuu" style="cursor:pointer;" >
                                            <div class="header-icon">
                                                <div class="notify notify-file ">0</div>
                                                <img src="{!! asset('frontend/html/img/file.svg') !!}" alt="">
                                            </div>
                                        </a></li>
                                        <li class="shopping_cart d_list_cart"><a style="cursor:pointer;">
                                            <div class="header-icon">

                                                <div class="notify notify-favorite counts1">@if($list_session){!! sizeof($list_session) !!} @else 0 @endif</div>
                                                <img src="{!! asset('frontend/html/img/favorite.svg') !!}" alt="">
                                            </div>
                                        </a></li>
                                    </ul>
                                </li>
                                <!-- 16.12.16 -->
                            @foreach($menu as $key)
                                <li><a href="{{$key->link}}"><h5>{{$key->name}}</h5></a></li>
                            @endforeach
                        
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- end of row -->
        </div><!-- /.container-fluid -->
    </nav>
    <div class="container search-rps"><form action="{!! route('frontend.search.frame') !!}"><input type="text" name="search"></form></div>
</header>
<!--Popup tra cứu đơn hàng-->
<div id="modal-popup-tracuu" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Tra cứu đơn hàng</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing eli sed do eiusmod tempor incididunt ut labore et dolore</p>
            <form id="d_sb_tracu">
                <input type="text" name="phone" autocomplete="off" placeholder="Nhập số điện thoại của bạn">
                <p id="d_error_tracuu" style="margin-bottom: 38px;color: #CC0000;display:none"></p>
                <div class="button-download">
                    <button>Kiểm tra</button>
                    <div class="button-white"></div>
                </div>
            </form>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!--Hết popup tra cứu đơn hàng-->

<!--Popup kết quả-->
<div id="modal-popup-tracuu-kq" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Kết quả</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div id="d_kq_sm">
            
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!--Hết popup kết quả-->
<!--Popup dathang-->
<div id="modal-popup-dathang" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div id="d_cart_ajax">
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
        @endif
    </div>
    <div class="clearfix"></div>
</div>
<!--Hết popup dathang-->

    

<!--Popup sp đã xem-->
<div id="modal-popup-sp-daxem" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Chào <span>bạn</span></h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing eli sed do eiusmod tempor incididunt<span>Sản phẩm đã xem</span></p>
        </div>
        <div id="d_ajax_l_xem">
            <table class="sp-daxem-img">
                @if(sizeof($list_look))
                    <?php $c = 0; ?>
                    @foreach($list_look as $key => $item)
                        @if($c % 4 == 0)
                            <tr>
                        @endif
                            <td><a href="{!! route('getProDetail',['id'=>$item["l_frame"]->id,'slug'=>$item["l_frame"]->slug]) !!}"><img src="{{ $item["l_frame"]->img }}" alt="{{ $item["l_frame"]->img }}"></a></td>
                        @if($c % 4 == 3 || $key == sizeof($list_look)-1)    
                            </tr>
                        @endif  
                        <?php $c++; ?>  
                    @endforeach
                @endif
            </table>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!--Hết popup sp đã xem-->
<!--Popup thông tin-->
<div id="modal-popup-thongtin" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Thông tin</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <form id="d_submit_order_thong_tin">
                <div class="popup-download-form">
                        <input type="text" required name="username" placeholder="Họ tên">
                        <input type="text" required name="phone" placeholder="Số điện thoại">
                        <input type="email" name="email" placeholder="Email">
                        <input type="text" required name="addresses" placeholder="Địa chỉ">
                        <textarea name="note" cols="30" rows="5" placeholder="Ghi chú thêm ..."></textarea>
                </div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
                <div class="button-download">
                    <a>
                        <button>Xác nhận</button>
                        <div class="button-white"></div>
                    </a>
                </div>
            </form>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!--Hết popup thông tin-->
<!-- Popup đang xử lý -->
<div id="modal-popup-loading" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Thông báo</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Tình trạng đơn hàng của bạn đang được xử lý. Xin vui lòng đợi trong giây lát.</p>
            <!-- <a class="popup-with-zoom-anim" href="#modal-popup-tracuu-kq"> -->
                <div class="button-download">
                    <button><img src="{!! asset('frontend/html/img/loading.svg') !!}" alt=""></button>
                    <div class="button-white"></div>
                </div>
            <!-- </a> -->
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!-- Hết popup đang xử lý -->
<div id="modal-popup-success" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Đặt hàng thành công</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Đơn hàng của bạn đã được gửi tới Vivandi. Chúng tôi sẽ chủ động liên hệ với bạn trong thời gian sớm nhất.</p>
            <!-- <div class="button-download">
                <button>Đóng lại</button>
                <div class="button-white"></div>
            </div> -->
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>