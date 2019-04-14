@extends('backend_center.layouts.defaultC')
@section('css')
    <link rel="stylesheet" href="{{ asset('backend/assets/styles/backend.css') }}" type="text/css" />
    <style type="text/css">
      .list-item{
        padding-left: 0px;
        padding-right: 0px;

      }
      .form-group input{
        padding-top: 0px  !important;
        padding-bottom: 0px !important;
        min-height: 1.5rem;
      }
      input{
        /*color: #A6A6A6 !important;*/
      }
      label{
        margin-bottom: 0px;
      }
      .box-body{
        padding-top: 0px;
        padding-bottom: 0px;
      }
       .box-body ul{
        padding-top: 0px !important;
        margin-bottom: 0px !important;
        padding-bottom: 0px !important;
      }
         .box-body ul li:first-child{
          /*padding-top: 0px !important;*/
        }
      .box-header{
        border-bottom: 0px;
        position: relative;
      }
      .box-footer{
        padding-top: 5px;
      }
      .box-footer button{
        background-color: #F2F2F2;
        color: #A6A6A6;
        font-size: 8pt;
        min-width:60px;
        padding-top:6px;
        padding-bottom:6px
      }
       .box-header h3{
        font-size: 10pt;
      }
      .box-footer button:hover{
        background-color: #FFC000;
        color: #fff;
      }
       @media (min-width: 991px){
        .title_form{
            margin-left: 10px !important;
            margin-top: 16px;
            font-family: "Roboto Black"
        }
      }
      .close-slide{
        position: absolute;
        right: 20px;
        top: 12px;
        text-transform: lowercase;
        font-family: "Roboto";
        font-size: 13pt;
        cursor: pointer;
        text-align: center;
        color: #A6A6A6;
      }
      .close-slide:hover{
        color: #404040;
      }
      

      .s-img{
        max-width:100%;height:100px;min-width:170px;background-color:#F0F0F0;
        border:1px solid #E7E7E7;
        position: relative;
      }
      .s-img img{
        max-height: 100px;
      }
      .s-img span{
          position: absolute;
          top: 38px;
          width: 100%;
          text-align: center;
      }
      .box-footer button{
        font-size: 10pt;
        font-weight: 400;
        padding-top: 4px;
        padding-bottom: 4px;
      }
       .box-footer button:hover{
        background-color: #95C760 !important;
       }
    </style>
@endsection
@section('content')
<div class="app-header white box-shadow">
<div class="navbar">
      <div style="float:left;" class="title_form">
        <p>Slide</p>
      </div>
</div>
</div>


<div class="app-body" id="view">
  <div class="padding">
     @if(sizeof($data)==0) 
         <div class="row">
               <form id="form" method="post" action="{{route('slidecenter.post_add')}}" enctype="multipart/form-data">
                <div class="col-sm-6 col-md-4">
                  <div class="box">
                      <div class="box-header">
                        <h3>Thêm mới</h3>
                      </div>
                      <div class="box-body">
                         
                              <input type="hidden" name="_token" value="{{csrf_token()}}">
                              <input type="hidden" name="agency_id" value="{{session('center')->id}}">
                              
                              <input type="hidden" name="from" value="1">
                              <ul class="list no-border p-b">
                                  
                                   <li class="list-item">
                                     <div class="form-group" style="margin-bottom:2px;text-align: left;">
                                        <label for="file_img_preview_999_1" class="s-img">
                                              <img id="img_preview_999_1" style="">
                                              <span></span>
                                        </label>
                                      </div>
                                      <input type="file" style="display: none;" name="img_1"  id="file_img_preview_999_1" data-id="999_1">
                                   </li>
                                
                                  
                              </ul>
                      </div>
                      
                      <div class="box-footer">
                            <button class="btn btn-sm pull-right" id="update-layout" type="submit">Thêm</button>
                            <div style="clear:both">
                            </div>
                      </div>
                    
                    </div>
                 </div>
                </form>
         </div>
      @endif
      <?php $c=-1?>
      @foreach($data as $key => $value)
         <?php $c++?>
        @if($c%3 == 0)
        <div class="row">
        @endif
            @if($c==0)
               <form id="form" method="post" action="{{route('slidecenter.post_add')}}" enctype="multipart/form-data">
                <div class="col-sm-6 col-md-4">
                  <div class="box">
                      <div class="box-header">
                        <h3>Thêm mới</h3>
                      </div>
                      <div class="box-body">
                         
                              <input type="hidden" name="_token" value="{{csrf_token()}}">
                              <input type="hidden" name="agency_id" value="{{session('center')->id}}">
                              <input type="hidden" name="from" value="1">
                              <ul class="list no-border p-b">
                                  
                                   <li class="list-item">
                                     <div class="form-group" style="margin-bottom:2px;text-align: left;">
                                        <label for="file_img_preview_999_1" class="s-img">
                                              <img id="img_preview_999_1" style="">
                                              <span></span>
                                        </label>
                                      </div>
                                      <input type="file" style="display: none;" name="img_1"  id="file_img_preview_999_1" data-id="999_1">
                                   </li>
                                  
                                  
                              </ul>
                      </div>
                      <div class="box-footer">
                            <button class="btn btn-sm pull-right" id="update-layout" type="submit">Thêm</button>
                            <div style="clear:both">
                            </div>
                      </div>
                    </div>
                 </div>
                </form>
            <?php $c++?>
            @endif
            <form id="form-{{$value->id}}" action="{{route('slidecenter.post_save')}}" method="post" enctype="multipart/form-data">
            <div class="col-sm-6 col-md-4">
              <div class="box">
                  <div class="box-header">
                    <h3>Slide</h3>
                  
                    <span class="close-slide" data-id="{{$value->id}}">×</span>
                  
                  </div>
                  <div class="box-body">
                     
                          <input type="hidden" name="_token" value="{{csrf_token()}}">
                          <input type="hidden" name="agency_id" value="{{session('center')->id}}">
                          <input type="hidden" name="img_id" value="{{$value->id}}">
                          <input type="hidden" name="from" value="1">

                          <ul class="list no-border p-b">
                              
                               <li class="list-item">
                                 <div class="form-group" style="margin-bottom:2px;text-align: left;">
                                    <label for="input_img_{{$value->id}}_1" @if(!$value->img) class="s-img" @endif  >
                                          <img id="img_preview_{{$value->id}}_1" style="max-width:100%;height:100px"
                                          @if($value->img)  src="{{asset($value->img)}}"  @endif>
                                          @if(!$value->img)
                                          <span></span>
                                          @endif
                                    </label>
                                  </div>
                                  <input id="input_img_{{$value->id}}_1" type="file" style="display: none;" name="img_1" onchange="onchange_i(this,'#img_preview_{{$value->id}}_1')" >
                               </li>
                              
                             
                          </ul>
                  </div>
                   
                  <div class="box-footer">
                        <label class="ui-switch m-t-xs m-r">
                            
                              <input type="checkbox" name="slide_status" value="1" data-id="{{$value->id}}" @if($value->status == 1)checked @endif  >

                              <i></i>
                            </label>
                        <button class="btn btn-sm pull-right" data-type="{{$value->id}}" id="update-layout" type="submit">Lưu</button>
                        
                        <div style="clear:both">
                        </div>
                  </div>
                  
                </div>
             </div>
             </form>
        @if($c%3 == 2 || $c == sizeof($data))
          </div>
        @endif

  @endforeach
    
  </div>

@endsection
@section('js-footer')
  <script src="{{ asset('backend/libs/jquery/screenfull/dist/screenfull.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/footable/dist/footable.all.min.js') }}"></script>
  <script>
   jQuery(function($){
  $('.table').footable({
    "paging": {
      "enabled": true
    }
  });
});
  $(document).on('click','.close-slide',function(event){
      data_id = $(this).attr('data-id');

       event.preventDefault();
       if(xacnhanxoa('Bạn có chắc muốn xóa Slide này không?')===false){

       }
       else{
           $.ajax({
                 type: 'post',
                 url:  '{{ route('del.slidecenter') }}',
                 data: {'id': data_id},
                 dataType:'json',
                 success: function(msg){
                   console.log(msg);
                    if(msg.status == true){
                      location.reload();
                    }
                    else{
                      alert('có lỗi xảy ra');
                    }
                 }
             });
       }
  });
   $(document).on('click','input[name=slide_status]', function(){
      pin = $(this).is(':checked');
      id= $(this).attr('data-id');
      console.log(pin);
      if(pin){
        pin = 1;
      }else{
        pin = 0;
      }
      $.ajax({
        type: 'post',
        url:  '{{ route('slidecenter.check') }}',
        data: {'id':id, 'pin':pin,'_token':'{{csrf_token()}}'},
        success:function(data){
          
        }
      });
   });
  function xacnhanxoa(msg){
      var footable = $('.table').data('footable');
      

      if(window.confirm(msg)){
        return true;
      }
      else
        return false;
  };
  function onchange_i(input,id) {
      if (input.files && input.files[0]) {
         
          var reader = new FileReader();
          reader.onload = function (e) {
              $(id).attr('src', e.target.result);
              $(id).parent().find('span').remove();
              $(id).parent().removeClass('s-img');
          }
          reader.readAsDataURL(input.files[0]);
      }
  }
  function readURL(input,id) {

      if (input.files && input.files[0]) {
         
          var reader = new FileReader();
          reader.onload = function (e) {
              if(id == "999_1"){
                console.log("dd");

                $('label[for="file_img_preview_999_1"]').css('border',"0px");
                $('label[for="file_img_preview_999_1"]').css('background-color',"#fff");
                $('label[for="file_img_preview_999_1"] span').remove();
              }
              if(id == "999_2"){
                $('label[for="file_img_preview_999_2"]').css('border',"0px");
                $('label[for="file_img_preview_999_2"]').css('background-color',"#fff");
                $('label[for="file_img_preview_999_2"] span').remove();
              }
              if(id == "999_3"){
                $('label[for="file_img_preview_999_3"]').css('border',"0px");
                $('label[for="file_img_preview_999_3"]').css('background-color',"#fff");
                $('label[for="file_img_preview_999_3"] span').remove();
              }
              $('#img_preview_'+id).attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }


 $('input[type=file]').each(function(i){
     $('#file_img_preview_'+i).on('change', function() {
          readURL(this, i);
    });
 });
 $('#file_img_preview_999_1').on('change', function() {
          readURL(this, "999_1");
 });
 $('#file_img_preview_999_2').on('change', function() {
          readURL(this, "999_2");
 });
 $('#file_img_preview_999_3').on('change', function() {
          readURL(this, "999_3");
 });
 $.each($('textarea'),function(i,v){
    $(v).attr('spellcheck','false');
   });
    $.each($('input'),function(i,v){
    $(v).attr('spellcheck','false');
   });
  </script>
@endsection