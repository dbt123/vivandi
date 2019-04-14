@extends('backend.layouts.default')
@section('css')
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2/dist/css/select2.min.css') }}" type="text/css" />
@endsection

@section('content')
<style type="text/css">
    .label-info{background-color:#5bc0de}.bootstrap-tagsinput,.select2-selection,input,textarea{background-color:#F0F0F0!important}.bootstrap-tagsinput{width:100%}.bootstrap-tagsinput input{min-height:2rem}.label{font-size:96%}.select2-results__option,input,select,textarea{font-size:10pt!important}input,textarea{border:1px solid #E7E7E7!important}.select2-results__option{padding-left:14px!important}.select2-dropdown{border-radius:0!important;border-bottom:1px solid #E7E7E7!important;border-top:1px solid #E7E7E7!important;border-left:1px solid #E7E7E7!important;border-right:1px solid #E7E7E7!important}.select2-selection{color:#D1F5F1;border-radius:0!important;border:1px solid #E7E7E7!important}.select2-selection__choice{font-size:10pt!important;background-color:#0CC2AA!important;border:1px solid #0CC2AA!important;color:#D1F5F1!important}.select2-search__field{background-color:#F0F0F0!important;border:none!important}.select2-selection__choice__remove{color:#D1F5F1!important}.select2-selection__rendered{padding-top:5px!important;padding-bottom:5px!important;padding-left:13px!important;border-radius:0!important}.select2-results__option--highlighted{background-color:#F0F0F0!important;color:#404040!important}.select2-selection__clear{color:#BFBFBF!important}.select2-search__field::-webkit-input-placeholder{color:#404040}.select2-search__field::-moz-placeholder{color:#404040}.select2-search__field:-ms-input-placeholder{color:#404040}.select2-search__field:-moz-placeholder{color:#404040}.nav-item a,label{color:#A6A6A6}label{font-size:10pt}.nav-item a{background-color:#F2F2F2;margin-right:10px}.box-header{border-bottom:1px solid #E7E7E7}.note-toolbar{background-color:#fff;padding:0!important}.dropdown-toggle::after,.note-popover{display:none}.p-a-sm{box-shadow:none!important;padding:0!important}.note-editable{padding-right:0!important;padding-left:0!important}.title_form{margin-top:16px;font-size:14pt}.dd-content{padding-top:15px!important;padding-bottom:15px!important}.dd-item>button{height:41px!important}.cate_name,.menu_name{font-size:10.5pt}.alert,.nav-item a,.note-editable{font-size:10pt}.cate_edit a,.menu_edit a{background-color:#E7E7E7;padding:4px 12px;border-radius:3px;color:#A6A6A6}label[for=file_img_preview]{line-height:1.3}label[for=file_img_preview] a{padding-top:4px!important;padding-bottom:4px!important;min-width:120px}.title_form p{font-family:'Roboto Black'}.nav-link{padding-right:3px}.nav-item span{padding-left:8px;cursor:pointer}h2{font-family:Roboto-Bold;font-size:10.5pt!important}@media (min-width:991px){.title_form{margin-left:10px!important;margin-top:16px}}.number-post{width:80px;height:44px;background-color:#fff;border:1px solid #E7E7E7;float:left;color:#404040;font-size:10pt}.drop-cate,.drop-cate:hover{background-color:rgba(1,1,1,0)!important;box-shadow:none!important}.dropdown-item,td,th{font-size:10pt!important}#filter{float:left}.box-body{position:relative}.drop-cate{position:absolute;left:calc(100% - 150px);top:28px;width:20px!important;height:20px!important;padding:7px!important}.dropdown-menu{left:16px!important;top:58px!important;width:calc(100% - 132px);padding-top:0!important;padding-bottom:0!important;border-top:0!important;border-top-left-radius:0!important;border-top-right-radius:0!important}.dropdown-item{padding-top:10px!important;padding-bottom:10px!important}.dropdown-toggle::after{margin-left:-1px!important;display:inline-block;width:0;height:0;margin-right:.25rem;vertical-align:middle;content:"";border-top:.3em solid;border-right:.3em solid transparent;border-left:.3em solid transparent;margin-top:-20px}.pagination{float:right}th{font-family:Roboto-Bold!important}.action-post a{padding:4px 10px}.comment-pagination>li>a,.pagination>li>a{padding:.4rem .75rem!important}.action-post a:hover{background-color:#bfbfbf;border-radius:2px}.footable{margin-bottom:0!important}.comment-pagination>li>a{position:relative;float:left;margin-left:-1px;line-height:1.5;color:#0275d8;text-decoration:none;background-color:#fff;border:1px solid #ddd}.p-themmoi,.p-themmoi1{margin-left:30px;font-size:14pt;font-family:'Roboto Black'}.comment-pagination>li>.active{background-color:#0CC2AA;color:#fff;border:1px solid #0CC2AA}.p-themmoi{color:rgba(0,0,0,.87)}.p-themmoi:hover{color:#738CEC}.p-themmoi1{color:rgba(0,0,0,.4)}.p-themmoi1:hover{color:#738CEC}
    .d_width td{
      width:12.5%;
    }
    .d_width td a {
      padding: 4px 10px;
      border-radius: 3px;
      background-color: transparent;
    }
    .d_width td a:hover {
      background-color: #bfbfbf;
    }

   </style>
<div class="app-header white box-shadow">
<div class="navbar">
    <div style="float:left;" class="title_form">
        <!-- @if(session('admin')->can(['them_dai_ly']))
          <a href="{{ route('add.agency') }}" class="p-themmoi" style="margin-left:0px">+ Thêm đại lý</a>
        @else
          <a class="p-themmoi" style="margin-left:0px;">Danh sách </a>
        @endif -->
        <p>Thống kê đại lý</p>
    </div>
</div>
</div>
 <div class="app-body" id="view">
    <div class="padding">
    @include('backend.partials._messages')
      <div class="box">
        <div class="box-body">
        <form method="get" action="{{ route('search.thongke') }}" style="display: inline-block; width: 100%;">
          <input id="filter" style="width:calc(100% - 100px); line-height:30px;" placeholder="Tìm kiếm" type="text" class="form-control input-sm inline m-r" name="search" />
          <div class="number-post" id="day-static" style="text-align: center;padding-top: 12px;cursor:pointer">Kiểm tra</div>
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
         
          <table class="table m-b-none" ui-jp="footable" data-filter="#filter" data-page-size="10">
            <thead>
              <tr class="d_width">
                  <th style="width:13%!important">
                      Đại lý 
                  </th>
                  <!-- <th>
                      Trong kho
                  </th> -->
                  <th>
                      Đã bán
                  </th>
                  <th>
                      Đơn hàng đã nhận
                  </th>
                  <th>
                      Đơn hàng đã xử lý
                  </th>
                  <th>
                      Tổng doanh số
                  </th>
              </tr>
            </thead>
            <tbody>
              @foreach($list_agencys as $key => $item)
              <tr class="d_width">
              	<td>
              		{{$item->name_agency}}
              	</td>
                  <?php
                    $frame = App\Agency_frame::where('agency_id',$item->id)->get();
                    $sku =0;
                    if(sizeof($frame)>0){
                      foreach ($frame as $key => $f) {
                        $sku = $sku + $f->sku_frame_agency;
                      }
                    } 
                  ?>
               <!--  <td>
                  {{$sku}} sản phẩm
                </td> -->

                   <?php
                  $order = App\Order_agency::where('agency_id',$item->id)->where('created_at','>',$dday1)->where('created_at','<',$dday2)->get();
                  $id = array();
                  if (sizeof($order)>0){
                    foreach ($order as $key => $value) {
                        array_push($id,$value->order_id);
                    }
                    $order_h = App\Order::whereIn('id',$id)->where('status','>',1)->where('created_at','>',$dday1)->where('created_at','<',$dday2)->get();
                    $order_d = App\Order::whereIn('id',$id)->where('status',5)->where('updated_at','>',$dday1)->where('updated_at','<',$dday2)->get();
                    $item_id = array();
                    $total = 0;
                    if(sizeof($order_d)>0){
                      foreach ($order_d as $key => $od) {
                        array_push($item_id, $od->id);
                        if ($od->percent==0){
                          $total = (float)$total + (float)$od->total;
                        }
                        else{
                          $sale = ((float)$od->total*(float)$od->percent)/100;
                          $all_total = (float)$od->total - (float)$sale;
                          $total = (float)$total +(float)$all_total;
                        }
                      }
                      $order_sku_done = App\OrderItem::whereIn('order_id',$item_id)->get();
                      $sku_done =0;
                      foreach ($order_sku_done as $key => $osd) {
                        $sku_done = $sku_done + $osd->quantity;
                      }
                    }
                  }

                ?>
                <td>
                  @if (sizeof($order)>0)
                    @if (sizeof($order_d)>0)
                      {{$sku_done}} sản phẩm
                    @else
                      0 sản phẩm
                    @endif
                  @else
                    0 sản phẩm
                  @endif
                </td>

               
                <td>
                  {{sizeof($order)}}
                </td>

                <td>
                  @if (sizeof($order)>0)
                    {{sizeof($order_h)}}
                  @else
                    0
                  @endif
                </td>

                <td>
                  @if (sizeof($order)>0)
                    @if (sizeof($order_d)>0)
                       {{number_format($total, 0, '', '.')}}<sup>đ</sup>
                    @else
                      0<sup>đ</sup>
                    @endif
                  @else
                    0<sup>đ</sup>
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
                        @for ($i = 1; $i <= $list_agencys->lastPage(); $i++)
                          <?php
                          $half_total_links = floor($link_limit / 2);
                          $from = $list_agencys->currentPage() - $half_total_links;
                          $to = $list_agencys->currentPage() + $half_total_links;
                          if ($list_agencys->currentPage() < $half_total_links) {
                             $to += $half_total_links - $list_agencys->currentPage();
                          }
                          if ($list_agencys->lastPage() - $list_agencys->currentPage() < $half_total_links) {
                              $from -= $half_total_links - ($list_agencys->lastPage() - $list_agencys->currentPage()) - 1;
                          }
                          ?>
                          @if ($from < $i && $i < $to)
                              <li class="{{ ($list_agencys->currentPage() == $i) ? ' active' : '' }}">
                                
                                    @if(empty($search))
                                      <a  class="{{ ($list_agencys->currentPage() == $i) ? ' active' : '' }}" href="{{$list_agencys->url($i)}}" data-page={{$i}}>{{ $i }}</a>
                                    @else
                                      <a  class="{{ ($list_agencys->currentPage() == $i) ? ' active' : '' }}" href="{{$list_agencys->url($i)}}&search={{ $search }}" data-page={{$i}}>{{ $i }}</a>
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
<!-- popup -->
<div id="popup-day" class="modal fade animate" data-backdrop="true">
   <div class="modal-dialog" id="animate">
       <div class="modal-content">
       
       <form method="post" id="d-submit">
           <div class="modal-header">
               <table>
                   <tr>
                       <td style="width: 98%;"><h5 class="modal-title">Thống kê</h5></td>
                        <div id="error" class="col-sm-12" style="background-color:#F2DEDE;padding:20px 0px 20px 17px;margin:15px 0px;border:1px solid #EBCCCC;border-radius:3px;display:none;"></div>
                       <td><button style="background-color: #92D050;color: #fff;padding-top: 6px;padding-bottom: 6px;width: 80px;border: none;">Kiểm tra</button></td>
                   </tr>
               </table>
           </div>
           <div class="modal-body p-lg">
               <div class="row">
                   
                  <div class="col-sm-12">
                      <div class="email-tb">
                           <div class="wrap-email-tb">
                              <p>Chọn thời gian thống kê đại lý</p>
                             <p>Từ ngày</p>
                             <input type="text" required name="day1" id="datepicker1" style="    height: 38px;
    font-size: 10pt!important;
    border: 1px solid #E7E7E7!important;
    background-color: #F0F0F0;
    padding-left: 10px;
    padding-right: 10px;
    width: 100%;
    margin-bottom: 16px;">
                             <p>Đến ngày</p>
                             <input type="text" required name="day2" id="datepicker2" style="    height: 38px;
    font-size: 10pt!important;
    border: 1px solid #E7E7E7!important;
    background-color: #F0F0F0;
    padding-left: 10px;
    padding-right: 10px;
    width: 100%;
    margin-bottom: 16px;"> 
                             <p>Chọn đại lí</p>
                             <select class="select2-multiple" id="agency" name="agency[]" style="    height: 38px;
    font-size: 10pt!important;
    border: 1px solid #E7E7E7!important;
    background-color: #F0F0F0;
    padding-left: 10px;
    padding-right: 10px;
    width: 100%;
    margin-bottom: 16px;" multiple>
                                 <?php
                                    $select_agencys = App\Agency::get();
                                 ?>
                                 @foreach($select_agencys as $item_select)
                                   <option value="{!! $item_select->id !!}">
                                      {!! $item_select->name_agency !!}
                                   </option>
                                 @endforeach
                             </select>
                           </div>
                       </div>
                  </div>
               </div>
           </div>
          </form> 
       </div>
       <!-- /.modal-content -->
   </div>
</div>
<!-- popup -->
@endsection
@section('js-footer')
  <script src="{{ asset('backend/libs/jquery/screenfull/dist/screenfull.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/footable/dist/footable.all.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/select2/dist/js/select2.min.js') }}"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
  $(".select2-multiple").select2({
      placeholder: "Chọn đại lý "
    });
    $(document).on('click', '#day-static', function(event) {
       event.preventDefault();
       $('#popup-day').modal('show');
     });

   $( function() {
    $( "#datepicker1" ).datepicker();
  } );
   $( function() {
    $( "#datepicker2" ).datepicker();
  } );

   $(document).on('submit','#d-submit',function(e){
      e.preventDefault();
      var form = $('#d-submit')[0];
      var formData = new FormData(form);

      $.ajax({
        headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
        type:"post",
        url:"{{route('ajax.agency.static')}}",
        data: formData,
        contentType: false,
        processData: false,
        success:function(data){
          if(data.errors == 1){
                //tinh thành
                span = '<span style="color:#B84855!important"><span style="color:#A94442!important">Error:</span> Vui lòng nhập ngày</span>';
                $('#error').css('display','block').html(span).delay(4000).slideUp();
                $('#popup-loading').modal('hide');
              }

          if(data.errors == 2){
                //tinh thành
                span = '<span style="color:#B84855!important"><span style="color:#A94442!important">Error:</span> Định dạng ngày không đúng</span>';
                $('#error').css('display','block').html(span).delay(4000).slideUp();
                $('#popup-loading').modal('hide');
              }
          if(data.errors == 0){
                //tinh thành
                 window.location = data.link;
              }
              
        },
        dataType:"json"
      });
     });
  </script>
@endsection