@extends('backend.layouts.default')
@section('css')
<link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2-bootstrap-theme/dist/select2-bootstrap.min.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2/dist/css/select2.min.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('summernote/dist/summernote.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('libs/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/assets/styles/backend.css') }}" type="text/css" />

   <style type="text/css">
    h2{
          font-family: "Roboto-Bold";
          font-size: 10.5pt !important;
    }
      #search_location {
          background-color: #fff;
          font-size: 10.5pt !important;
          margin-top: 15px;
          text-transform: none;
          width: 300px;
          color: #404040;
          border: 1px solid transparent;
          border-radius: 2px 0 0 2px;
          box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
          font-family: "Roboto";
          font-weight: 300;
          padding: 0 11px 0 13px;
          text-overflow: ellipsis;
          height: 40px;
          outline: none;
          -moz-box-sizing: border-box;
          margin-left:120px;
      }
      .p-themmoi{color:rgba(0,0,0,.87)}.p-themmoi:hover{color:#738CEC}.p-themmoi1{color:rgba(0,0,0,.4)}.p-themmoi1:hover{color:#738CEC}
     .s-img img,.s-img1 img{max-height:100px}.s-img span,.s-img1 span{top:35px;left:calc(50% - 15px)}.add-attribute,.material-icons{cursor:pointer}.alert{margin-top:20px;margin-bottom:0}label{font-size:10pt;color:#404040}.form-control{margin-bottom:15px!important;border:1px solid #E7E7E7!important}.thong-tin{background-color:#fff!important}.s-img,.s-img1{max-width:100%;background-color:#F0F0F0;border:1px solid #E7E7E7}.box{min-height:275px}.s-img{min-width:100px;position:relative}.s-img span{position:absolute}.s-img1{height:40px;min-width:130px;position:relative}.s-img1 span{position:absolute}.no-border{border:0!important;background-color:rgba(1,1,1,0)}.add-attribute{position:absolute;right:15px;top:10px;color:#738CEC}.add-attribute1{position:absolute;right:10px;top:10px;color:#FFF}.modal-dialog{width:600px;margin:70px auto}.modal-content{border-radius:0}.modal-header{padding:12px 15px;border-bottom:1px solid #E7E7E7}.modal-title{font-size:10.5pt;font-family:"Roboto Bold"}.td{padding:12px 0!important}.wt{width:145px!important}.tw{width:30px!important}.loader{width:21px;animation:spin 1.3s linear infinite;margin:-48px auto auto}@keyframes spin{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}

  </style>    
   
@endsection

@section('content')

<form ui-jp="parsley" method="post" id="add_agency" action="{!! route('post.edit.agency') !!}" enctype="multipart/form-data">
<div class="app-header white box-shadow">
<div class="navbar">
    <div style="float:left;" class="title_form">
        <a class="p-themmoi" style="margin-left:0px;cursor:pointer;    font-size: 14pt;
    font-family: 'Roboto Black';">Sửa đại lý</a>
    </div>
    <div style="float:right;margin-top:10px;">
    <button id="d_luu" type="submit" name="submit"  value="post" class="btn success" style="
    padding-bottom: 8px;padding-top: 8px;font-size: 10pt;margin-right: 8px;font-family: 'Roboto-Bold';
    min-width:100px; background-color:#738CEC">Lưu</button>
      </div>
       
    <!-- / navbar collapse -->
</div>
</div>
   <div class="app-body" id="view">
    <div class="padding" style="padding-top:0px !important; padding-bottom:0px;">
        @include('backend.partials._messages')
        <div id="error" class="col-sm-12" style="background-color:#F2DEDE;padding:20px 0px 20px 17px;margin:15px 0px;border:1px solid #EBCCCC;border-radius:3px;display:none;"></div>
    </div>
    <div class="padding">
         <div class="row">
          <div class="col-sm-6" style="padding-bottom:50px !important;">
            <div class="box" >
                  <div class="box-header">
                    <h2 style="font-family:'Roboto Black';">Thông Tin Đại lý</h2>
                    <?php
                    $string = $agency->password;
                    $encrypted = \Illuminate\Support\Facades\Crypt::encrypt($string);
                    $decrypted_string = \Illuminate\Support\Facades\Crypt::decrypt($encrypted);
                    ?>
                  </div>
                  <div class="box-body" style="padding-top:10px;">
                        <div class="row">
                            <input type="hidden" value="{{csrf_token()}}" name="_token">
                            <input type="hidden" name="agency_id" value="{!! $agency->id !!}">
                             <div class="form-group" >
                                    <div class="form-group">
                                          <label class="col-sm-2 form-control-label">Tên Đại lý</label>
                                          <div class="col-sm-10">
                                                <input type="text"  placeholder="Tên đại lý" class="form-control thong-tin" name="name_agency" required value="{!! $agency->name_agency !!}" > 
                                          </div>                       
                                    </div>
                                    <div class="form-group">
                                          <label class="col-sm-2 form-control-label ">Người đại diện</label>
                                          <div class="col-sm-10">
                                               <input style="" type="text"  class="form-control thong-tin"  placeholder="Người đại diện" required name="representative" value="{!! $agency->representative !!}"> 
                                          </div>                       
                                    </div>
                                    <div class="form-group">
                                          <label class="col-sm-2 form-control-label ">Subdomain</label>
                                          <div class="col-sm-10">
                                               <input style="" type="text" class="form-control thong-tin"  placeholder="Chỉ gồm chữ thường và số " name="domain" value="{!! $agency->subdomain !!}"> 
                                          </div>                       
                                    </div>
                                    <div class="form-group">
                                          <label class="col-sm-2  form-control-label ">Phone</label>
                                          <div class="col-sm-10">
                                               <input type="text"   placeholder="Số điện thoại" class="form-control thong-tin" name="phone" required value="{!! $agency->phone !!}"> 
                                          </div>                       
                                    </div>
                                    <div class="form-group">
                                          <label class="col-sm-2 form-control-label ">Email</label>
                                          <div class="col-sm-10">
                                               <input type="email"  placeholder="Email" class="form-control thong-tin" name="email" required value="{!! $agency->email !!}"> 
                                          </div>                       
                                    </div>
                                    <div class="form-group">
                                          <label class="col-sm-2 form-control-label ">Mật khẩu</label>
                                          <div class="col-sm-10">
                                               <input type="password"  class="form-control thong-tin"  placeholder="Mật khẩu" name="password" required value="{!! $agency->password !!}" > 
                                          </div>                       
                                    </div>  
                            </div>   
                       </div>  
                  </div>   
            </div> 
          </div>
          <div class="col-sm-6" style="padding-bottom:50px !important;">
            <div class="box" style="min-height:408px" >
              <div class="box-header">
                <h2 style="font-family:'Roboto Black';">Google Maps</h2>
              </div>
                <input type="text" id="vitri" value="{!! $agency->location !!}" style="display: none;" name="location"></input>
                <input type="text" name="search_location" placeholder="Địa chỉ đại lý ..." id="search_location" style="background-color:#fff!important">
                <div class="col-md-12" id="map_xyz" style="width:98%; height:280px; padding:10px;margin-bottom: 15px;"></div> 
                <div class="form-group" style="margin-top:20px">
                  <label class="col-sm-2 form-control-label ">Địa chỉ</label>
                  <div class="col-sm-10" >
                       <input type="text"  required class="form-control thong-tin" id="address"  placeholder="Địa chỉ" name="address" value="{!! $agency->address_agency !!}"> 
                  </div>                       
                </div> 
            </div> 
          </div>
    </div>
  </div>
</div>
</form>
@endsection
@section('js-footer')
</style>
   <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBmwyLJTrzp-qw9wKYK6Ind6Wd7mnoxEPY&libraries=places"></script>
  <script>
      var map;
      function initMap() {
           
             var location_x = $('#vitri').val();
             if( typeof(location_x) !== "undefined") {
              var lat      = parseFloat(location_x.split(',')[0]);
              var lng      =  parseFloat(location_x.split(',')[1]);
              var myLatLng = {lat: lat, lng: lng};
              var map = new google.maps.Map(document.getElementById('map_xyz'), {
                  center: myLatLng,
                  zoom: 16,
                  disableDefaultUI: true,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              });
              new google.maps.Marker({
                          map: map,
                          position: myLatLng
              });
              var input = document.getElementById('search_location');
              var searchBox = new google.maps.places.SearchBox(input);
              map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
              // tìm kiếm đúng trong khung bản đồ hiển thị
                map.addListener('bounds_changed', function() {
                  searchBox.setBounds(map.getBounds());
                });
              markers = [];
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
                // mỗi nơi có biểu tượng và vị trí
                var bounds = new google.maps.LatLngBounds();

                places.forEach(function(place) {
                  name = $('#search_location').val();
                  position_str = place.geometry.location.lat().toFixed(6) +","+place.geometry.location.lng().toFixed(6);
                  $("#vitri").val(position_str);
                  $("#address").val(name);
                  if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                  }

                  // tạo 1 dấu hiệu cho mỗi nơi
                    markers.push(new google.maps.Marker({
                    map: map,
                    // icon: icon,
                    title: place.name,
                    position: place.geometry.location
                  }));

                  if (place.geometry.viewport) {
                    // Mã địa lý khung nhìn
                    bounds.union(place.geometry.viewport);
                  }else{
                    bounds.extend(place.geometry.location);
                  }
                });
                map.fitBounds(bounds);
              });
             }
            
            }
      initMap();

      ///
      submit = 0;
      $(document).on('mouseenter',"button[type=submit]",function(){
        submit = 1;
      });
      $(document).on('mouseleave',"button[type=submit]",function(){
        submit = 0;
      }); 
      $(document).on('submit','#add_agency',function(e){
        if(submit == 0){
          e.preventDefault();
        }
    });
  </script>
@endsection