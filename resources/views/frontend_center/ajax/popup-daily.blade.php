<?php 
    $frameImage = App\FrameImage::where('frame_id',$frame->id)->get();
    $list_session = Session::get('frame');
?>
<style>

    .pac-container {
        z-index: 1051 !important;
        overflow:hidden;
        position:fixed;
}
</style>
<div class="popup-interactive-slide">
    <!-- img slide -->
    <div id="demo">
        <div class="span12 dm-map-rps" id="d_add_goo" style="idth:509px;eight:354px;">
            <div id="owl-slide" class="owl-carousel owl-model" >    
                @foreach($frameImage as $item)
                    <div class="item"><img src="{!! $item->img !!}" alt=""></div>
                @endforeach
            </div>
        </div>
    </div>
    <!-- luotmua-img MAP -->
    <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.8596722614325!2d105.82509161438612!3d20.998261486014883!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac87dedfb4d9%3A0x6c7c1ed5f42ed994!2zQ8O0bmcgdHkgVGhp4bq_dCBr4bq_IHdlYiBzw6FuZyB04bqhbyBNYXN0ZXJjdXMgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1480477210619" frameborder="0" style="border:0" allowfullscreen></iframe> -->
</div>
<div class="popup-interactive-content">
    <div class="popup-interactive-content-header">
        <div class="popup-interactive-content-header-model">
           <h1>{!! $frame->name !!}</h1>
            <div class="rate">
                @if($frame->price_sale)
                    <h4 class="rate-liemyet"><span>{!! number_format((int)$frame->price,0,'','.') !!}</span>đ</h4>
                    <h4 class="rate-ban"><span>{!! number_format((int)$frame->price_sale,0,'','.') !!}</span>đ</h4>
                @else
                    <h4 class="rate-ban" style="float:left;"><span>{!! number_format((int)$frame->price,0,'','.') !!}</span>đ</h4>
                @endif
            </div>
        </div><!-- end of popup-interactive-content-header-model -->
        <div class="button-like">
            <button class="@if($list_session) <?php $z = 0;?> @foreach($list_session as $item5) <?php $z++;?> @if($frame->id == $item5['frame']->id) button-likedd @else @if($z == 1) art_to_cart @endif @endif @endforeach @else art_to_cart @endif d_del_class_{!! $frame->id !!}" data-id="{!! $frame->id !!}">YÊU THÍCH</button>
            <div class="button-white"></div>
        </div><!-- end of button-like -->
    </div><!-- end of popup-interactive-content-header -->
    <div class="scrollbar-dynamic scrollbar-dynamic-interactive">
        <table class="interactive">
            <tr>
                <td class="d_ajax_binhluan" data-id="{!! $frame->id !!}"><a href="">@if(sizeof($comment) < 10) <span>0{!! sizeof($comment) !!}</span> @else <span>{!! sizeof($comment) !!}</span> @endif B<em class="viettat">ình </em><em class="viettat-dot">.</em>luận</a></td>
                <td class=" d_ajax_luotmua" data-id="{!! $frame->id !!}"><a href="">@if(sizeof($order) < 10) <span>0{!! sizeof($order) !!}</span> @else <span>{!! sizeof($order) !!}</span> @endif L<em class="viettat">ượt </em><em class="viettat-dot">.</em>mua</a></td>
                <td><a class="interactive-active d_ajax_dai_ly" data-id="{!! $frame->id !!}">@if(sizeof($agency_frame) < 10) <span>0{!! sizeof($agency_frame) !!}</span> @else <span>{!! sizeof($agency_frame) !!}</span> @endif Đ<em class="viettat">ại lý có</em><em class="viettat-dot">L</em> bán</a></td>
                <td class=" d_ajax_dactinh" data-id="{!! $frame->id !!}"><a href="">@if(sizeof($feature0) < 10) <span>0{!! sizeof($feature0) !!}</span> @else <span>{!! sizeof($feature0) !!}</span> @endif Đ<em class="viettat">ặc </em><em class="viettat-dot">.</em>tính</a></td>
            </tr>
        </table><!-- end of interactive -->
        <div id="d_ajax_popup">
           <div class=" dailyban-img">
                <div class="dailyban-search">
                    <img src="{!! asset('frontend/html/img/placeholder.svg') !!}" alt="">
                    <input type="text"  value="21.000754,105.860754" name="search_location2" id="localtion_input" style="display: none;"></input>
                    <input type="text" id="search_location"  placeholder="Tìm đại lý gần đây">
                    <div id="map_xyz" style="display:none;"></div>
                </div>
                @if(sizeof($agency_frame) > 0)
                    @foreach($agency_frame as $item)
                    <?php 
                        $agency = App\Agency::where('id',$item->agency_id)->first();
                    ?>
                        <div class="dailyban-content" style="cursor:pointer">
                            <h5 class="abc  d_maps_{!! $agency->id !!}" id="d_google_maps" data-id="{!! $agency->id !!}" data-loca="{!! $agency->location !!}">{!! $agency->name_agency !!} <span class="all_location" data-location={{$agency->location}} style="color: #7F7F7F;font-size: 8.5pt;font-family: RobotoMono;"></span></h5>
                            <p>Địa chỉ: <span>{!! $agency->address_agency !!}</span>  </p>
                            <p>Điện thoại: <span>{!! $agency->phone !!}</span></p>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </div><!-- end of interactive-wrapscroll -->
</div>
<div class="clearfix"></div>
<script>
    $(".owl-model").owlCarousel ({
      navigation : true,
      pagination : false,
      slideSpeed : 200,
      paginationSpeed : 400,
      singleItem : true,
      items : 1,
      autoPlay : true
      });
    $('.owl-model .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow.svg') !!}" alt="">');
    $('.owl-model .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow.svg') !!}" alt="">');

    function calcurlator_maps(){
            all_location = $(".all_location");
            my_str =  $("input[name=search_location2]").val();

            my_latlngStr  = my_str.split(",",2);
            lat1 = parseFloat(my_latlngStr[0]);
            long1  = parseFloat(my_latlngStr[1]); 
            var _eQuatorialEarthRadius = 6378.1370;
            var _d2r = (Math.PI / 180.0);    

            $.each(all_location,function(i,v){
                str  = $(v).attr('data-location');
                latlngStr  = str.split(",",2);
                lat2   = parseFloat(latlngStr[0]);
                long2  = parseFloat(latlngStr[1]);
                var dlong = (long2 - long1) * _d2r;
                var dlat = (lat2 - lat1) * _d2r;
                var a = Math.pow(Math.sin(dlat / 2.0), 2.0) + Math.cos(lat1 * _d2r) * Math.cos(lat2 * _d2r) * Math.pow(Math.sin(dlong / 2.0), 2.0);
                var c = 2.0 * Math.atan2(Math.sqrt(a), Math.sqrt(1.0 - a));
                var d = _eQuatorialEarthRadius * c;
               
                $(v).text("Cách đây "+d.toFixed(2)+" km");
            });
      }

    function initMap_2() {

        var map = new google.maps.Map(document.getElementById('map_xyz'), {
                center: {lat:21.025225, lng: 105.843486},
                zoom: 8,
                disableDefaultUI: true,
                // navigationControl: false, mapTypeControl: false, scaleControl: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        var input = document.getElementById('search_location');
        var searchBox = new google.maps.places.SearchBox(input);
        // tìm kiếm đúng trong khung bản đồ hiển thị
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });
        
        var markers = [];
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();
              // console.log(places);
          if (places.length == 0) {
            return;
          }
          // Xóa tất cả vị trí đã chọn
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          places.forEach(function(place) {
            position_str = place.geometry.location.lat().toFixed(6) +","+place.geometry.location.lng().toFixed(6);
            $("#localtion_input").val(position_str);
            if (!place.geometry) {
              return;
            }
            
            calcurlator_maps();
          });
        });
      }
      initMap_2();

      
</script>