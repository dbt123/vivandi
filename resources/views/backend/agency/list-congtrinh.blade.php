@extends('backend.layouts.default')


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
        <p>Danh sách công trình</p>
    </div>
</div>
</div>
 <div class="app-body" id="view">
    <div class="padding">
    @include('backend.partials._messages')
      <div class="box">
        <div class="box-body">
        <form method="get" action="{{ route('search.cong.trinh') }}" style="display: inline-block; width: 100%;">
          <input id="filter" style="width:calc(100% - 100px); line-height:30px;" placeholder="Tìm kiếm công trình" type="text" class="form-control input-sm inline m-r" name="search" />
          <button class="number-post">{!! sizeof($list_contruct) !!} Công trình</button>
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
                      Tên 
                  </th>
                  <th>
                      Khách hàng
                  </th>
                  <th>
                      Địa chỉ
                  </th>
                  <th>
                      Số điện thoại
                  </th>
                  <th>
                      Đại lý
                  </th>
                  <th>
                      Sản phẩm
                  </th>
                  
                  <th  style="width:19%!important;padding-left:31px!important" >
                    Hành động
                  </th>
              </tr>
            </thead>
            <tbody>
              @foreach($list_contruct as $key => $item)
              <tr class="d_width">
                  <td style="width:13%!important">
                    {!! $item->name !!}
                  </td>
                  <td>
                    {!! $item->customer !!}
                  </td>
                  <td>
                    {!! $item->address !!}
                  </td>
                  <td>
                    {!! $item->phone !!}
                  </td>

                  <?php
                    $agency = App\Agency::where('id',$item->agency_id)->first();
                  ?>
                  <td>
                  	@if($agency)
                    {!! $agency->name_agency!!}
                    @else
                    Đại lý đã bị xóa
                    @endif
                  </td>
                  
                  <td>
                    <a @if(session('admin')->can('gan_san_pham_cong_trinh')) href="{!! route('frame.contruct',['id'=>$item->id]) !!}" @endif>Gán</a>  
                  </td> 
                 
                  <td  style="width:19%!important">
                    @if(session('admin')->can('sua_cong_trinh'))
                    <a href="{!! route('edit.contruct',['id'=>$item->id]) !!}">Sửa</a>
                    @endif
                    @if(session('admin')->can('xoa_cong_trinh'))
                    <a href="#" id="d_del_contruct" data-id="{!! $item->id !!}">Xóa</a>
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
                        @for ($i = 1; $i <= $list_contruct->lastPage(); $i++)
                          <?php
                          $half_total_links = floor($link_limit / 2);
                          $from = $list_contruct->currentPage() - $half_total_links;
                          $to = $list_contruct->currentPage() + $half_total_links;
                          if ($list_contruct->currentPage() < $half_total_links) {
                             $to += $half_total_links - $list_contruct->currentPage();
                          }
                          if ($list_contruct->lastPage() - $list_contruct->currentPage() < $half_total_links) {
                              $from -= $half_total_links - ($list_contruct->lastPage() - $list_contruct->currentPage()) - 1;
                          }
                          ?>
                          @if ($from < $i && $i < $to)
                              <li class="{{ ($list_contruct->currentPage() == $i) ? ' active' : '' }}">
                                
                                    @if(empty($search))
                                      <a  class="{{ ($list_contruct->currentPage() == $i) ? ' active' : '' }}" href="{{$list_contruct->url($i)}}" data-page={{$i}}>{{ $i }}</a>
                                    @else
                                      <a  class="{{ ($list_contruct->currentPage() == $i) ? ' active' : '' }}" href="{{$list_contruct->url($i)}}&search={{ $search }}" data-page={{$i}}>{{ $i }}</a>
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
  <script>

    function xacnhanxoa(msg){

      if(window.confirm(msg)){
        return true;
      }
      else
        return false;
     };
      $(document).on('click','#d_del_contruct', function(event){
           event.preventDefault();
           if(xacnhanxoa('Bạn có muốn xóa công trình này không?')===false){

           }
           else{
            id = $(this).attr('data-id');
             $.ajax({
                 type: 'post',
                 url:  '{{ route('del.contruct') }}',
                 data: {'id': id},
                 dataType:'json',
                 success: function(msg){
                    if(msg == true){
                      location.reload();
                    }
                    else{
                      alert('có lỗi xảy ra');
                    }
                 }
             });
           }            
      });

      $(document).on('click','.d-status-agency',function(e){
        e.preventDefault();
        id = $(this).children().data('id');
        status = $(this).children().data('status');
        container = $(this);
          $.ajax({
          headers: {
              'X-CSRF-TOKEN': '{{ csrf_token() }}'
          },
          type:"post",
          url:"{{route('change.status.agency')}}",
          data:{'id':id,'status':status},
          success:function(data){
            if(data.status == true){
              if(data.sta == 0){
                content = '<i class="material-icons " data-status="'+data.agency.status+'" data-id="'+data.agency.id+'"  style="font-size:20px;">'+
                '&#xe62f;'+
                '</i>';
                container.css('color','#404040').html(content);
              }
              if(data.sta == 1){
                content = '<i class="material-icons " data-status="'+data.agency.status+'" data-id="'+data.agency.id+'"  style=" font-size:20px;">'+
                  '&#xe80b;'+
                '</i>'; 
                container.css('color','#009D17').html(content);
              }
            }
          },
          cache:false,
          dataType: 'json'
        });
      });
  </script>
@endsection