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
   </style>
   <style type="text/css">
      .alert{
        margin-top:20px;
        margin-bottom: 0px;
      }
      label {
          font-size: 10pt;
          color: #404040;
      }
      .form-control{
        margin-bottom: 15px !important;
        border: 1px solid #E7E7E7 !important; 
       
      }
      .thong-tin{
          background-color: #fff !important;
      }
     </style>
@endsection
@section('content')
<form ui-jp="parsley" method="post" id="createEvent">
<div class="app-header white box-shadow">
<div class="navbar">
    <div style="float:left;" class="title_form">
        <p><a href="{{route('agency.create.event')}}">Tạo Event</a></p>
    </div>
      <div style="float:right;margin-top:10px;">
     
    <button type="submit" name="submit"  value="post" class="btn success" style="
    padding-bottom: 8px;padding-top: 8px;font-size: 10pt;margin-right: 8px;font-family: 'Roboto-Bold';
    min-width:100px; background-color:#738CEC">Lưu</button>
      </div>
       
    <!-- / navbar collapse -->
</div>
</div>

 
   <div class="app-body" id="view">
     
    <div class="padding" style="padding-top:0px !important; padding-bottom:0px;">
        @include('backend.partials._messages')
    </div>
     <?php $system =App\System::first();
           $admin = App\Admins::where('id', '=', 2)->first();
     ?>
    <div class="padding">
    
         <div class="row">
          
            <div class="col-sm-6">
            
                <div class="box">
                  <div class="box-header">
                    <h2>Thông tin cơ bản</h2>
                  </div>
                
                  <div class="box-body">
                        <div class="row">
                            <input type="hidden" value="{{csrf_token()}}" name="_token">
                            <div class="form-group">
                                  <label class="col-sm-3 form-control-label ">Tên Event</label>
                                  <div class="col-sm-9">
                                       <input type="text"  placeholder="Tên event" class="form-control thong-tin" name="name"> 
                                  </div>                       
                            </div>
                            <div class="form-group">
                                  <label class="col-sm-3 form-control-label">Chia sẻ Facebook</label>
                                  <div class="col-sm-9">
                                        <div class="radio">
                                          <label><input type="radio" name="fbshare" checked="" value="0"> Không</label>
                                        </div>
                                        <div class="radio">
                                          <label><input type="radio" name="fbshare" value="1"> Có</label>
                                        </div>
                                  </div>                       
                            </div>
                            <div class="form-group">
                                  <label class="col-sm-3 form-control-label">Loại giảm giá</label>
                                  <div class="col-sm-9">
                                        <div class="radio">
                                          <label><input type="radio" name="typeSale" checked="" value="0"> Phần trăm</label>
                                        </div>
                                        <div class="radio">
                                          <label><input type="radio" name="typeSale" value="1"> Trừ Tiền</label>
                                        </div>
                                  </div>                       
                            </div>
                            <div class="form-group" id="percent_div">
                                  <label class="col-sm-3 form-control-label ">Phần trăm giảm</label>
                                  <div class="col-sm-9">
                                       <input type="text"   placeholder="Phần trăm giảm giá 1 ~ 99" class="form-control thong-tin" name="percent"> 
                                  </div>                       
                            </div>

                            <div class="form-group" id="discount_div" style="display: none">
                                  <label class="col-sm-3 form-control-label ">Tiền giảm</label>
                                  <div class="col-sm-4">
                                       <input type="text"   placeholder="Số tiền" class="form-control thong-tin" name="mdiscount"> 
                                  </div>   
                                  <div class="col-sm-1">
                                       <label style="line-height: 2.7">/</label>
                                  </div>   
                                  <div class="col-sm-4">
                                       <input type="text"  placeholder="Tối thiểu" class="form-control thong-tin" name="mmin"> 
                                  </div>                       
                            </div>

                            <div class="form-group">
                                  <label class="col-sm-3 form-control-label ">Ngày bắt đầu</label>
                                  <div class="col-sm-9">
                                       <input type="text"  placeholder="31-01-2016" class="form-control thong-tin" name="dstart"> 
                                  </div>                       
                            </div>
                            <div class="form-group">
                                  <label class="col-sm-3 form-control-label ">Ngày kết thúc</label>
                                  <div class="col-sm-9">
                                       <input type="text"  placeholder="31-01-2016" class="form-control thong-tin" name="dend"> 
                                  </div>                       
                            </div>
                            
                            <div class="form-group">
                                  <label class="col-sm-3 form-control-label ">Mô tả (nếu có)</label>
                                  <div class="col-sm-9">
                                       <textarea placeholder="Mô tả" class="form-control thong-tin" name="description"></textarea> 
                                  </div>                       
                            </div>
                       </div>  
                  </div>
                 
           </div>
             
      </div>
            <div class="col-sm-6">
            
                 <div class="box">
                  <div class="box-header">
                    <h2>Thông báo</h2>
                  </div>
                
                  <div class="box-body">
                        <div class="row">
                            <div class="form-group">
                                  <div class="col-sm-12">
                                      <p id="nty"></p>
                                  </div>                       
                            </div>
                           
                       </div>  
                  </div>
                 
           </div>
        </div>
     
   </div>
</form>
@stop
@section('js-footer')
  <script src="{{ asset('backend/libs/jquery/screenfull/dist/screenfull.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/select2/dist/js/select2.min.js') }}"></script>
  <script src="{{ asset('summernote/dist/summernote.min.js') }}"></script>
  <script src="{{ asset('summernote/dist/lang/summernote-vi-VN.js') }}"></script>
  <script src="{{ asset('libs/bootstrap-tagsinput/bootstrap-tagsinput.min.js') }}"></script>
  <script type="text/javascript">
    $(document).on('change','input[type=radio][name="typeSale"]',function(){
        if (this.value == 0) {
           $('#percent_div').css('display','block');
           $('#discount_div').css('display','none');
        }else{
           $('#percent_div').css('display','none');
           $('#discount_div').css('display','block');
        }
    });
    $(document).on('submit','#createEvent',function(e){
      e.preventDefault();
      var formData = new FormData(this);
      $.ajax({
      headers: {
              'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
          },
      type:"post",
      url:"{{route('agency.create.event.post')}}",
      data: formData,
      contentType: false,
      processData: false,
      success:function(data){
        console.log(data);
        if(data.status == false){
          $("#nty").text(data.msg);
        }else{
          window.location = "{{route('agency.list.event')}}";
        }
      },
      dataType:"json"
    });
    });
  </script>
@endsection