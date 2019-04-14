@extends('backend.layouts.default')
@section('css')
   <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2-bootstrap-theme/dist/select2-bootstrap.min.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2/dist/css/select2.min.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/assets/styles/offcanvas.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/assets/styles/owl.carousel.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/assets/styles/owl.theme.css') }}" type="text/css" />
@endsection

@section('content')
<style type="text/css">
.modal-body .email-tb input,.modal-body .so-sp input,textarea{height:38px;padding-left:10px;padding-right:10px;background-color:#F0F0F0}.material-icons,.nav-item span{cursor:pointer}body{font-family:Roboto!important}.modal-body .so-sp input,textarea{width:48%;font-size:10pt!important;border:1px solid #E7E7E7!important}.modal-body .email-tb input,.modal-body .nd-email textarea{width:100%;font-size:10pt!important;border:1px solid #E7E7E7!important}.modal-body .so-sp input:first-child{float:right}.modal-body .nd-email textarea{height:100px;padding:10px}.modal-content{border-radius:0}.modal-header{height:45px;padding:0 15px}.modal-header .modal-title{font-size:10.5pt;font-family:'Roboto Bold';line-height:45px}.modal-body p,.modal-body tr td,.modal-body tr th,.modal-header button{font-family:Roboto}.modal-header button{background-color:#92D050;color:#fff;font-size:10pt;padding-top:5px;padding-bottom:5px;width:70px;border:none}.modal-body p{font-size:10pt}.email-tb,.so-sp{margin-bottom:16px}.modal-body .so-sp input{width:100%;height:38px;font-size:10pt!important;border:1px solid #E7E7E7!important;padding-left:10px;padding-right:10px}.modal-body .email-tb table{border:1px solid #E7E7E7;width:100%}


    .label-info{background-color:#5bc0de}.bootstrap-tagsinput,.select2-selection,input,textarea{background-color:#F0F0F0!important}.bootstrap-tagsinput{width:100%}.bootstrap-tagsinput input{min-height:2rem}.label{font-size:96%}.select2-results__option,input,select,textarea{font-size:10pt!important}input,textarea{border:1px solid #E7E7E7!important}.select2-results__option{padding-left:14px!important}.select2-dropdown{border-radius:0!important;border-bottom:1px solid #E7E7E7!important;border-top:1px solid #E7E7E7!important;border-left:1px solid #E7E7E7!important;border-right:1px solid #E7E7E7!important}.select2-selection{color:#D1F5F1;border-radius:0!important;border:1px solid #E7E7E7!important}.select2-selection__choice{font-size:10pt!important;background-color:#0CC2AA!important;border:1px solid #0CC2AA!important;color:#D1F5F1!important}.select2-search__field{background-color:#F0F0F0!important;border:none!important}.box-header,.modal-header{border-bottom:1px solid #E7E7E7}.select2-selection__choice__remove{color:#D1F5F1!important}.select2-selection__rendered{padding-top:5px!important;padding-bottom:5px!important;padding-left:13px!important;border-radius:0!important}.select2-results__option--highlighted{background-color:#F0F0F0!important;color:#404040!important}.select2-selection__clear{color:#BFBFBF!important}.select2-search__field::-webkit-input-placeholder{color:#404040}.select2-search__field::-moz-placeholder{color:#404040}.select2-search__field:-ms-input-placeholder{color:#404040}.select2-search__field:-moz-placeholder{color:#404040}.nav-item a,label{color:#A6A6A6}label{font-size:10pt}.nav-item a{background-color:#F2F2F2;margin-right:10px}.note-toolbar{background-color:#fff;padding:0!important}.dropdown-toggle::after,.note-popover{display:none}.p-a-sm{box-shadow:none!important;padding:0!important}.note-editable{padding-right:0!important;padding-left:0!important}.title_form{margin-top:16px;font-size:14pt}.dd-content{padding-top:15px!important;padding-bottom:15px!important}.dd-item>button{height:41px!important}.cate_name,.menu_name{font-size:10.5pt}.alert,.nav-item a,.note-editable{font-size:10pt}.cate_edit a,.menu_edit a{background-color:#E7E7E7;padding:4px 12px;border-radius:3px;color:#A6A6A6}label[for=file_img_preview]{line-height:1.3}label[for=file_img_preview] a{padding-top:4px!important;padding-bottom:4px!important;min-width:120px}.title_form p{font-family:'Roboto Black'}.nav-link{padding-right:3px}.nav-item span{padding-left:8px;cursor:pointer}h2{font-family:Roboto-Bold;font-size:10.5pt!important}@media (min-width:991px){.title_form{margin-left:10px!important;margin-top:16px}}.number-post{width:80px;height:44px;background-color:#fff;border:1px solid #E7E7E7;float:left;color:#404040;font-size:10pt}.drop-cate,.drop-cate:hover{background-color:rgba(1,1,1,0)!important;box-shadow:none!important}.dropdown-item,td,th{font-size:10pt!important}#filter{float:left}.modal-body .so-sp input:first-child,.pagination{float:right}.box-body{position:relative}.drop-cate{position:absolute;left:calc(100% - 150px);top:28px;width:20px!important;height:20px!important;padding:7px!important}.dropdown-menu{left:16px!important;top:58px!important;width:calc(100% - 132px);padding-top:0!important;padding-bottom:0!important;border-top:0!important;border-top-left-radius:0!important;border-top-right-radius:0!important}.dropdown-item{padding-top:10px!important;padding-bottom:10px!important}.dropdown-toggle::after{margin-left:-1px!important;display:inline-block;width:0;height:0;margin-right:.25rem;vertical-align:middle;content:"";border-top:.3em solid;border-right:.3em solid transparent;border-left:.3em solid transparent;margin-top:-20px}th{font-family:Roboto-Bold!important}.action-post a{padding:4px 10px}.action-post a:hover{background-color:#bfbfbf;border-radius:2px}.pagination>li>a{padding:.4rem .75rem!important}.footable{margin-bottom:0!important}.status:first-letter{text-transform:uppercase}.modal-dialog{width:600px;margin:70px auto}.modal-content{border:1px solid #E7E7E7;border-radius:0}.modal-title{font-size:10.5pt;font-family:"Roboto Bold"}.add-attr{background-color:#92D050;color:#fff;font-size:8pt;padding-top:6px;padding-bottom:6px}.add-attr:hover{background-color:#92D050!important}option:disabled{background:#ddd}.select2-container .select2-selection--single{height:37px}.select2-selection__arrow{height:35px!important}.select2-search__field{display:none}.select2-search--dropdown{padding:0!important}.select2{width:100%!important;font-size:10pt}.select2-selection__rendered{font-size:10pt!important}.del-order{color:#777;font-family:Roboto-Bold}.del-order:hover{color:#404040}.modal-header{height:50px;padding:0 15px}.modal-header .modal-title{font-size:10.5pt;font-family:'Roboto Bold';line-height:50px}.modal-body p,.modal-header button{font-size:10pt;font-family:Roboto}.modal-header button{background-color:#92D050;color:#fff;padding-top:6px;padding-bottom:6px;width:80px;border:none}.modal-body .email-tb input,.modal-body .so-sp input,textarea{height:38px;font-size:10pt!important;border:1px solid #E7E7E7!important;background-color:#F0F0F0;padding-left:10px;padding-right:10px}.email-tb,.so-sp{margin-bottom:0}.modal-body .so-sp input,textarea{width:48%}.modal-body .email-tb input{width:100%;margin-bottom:16px}.wrap-email-tb{border:1px solid #e5e5e5;padding:10px}.wrap-email-tb p:first-child{border-bottom:solid 1px #e5e5e5;margin-left:-10px;margin-right:-10px;padding-left:10px;padding-right:10px;margin-bottom:15px;padding-bottom:10px;font-family:'Roboto Bold'}.p-themmoi,.p-themmoi1{margin-left:30px;font-size:14pt;font-family:'Roboto Black'}.wrap-email-tb textarea{width:100%;height:180px}.p-themmoi{color:rgba(0,0,0,.4)}.p-themmoi:hover{color:#738CEC}.p-themmoi1{color:rgba(0,0,0,.87)}.p-themmoi1:hover{color:#738CEC}
            .pagination{float:right}th{font-family:Roboto-Bold!important}.action-post a{padding:4px 10px}.comment-pagination>li>a,.pagination>li>a{padding:.4rem .75rem!important}.action-post a:hover{background-color:#bfbfbf;border-radius:2px}.footable{margin-bottom:0!important}.add_attr_tab{color:#738CEC}.comment-pagination>li{display:inline;list-style:none}.comment-pagination>li>a{position:relative;float:left;margin-left:-1px;line-height:1.5;color:#0275d8;text-decoration:none;background-color:#fff;border:1px solid #ddd}.comment-pagination>li>.active{background-color:#0CC2AA;color:#fff;border:1px solid #0CC2AA}
      .d-background:hover{background-color:rgba(204, 204, 204, 0.4);cursor: pointer; }  
      .d_width td a {
      padding: 4px 10px;
      border-radius: 3px;
      background-color: transparent;
    }
    .d_width td a:hover {
      background-color: rgba(191, 191, 191,0.25);
    }
      .owl-theme .owl-controls {
            margin-top: -238px;
            position: absolute;
            width: 100%;
      }
      .owl-theme .owl-controls .owl-buttons div {
          color: #FFF;
          display: inline-block;
          zoom: 1;
          margin: 5px;
          padding: 0;
          font-size: 0;
          -webkit-border-radius: 30px;
          -moz-border-radius: 30px;
          border-radius: 3;
          background: #fff;
          opacity: 1;
          height: 75px;
          width: 25px;
          line-height: 75px;
      }
      .owl-theme .owl-controls .owl-buttons div.owl-prev {
          border-radius: 0 7px 7px 0;
          float: left;
      }
      .owl-theme .owl-controls .owl-buttons div.owl-next {
          border-radius: 7px 0 0 7px;
          float: right;
      }    
       </style>
<div class="app-header white box-shadow">
<div class="navbar">
     <div style="float:left;" class="title_form">
            <a class="p-themmoi1" style="margin-left:0px;cursor:pointer">Danh sách</a>  
    </div>
</div>
</div>
 <div class="app-body" id="view">
    <div class="padding">
      <div class="box">
        <div class="box-body">
          <form method="get" action="{!! route('search.feedback') !!}" style="display: inline-block; width: 100%;">
              <input style="width:calc(100% - 100px); line-height:30px;" autocomplete="off" placeholder="Tìm kiếm " type="text" class="form-control input-sm inline m-r" name="search"/>
              <button class="number-post" style="float:right">{{$list->count()}} báo cáo</button>
          </form>
          
          <div style="clear:both"></div>
        </div>
        <div class="table-responsive">
        <style type="text/css">
          .edit{
            color:orange;
          }
          .edit i{
            font-size: 15pt !important;
          }
        </style>
          <table class="table m-b-none" ui-jp="footable" data-filter="#filter" data-page-size="10" style="width:100%">
            <thead>
              <tr >
                  <th style="width:10%">
                      STT 
                  </th>
                  <th  style="width:22.5%;padding-left: 26px;">
                      Nội dung 
                  </th>
                  <th  style="width:22.5%;padding-left: 26px;">
                      Đại lý
                  </th>
                  <th  style="width:22.5%;padding-left: 26px;">
                      Ảnh
                  </th>
                  <th  style="width:22.5%;padding-left: 26px;" >
                      Tình trạng
                  </th>
              </tr>
            </thead>
            <tbody>
            <?php $stt = 0;?>
            @foreach($list as $item)
            <?php $stt++;?>
              <tr class="d_width">
                  <td >{!! $stt !!}</td>
                  <td id="d_1" data-id="{!! $item->id !!}"><a href="">Chi tiết</a></td>
                  <td id="d_2" data-id="{!! $item->id !!}"><a href="">{!! $item->name_agency !!}</a></td>
                  <td id="d_3" data-id="{!! $item->id !!}"><a href="">Chi tiết</a></td>
                  <td>
                  @if(session('admin')->can('duyet_khieu_nai'))
                    <a href="" id="d_4" class="d_4_{!! $item->id !!}" style="@if($item->status == 0)  color:#d0d0d0 @else color:blue @endif" data-id="{!! $item->id !!}">
                        @if($item->status == 0) Chờ xử lý @endif
                        @if($item->status == 1) Đã tiếp nhận @endif
                        @if($item->status == 2) Đang xử lý @endif
                        @if($item->status == 3) Xong @endif
                        </a>
                  @endif  
                  @if(session('admin')->can('xoa_khieu_nai'))
                    <a href="" id="d_5" data-id="{!! $item->id !!}"><span> × </span></a>
                  @endif
                  </td>
              </tr>
            @endforeach  
            </tbody>
            <tfoot class="hide-if-no-paging">
              <tr>
                  <td colspan="12" class="text-center">
                    <ul class="list-inline comment-pagination">
                      <?php $link_limit = 9; ?>
                        @for ($i = 1; $i <= $list->lastPage(); $i++)
                          <?php
                          $half_total_links = floor($link_limit / 2);
                          $from = $list->currentPage() - $half_total_links;
                          $to = $list->currentPage() + $half_total_links;
                          if ($list->currentPage() < $half_total_links) {
                             $to += $half_total_links - $list->currentPage();
                          }
                          if ($list->lastPage() - $list->currentPage() < $half_total_links) {
                              $from -= $half_total_links - ($list->lastPage() - $list->currentPage()) - 1;
                          }
                          ?>
                          @if ($from < $i && $i < $to)
                              <li class="{{ ($list->currentPage() == $i) ? ' active' : '' }}">
                                  @if(!$search)
                                    <a  class="{{ ($list->currentPage() == $i) ? ' active' : '' }}" href="{{$list->url($i)}}" data-page={{$i}}>{{ $i }}</a>   
                                  @else
                                      <a  class="{{ ($list->currentPage() == $i) ? ' active' : '' }}" href="{{$list->url($i)}}&search={!! $search !!}" data-page={{$i}}>{{ $i }}</a>
                                  @endif  
                              </li>
                          @endif
                        @endfor
                    </ul>
                  </td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
</div>

<!--  -->
<div id="m-a-a2" class="modal fade animate in" data-backdrop="true" style="display: none;">
    <div class="modal-dialog" id="animate">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="float: left;padding-top: 2px;
                    ">Thông tin khiếu nại</h5>
                <a id="add_item_features" class="btn btn-sm warn pull-left add-attr" data-dismiss="modal" style="
                    float: right;margin-top: 11px;">Đóng</a>
            </div>
            <div class="modal-body p-lg">
                <div class="table-responsive">
                    <div id="d_ajax_chitiet">
                      
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
 <div id="popup-feedback-log" class="modal fade animate in" data-backdrop="true" style="display: none; padding-left: 17px;">
   <div class="modal-dialog" id="animate">
       <div class="modal-content">
           <div class="modal-header">
               <table>
                   <tbody>
                       <tr>
                           <td style="width: 70%;">
                               <h5 class="modal-title">Ghi chú Feedback</h5>
                           </td>
                       </tr>
                   </tbody>
               </table>
           </div>
           <div class="modal-body p-lg" id="d-edit-label">
              
              
            <div class="nd-change-log" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;padding-left: 15px;padding-right: 15px;cursor: pointer;padding-bottom: 9px;background-color: rgb(246,246,246)"  data-log="1">
              <div style="margin-bottom: 0;" class="d-click-choose" data-label="0">
                <div class="col-md-11" style="padding:0px">Tiếp nhận</div>
                <div class="col-md-1 active_event" style="padding:0px"><span data-id="1"></span></div>
                <div style="clear: both;"></div>
              </div>
            </div>
            <div class="nd-change-log"  data-log="2" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;padding-left: 15px;padding-right: 15px;cursor: pointer;padding-bottom: 9px;">
                <div style="margin-bottom: 0;" class="d-click-choose" data-label="">
                  <div class="col-md-11" style="padding:0px">Đang xử lý</div>
                  <div class="col-md-1 active_event" style="padding:0px">
                    <span data-id="2"></span>
                  </div>
                  <div style="clear: both;"></div>
                </div>
            </div>
            <div class="nd-change-log"  data-log="3" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;padding-left: 15px;padding-right: 15px;cursor: pointer;padding-bottom: 9px;background-color: rgb(246,246,246);">
                <div style="margin-bottom: 0;" class="d-click-choose" data-label="">
                  <div class="col-md-11" style="padding:0px">Xong</div>
                  <div class="col-md-1 active_event" style="padding:0px">
                    <span data-id="3"></span>
                  </div>
                  <div style="clear: both;"></div>
                </div>
            </div>
            <div class="nd-email"  data-event="" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;cursor: pointer;padding-bottom: 9px;">
                <div style="margin-bottom: 0;" class="d-click-choose" data-label="">
                  <div class="col-md-12" style="padding:0px">
                    <textarea class="note_log_txt" placeholder="Ghi chú vào đây"></textarea>
                  </div>
                  
                  <div style="clear: both;"></div>
                </div>
            </div>
            <div class="nd-change"  data-event="" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;cursor: pointer;padding-bottom: 9px;">
                <div style="margin-bottom: 0;" class="d-click-choose" data-label="">
                  <div class="col-md-12" style="padding:0px">
                    <button class="btn btn-sm warn pull-right" id="save_log">Lưu thay đổi</button>
                  </div>
                  
                  <div style="clear: both;"></div>
                </div>
            </div>
            <div class="nd-change"  data-event="" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;cursor: pointer;padding-bottom: 9px;">
                <div style="margin-bottom: 0;" class="d-click-choose" data-label="">
                  <div class="col-md-12" style="padding:0px" id="feedback_log_content">
                    
                  </div>
                  
                  <div style="clear: both;"></div>
                </div>
            </div>
                
           </div>
       </div>
       <!-- /.modal-content -->
   </div>
</div>
<!--  -->
 <div id="img-congtrinh" class="modal fade animate in" data-backdrop="true" style="display:none">
    <div class="modal-dialog" id="animate">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="float: left; padding-top: 2px" class="modal-title">Ảnh công trình</h5>
                <a style="float: right;margin-top: 11px;" id="add_item" class="btn btn-sm warn pull-left add-attr" data-dismiss="modal">Đóng</a>
            </div>
            <div class="modal-body p-lg">
              <div class="table-responsive">
                <div id="demo" style="overflow: hidden;">
                  <div class="row">
                    <div class="span12">
                      <div id="d_img_feedback">
              
                      </div>
                    </div>
                  </div>
                 </div>
              </div>
              <div style="clear:both"></div>
            </div>  
        </div>
        <!-- /.modal-content -->
    </div>
</div>
@endsection
@section('js-footer')
  <script src="{{ asset('backend/libs/jquery/screenfull/dist/screenfull.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/footable/dist/footable.all.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/select2/dist/js/select2.min.js') }}"></script>
  <script src="{{ asset('backend/stag/js/owl.carousel.js') }}"></script>
  <script>

 

    function xacnhanxoa(msg){
      if(window.confirm(msg)){
        return true;
      }
      else
        return false;
     };

     $(document).on('click','#d_1',function(e){
      e.preventDefault();
      id = $(this).data('id');
      $.ajax({
        headers: {
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('ajax.feedback1.detail')}}",
        data:{'id':id},
        success:function(data){
          if(data.status == true){
              $('#d_ajax_chitiet').html(data.html);
              $('#m-a-a2').modal('show');
          }else{
            alert("Có lỗi xảy ra");
          }
        },
        cache:false,
        dataType: 'json'
      });


     });
     $(document).on('click','#d_2',function(e){
      e.preventDefault();
      id = $(this).data('id');
      $.ajax({
        headers: {
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('ajax.feedback2.detail')}}",
        data:{'id':id},
        success:function(data){
          if(data.status == true){
              $('#d_ajax_chitiet').html(data.html);
              $('#m-a-a2').modal('show');
          }else{
            alert("Có lỗi xảy ra");
          }
        },
        cache:false,
        dataType: 'json'
      });
      
     });
     $(document).on('click','#d_3',function(e){
      e.preventDefault();
      id = $(this).data('id');
      $.ajax({
        headers: {
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('ajax.feedback3.detail')}}",
        data:{'id':id},
        success:function(data){
          if(data.status == true){
              $('#d_img_feedback').html(data.html);
              $('#img-congtrinh').modal('show');
              $(".owl-model").owlCarousel ({
              navigation : true,
              pagination : false,
              slideSpeed : 200,
              paginationSpeed : 400,
              singleItem : true,
              items : 1,
              autoPlay : true
              });

              $('.owl-model .owl-controls .owl-next').html('<img style="width: 20px;" src="{!! asset('backend/assets/images/right-arrow1.svg') !!}" alt="">');
              $('.owl-model .owl-controls .owl-prev').html('<img style="width: 20px;" src="{!! asset('backend/assets/images/left-arrow1.svg') !!}" alt="">');
          }else{
            alert("Có lỗi xảy ra");
          }
        },
        cache:false,
        dataType: 'json'
      });
      
     });
     // CM_FB

     $(document).on('click','#save_log',function(e){
        x = $('.nd-change-log.active-log');
        if(x.length){
          log = $(x[0]).data('log');
          txt = $('.note_log_txt').val();
          if(txt){
              id = $("#feedback_log_content").data('logid');
             $.ajax({
              headers: {
                  'X-CSRF-TOKEN': '{{ csrf_token() }}'
              },
              type:"post",
              url:"{{route('ajax.feedback4.detail')}}",
              data:{'log':log,'txt':txt,'id':id},
              success:function(data){
                if(data.status == true){
                    console.log(data);
                    location.reload();
                }else{
                  alert("Có lỗi xảy ra");
                }
              },
              cache:false,
              dataType: 'json'
            });
          }else{
            alert('Bạn phải nhập nội dung');
          }
        }else{
          alert('Bạn phải chọn kiểu Xử lý');
        }
     });
     $(document).on('click','.nd-change-log',function(e){
        $('.nd-change-log span').html('');
        $('.nd-change-log').removeClass('active-log');
        $(this).find('span').html('<i class="material-icons pull-right" style="color: #ff9900">&#xe5ca;</i>');
        $(this).addClass('active-log');
     });
     $(document).on('click','#d_4',function(e){
      e.preventDefault();
      $("#popup-feedback-log").modal("show");
      // return false;
      id = $(this).data('id');
      $.ajax({
        headers: {
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('ajax.get.feedback.logs')}}",
        data:{'id':id},
        success:function(data){
          console.log(data);

          if(data.status == true){
            $("#feedback_log_content").html(data.log_html);
            $("#feedback_log_content").attr('data-logid',id);
              // if(data.stt == 1){
              //   $('.d_4_'+id).text("Đã duyệt").css('color','blue');
              // }
              // if(data.stt == 0){
              //   $('.d_4_'+id).text("Chưa duyệt").css('color','#d0d0d0');
              // }
          }else{
            alert("Có lỗi xảy ra");
          }
        },
        cache:false,
        dataType: 'json'
      });
     
      
     });
     $(document).on('click','#d_5',function(e){
      e.preventDefault();
      if(xacnhanxoa('Bạn có chắc xóa khiếu nại hiện tại hay không?')===false){

      }else{
      id = $(this).data('id');
      $.ajax({
        headers: {
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
        type:"post",
        url:"{{route('ajax.feedback5.detail')}}",
        data:{'id':id},
        success:function(data){
          if(data.status == true){
              window.location.reload();
          }else{
            alert("Có lỗi xảy ra");
          }
        },
        cache:false,
        dataType: 'json'
      });
      }
      
     });
  </script>
@endsection