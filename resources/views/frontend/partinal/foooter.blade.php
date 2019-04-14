<div class="content-right-tag content-right-dieukhoan">
    <h4>Tra cứu</h4>
    <h5><a  id="d_dangky_daili" style="cursor:pointer">Đăng ký trở thành đại lí</a></h5>
    <h5><a  id="d_tracuu_baohanh" style="cursor:pointer">Tra cứu bảo hành</a></h5>
    <h5><a id="d_baocao_daily" style="cursor:pointer">Khiếu nại</a></h5>
</div>

 <!--Popup bao cao dai ly-->
<div id="modal-popup-dkdaily" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <form id="d_sm_dangki_daily" enctype="multipart/form-data" >
    <div class="vivaldi-popup-header">
        <h3>Đăng ký trở thành đại lí</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
            <div class="popup-download-form">
                <div class="scrollbar-dynamic baocaodaily-dynamic">
                        <input type="text" required name="name" placeholder="Tên ...">
                        <input type="text" required name="phone" placeholder="Số điện thoại ...">
                        <input type="text" required name="address" placeholder="Địa chỉ ...">
                        <input type="email" required name="email" placeholder="Email ...">
                        <textarea name="comment" id="" cols="30" rows="5" placeholder="Ghi chú ..."></textarea>
                </div>
            </div>
            <div class="clearfix"></div>
            <a>
                <div class="button-download">
                    <button>Gửi</button>
                    <div class="button-white"></div>
                </div>
            </a>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
    </form>
</div>
<!--Hết popup bao cao dai ly-->

                    <!-- popup tra cuu bao hanh -->
    <div id="modal-popup-tracuubaohanh" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
        <form id="d_sm_tracuu_baohanh">
            <div class="vivaldi-popup-header">
                <h3>Tra cứu bảo hành</h3>
                <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
            </div><!-- end of header -->
            <div class="clearfix"></div>
                <div class="vivaldi-popup-body">
                    <div class="center-col">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing eli sed do eiusmod tempor incididunt ut labore et dolore</p>
                            <input type="text" name="phone" autocomplete="off" placeholder="Số điện thoại của bạn">
                            <p id="d_err" style="margin-top: 28px;font-family: 'RobotoMono';color: #CB3B31;display:none;"></p>
                            <div class="button-download">
                                <button>Tra cứu</button>
                                <div class="button-white"></div>
                            </div>
                        </a>
                    </div>
                </div><!-- end of body -->
            <div class="clearfix"></div>
        </form>
    </div>
<!-- end of popup tra cuu bao hanh -->
<!-- popup tra kq cuu bao hanh -->
    <div id="modal-popup-kq-tracuu" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
        <div class="vivaldi-popup-header">
            <h3>Kết quả tra cứu</h3>
            <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
        </div><!-- end of header -->
        <div class="clearfix"></div>
        <div class="vivaldi-popup-body">
            <div id="d_ajax_tracuu_baohanh">
                
            </div>
        </div><!-- end of body -->
        <div class="clearfix"></div>
    </div>
<!-- end of popup kq tra cuu bao hanh -->


 <!--Popup bao cao dai ly-->
<div id="modal-popup-baocaodaily" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <form id="d_sm_baocao_daily" enctype="multipart/form-data" >
    <div class="vivaldi-popup-header">
        <h3>Khiếu nại về công trình</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
            <div class="popup-download-form">
                <div class="scrollbar-dynamic baocaodaily-dynamic">
                        <input type="text" name="tenkhachhang" placeholder="Tên khách hàng">
                        <input type="text" name="phone" placeholder="Số điện thoại">
                        <input type="text" name="diachi" placeholder="Địa chỉ">
                        <input type="email" name="email" placeholder="Email">
                        <div class="congtrinh-img"><h5>Chèn ảnh công trình</h5><a href="javascript:void(0);" class="pull-right"><img src="{!! asset('frontend/html/img/photo-camera.svg') !!}" alt=""></a></div>
                        <div class="chenanh-congtrinh">
                            <div class="body-nest" id="DropZone" >
                               <div id="myDropZone" class="dropzone">

                               </div>
                            </div>
                            <input type="hidden" name="img_product">
                        </div>
                        <textarea name="comment" id="" cols="30" rows="5" placeholder="Bình luận ..."></textarea>
                        <div class="daily-info">
                            <h5>Thông tin đại lý</h5>
                            <select class="show-list-daily" name="d_agency_check" id="d_agency_check">
                                <option value="0">Chọn đại lý</option>
                                <?php $agency = App\Agency::where('status',1)->get(); ?>
                                @if(sizeof($agency))
                                    @foreach($agency as $item)
                                        <option value="{!! $item->id !!}">  {!! $item->name_agency !!}</option>
                                    @endforeach
                                @endif
                            </select>
                            <input type="text" disabled style="background-color: #fff;cursor: not-allowed;" id="d_diachi_daily" name="diachi_daily" placeholder="Địa chỉ">
                            <input type="text" disabled style="background-color: #fff;cursor: not-allowed;" id="d_phone_agency" name="phone_agency" placeholder="Số điện thoại">
                        </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <a>
                <p id="d_er" style="color: #DD4E42;font-size: 8.5pt;display: none;"></p>
                <div class="button-download">
                    <button>Báo cáo</button>
                    <div class="button-white"></div>
                </div>
            </a>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
    </form>
</div>
<!--Hết popup bao cao dai ly-->
<!-- popup dang xu ly -->
<div id="modal-popup-success-bc" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Báo cáo thành công</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Cảm ơn bạn đã gửi báo cáo tới Vivandi. Chúng tôi sẽ chủ động liên hệ với bạn trong thời gian sớm nhất.</p>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!-- het popup dang xu ly -->
<!-- popup dang xu ly -->
<div id="modal-popup-success-dk" class="zoom-anim-dialog mfp-hide center-col bg-white modal-popup-main vivaldi-popup-content">
    <div class="vivaldi-popup-header">
        <h3>Đăng kí thành công</h3>
        <img src="{!! asset('frontend/html/img/vivandi-logo.png') !!}" alt="">
    </div><!-- end of header -->
    <div class="clearfix"></div>
    <div class="vivaldi-popup-body">
        <div class="center-col">
            <p>Cảm ơn bạn đã gửi đăng kí Vivandi. Chúng tôi sẽ chủ động liên hệ với bạn trong thời gian sớm nhất.</p>
        </div>
    </div><!-- end of body -->
    <div class="clearfix"></div>
</div>
<!-- het popup dang xu ly -->
