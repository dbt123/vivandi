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
                <p>Địa chỉ: <span>{!! $agency->address_agency !!}</span></p>
                <p>Điện thoại: <span>{!! $agency->phone !!}</span></p>
            </div>
        @endforeach
    @endif
</div>
<script>
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