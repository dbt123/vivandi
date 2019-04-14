@extends('backend_center.layouts.defaultC')
@section('css')
   <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2-bootstrap-theme/dist/select2-bootstrap.min.css') }}" type="text/css" />
   <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2/dist/css/select2.min.css') }}" type="text/css" />
@endsection

@section('content')
<style type="text/css">
    .label-info{background-color:#5bc0de}.bootstrap-tagsinput,.select2-selection,input,textarea{background-color:#F0F0F0!important}.bootstrap-tagsinput{width:100%}.bootstrap-tagsinput input{min-height:2rem}.label{font-size:96%}.select2-results__option,input,select,textarea{font-size:10pt!important}input,textarea{border:1px solid #E7E7E7!important}.select2-results__option{padding-left:14px!important}.select2-dropdown{border-radius:0!important;border-bottom:1px solid #E7E7E7!important;border-top:1px solid #E7E7E7!important;border-left:1px solid #E7E7E7!important;border-right:1px solid #E7E7E7!important}.select2-selection{color:#D1F5F1;border-radius:0!important;border:1px solid #E7E7E7!important}.select2-selection__choice{font-size:10pt!important;background-color:#0CC2AA!important;border:1px solid #0CC2AA!important;color:#D1F5F1!important}.select2-search__field{background-color:#F0F0F0!important;border:none!important}.box-header,.modal-header{border-bottom:1px solid #E7E7E7}.select2-selection__choice__remove{color:#D1F5F1!important}.select2-selection__rendered{padding-top:5px!important;padding-bottom:5px!important;padding-left:13px!important;border-radius:0!important}.select2-results__option--highlighted{background-color:#F0F0F0!important;color:#404040!important}.select2-selection__clear{color:#BFBFBF!important}.select2-search__field::-webkit-input-placeholder{color:#404040}.select2-search__field::-moz-placeholder{color:#404040}.select2-search__field:-ms-input-placeholder{color:#404040}.select2-search__field:-moz-placeholder{color:#404040}.nav-item a,label{color:#A6A6A6}label{font-size:10pt}.nav-item a{background-color:#F2F2F2;margin-right:10px}.note-toolbar{background-color:#fff;padding:0!important}.dropdown-toggle::after,.note-popover{display:none}.p-a-sm{box-shadow:none!important;padding:0!important}.note-editable{padding-right:0!important;padding-left:0!important}.title_form{margin-top:16px;font-size:14pt}.dd-content{padding-top:15px!important;padding-bottom:15px!important}.dd-item>button{height:41px!important}.cate_name,.menu_name{font-size:10.5pt}.alert,.nav-item a,.note-editable{font-size:10pt}.cate_edit a,.menu_edit a{background-color:#E7E7E7;padding:4px 12px;border-radius:3px;color:#A6A6A6}label[for=file_img_preview]{line-height:1.3}label[for=file_img_preview] a{padding-top:4px!important;padding-bottom:4px!important;min-width:120px}.title_form p{font-family:'Roboto Black'}.nav-link{padding-right:3px}.nav-item span{padding-left:8px;cursor:pointer}h2{font-family:Roboto-Bold;font-size:10.5pt!important}@media (min-width:991px){.title_form{margin-left:10px!important;margin-top:16px}}.number-post{width:80px;height:44px;background-color:#fff;border:1px solid #E7E7E7;float:left;color:#404040;font-size:10pt}.drop-cate,.drop-cate:hover{background-color:rgba(1,1,1,0)!important;box-shadow:none!important}.dropdown-item,td,th{font-size:10pt!important}#filter{float:left}.modal-body .so-sp input:first-child,.pagination{float:right}.box-body{position:relative}.drop-cate{position:absolute;left:calc(100% - 150px);top:28px;width:20px!important;height:20px!important;padding:7px!important}.dropdown-menu{left:16px!important;top:58px!important;width:calc(100% - 132px);padding-top:0!important;padding-bottom:0!important;border-top:0!important;border-top-left-radius:0!important;border-top-right-radius:0!important}.dropdown-item{padding-top:10px!important;padding-bottom:10px!important}.dropdown-toggle::after{margin-left:-1px!important;display:inline-block;width:0;height:0;margin-right:.25rem;vertical-align:middle;content:"";border-top:.3em solid;border-right:.3em solid transparent;border-left:.3em solid transparent;margin-top:-20px}th{font-family:Roboto-Bold!important}.action-post a{padding:4px 10px}.action-post a:hover{background-color:#bfbfbf;border-radius:2px}.pagination>li>a{padding:.4rem .75rem!important}.footable{margin-bottom:0!important}.status:first-letter{text-transform:uppercase}.modal-dialog{width:600px;margin:70px auto}.modal-content{border:1px solid #E7E7E7;border-radius:0}.modal-title{font-size:10.5pt;font-family:"Roboto Bold"}.add-attr{background-color:#92D050;color:#fff;font-size:8pt;padding-top:6px;padding-bottom:6px}.add-attr:hover{background-color:#92D050!important}option:disabled{background:#ddd}.select2-container .select2-selection--single{height:37px}.select2-selection__arrow{height:35px!important}.select2-search__field{display:none}.select2-search--dropdown{padding:0!important}.select2{width:100%!important;font-size:10pt}.select2-selection__rendered{font-size:10pt!important}.del-order{color:#777;font-family:Roboto-Bold}.del-order:hover{color:#404040}.modal-header{height:50px;padding:0 15px}.modal-header .modal-title{font-size:10.5pt;font-family:'Roboto Bold';line-height:50px}.modal-body p,.modal-header button{font-size:10pt;font-family:Roboto}.modal-header button{background-color:#92D050;color:#fff;padding-top:6px;padding-bottom:6px;width:80px;border:none}.modal-body .email-tb input,.modal-body .so-sp input,textarea{height:38px;font-size:10pt!important;border:1px solid #E7E7E7!important;background-color:#F0F0F0;padding-left:10px;padding-right:10px}.email-tb,.so-sp{margin-bottom:0}.modal-body .so-sp input,textarea{width:48%}.modal-body .email-tb input{width:100%;margin-bottom:16px}.wrap-email-tb{border:1px solid #e5e5e5;padding:10px}.wrap-email-tb p:first-child{border-bottom:solid 1px #e5e5e5;margin-left:-10px;margin-right:-10px;padding-left:10px;padding-right:10px;margin-bottom:15px;padding-bottom:10px;font-family:'Roboto Bold'}.p-themmoi,.p-themmoi1{margin-left:30px;font-size:14pt;font-family:'Roboto Black'}.wrap-email-tb textarea{width:100%;height:180px}.p-themmoi{color:rgba(0,0,0,.4)}.p-themmoi:hover{color:#738CEC}.p-themmoi1{color:rgba(0,0,0,.87)}.p-themmoi1:hover{color:#738CEC}
            .pagination{float:right}th{font-family:Roboto-Bold!important}.action-post a{padding:4px 10px}.comment-pagination>li>a,.pagination>li>a{padding:.4rem .75rem!important}.action-post a:hover{background-color:#bfbfbf;border-radius:2px}.footable{margin-bottom:0!important}.add_attr_tab{color:#738CEC}.comment-pagination>li{display:inline;list-style:none}.comment-pagination>li>a{position:relative;float:left;margin-left:-1px;line-height:1.5;color:#0275d8;text-decoration:none;background-color:#fff;border:1px solid #ddd}.comment-pagination>li>.active{background-color:#0CC2AA;color:#fff;border:1px solid #0CC2AA}
      .d-background:hover{background-color:rgba(204, 204, 204, 0.4);cursor: pointer; }      
       </style>
<div class="app-header white box-shadow">
<div class="navbar">
     <div style="float:left;" class="title_form">
          <p>Danh sách sản phẩm</p>
    </div>
</div>
</div>
 <div class="app-body" id="view">
    <div class="padding">
      <div class="box">
        <div class="box-body">
          <form method="get" action="{!! route('search.pro.center') !!}" style="display: inline-block; width: 100%;">
              <input style="width:calc(100% - 100px); line-height:30px;" autocomplete="off" placeholder="Tìm kiếm sản phẩm" type="text" class="form-control input-sm inline m-r" name="search"/>
              <button class="number-post" style="float:right">{{$frame->count()}} SP</button>
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
              <tr>
                  <th data-toggle="true">
                      Tên 
                  </th>
                  <th data-toggle="true">
                      Ảnh
                  </th>
                  <th data-toggle= "true">
                      Mã
                  </th>
                  <th>
                      Số lượng
                  </th>
                  <th>
                    Trạng thái
                  </th>
              </tr>
            </thead>
            <tbody>
            @foreach($frame as $item)
              <tr>
                  <?php
                    $b =route('getProDetaildomain',['id'=>$item->id,'slug'=>$item->slug]);
                    $pieces = explode('//', $b);
                    unset($pieces[0]);
                    $b = session('center')->subdomain.'.'.$pieces[1];
                  ?>
                  <td><a href="//{{$b}}">{!! $item->name !!}</a></td>
                  <td><img src="{!! $item->img !!}" style="width:46px;height:auto;"></td>
                  <td>{!! $item->code_frame !!}</td>
                  <?php
                    $sku = App\Agency_frame::where('frame_id',$item->id)->where('agency_id',session('center')->id)->first();
                  ?>
                  <td >{!! $sku->sku_frame_agency !!}</td>
                  <td>
                    @if($item->status == 1)
                      <span style="color:#009D17;" class="d-status">
                        <i class="material-icons " style="padding-left: 17px; font-size:20px;">&#xe80b;</i>
                      </span>
                    @endif
                    @if($item->status == 0)
                      <span style="color:#404040;" class="d-status">
                          <i class="material-icons " style="padding-left: 17px; font-size:20px;">&#xe62f;</i>
                      </span>
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
                        @for ($i = 1; $i <= $frame->lastPage(); $i++)
                          <?php
                          $half_total_links = floor($link_limit / 2);
                          $from = $frame->currentPage() - $half_total_links;
                          $to = $frame->currentPage() + $half_total_links;
                          if ($frame->currentPage() < $half_total_links) {
                             $to += $half_total_links - $frame->currentPage();
                          }
                          if ($frame->lastPage() - $frame->currentPage() < $half_total_links) {
                              $from -= $half_total_links - ($frame->lastPage() - $frame->currentPage()) - 1;
                          }
                          ?>
                          @if ($from < $i && $i < $to)
                              <li class="{{ ($frame->currentPage() == $i) ? ' active' : '' }}">
                                
                                    @if(empty($search))
                                      <a  class="{{ ($frame->currentPage() == $i) ? ' active' : '' }}" href="{{$frame->url($i)}}" data-page={{$i}}>{{ $i }}</a>
                                    @else
                                      <a  class="{{ ($frame->currentPage() == $i) ? ' active' : '' }}" href="{{$frame->url($i)}}&search={{ $search }}" data-page={{$i}}>{{ $i }}</a>
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

@endsection
@section('js-footer')
  <script src="{{ asset('backend/libs/jquery/screenfull/dist/screenfull.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/footable/dist/footable.all.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/select2/dist/js/select2.min.js') }}"></script>

   
@endsection