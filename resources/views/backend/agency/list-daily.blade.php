@extends('backend.layouts.default')


@section('content')
<style type="text/css">
	.modal-body .email-tb input,.modal-body .so-sp input,textarea{height:38px;padding-left:10px;padding-right:10px;background-color:#F0F0F0}.material-icons,.nav-item span{cursor:pointer}body{font-family:Roboto!important}.modal-body .so-sp input,textarea{width:48%;font-size:10pt!important;border:1px solid #E7E7E7!important}.modal-body .email-tb input,.modal-body .nd-email textarea{width:100%;font-size:10pt!important;border:1px solid #E7E7E7!important}.modal-body .so-sp input:first-child{float:right}.modal-body .nd-email textarea{height:100px;padding:10px}.modal-content{border-radius:0}.modal-header{height:45px;padding:0 15px}.modal-header .modal-title{font-size:10.5pt;font-family:'Roboto Bold';line-height:45px}.modal-body p,.modal-body tr td,.modal-body tr th,.modal-header button{font-family:Roboto}.modal-header button{background-color:#92D050;color:#fff;font-size:10pt;padding-top:5px;padding-bottom:5px;width:70px;border:none}.modal-body p{font-size:10pt}.email-tb,.so-sp{margin-bottom:16px}.modal-body .so-sp input{width:100%;height:38px;font-size:10pt!important;border:1px solid #E7E7E7!important;padding-left:10px;padding-right:10px}.modal-body .email-tb table{border:1px solid #E7E7E7;width:100%}

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
    .change_event{
    	color: #404040;
    	padding: 2px 5px;
    	border-radius: 3px;
    }
    .change_event:hover{
    	background-color: rgba(204, 204, 204, 0.4);
    	cursor: pointer;
    }
   </style>
<?php $event_all  = App\EventSale::get();?>
<?php $events  = App\EventSale::where('status',1)->get();?>
<div class="app-header white box-shadow">
<div class="navbar">
    <div style="float:left;" class="title_form">
        @if(session('admin')->can(['them_dai_ly']))
          <a href="{{ route('add.agency') }}" class="p-themmoi" style="margin-left:0px">+ Thêm đại lý</a>
        @else
          <a class="p-themmoi" style="margin-left:0px;">Danh sách </a>
        @endif
    </div>
</div>
</div>
 <div class="app-body" id="view">
    <div class="padding">
    @include('backend.partials._messages')
      <div class="box">
        <div class="box-body">
        <form method="get" action="{!! route('search.dai.ly') !!}" style="display: inline-block; width: 100%;">
          <input id="filter" style="width:calc(100% - 100px); line-height:30px;" placeholder="Tìm kiếm đại lý" type="text" class="form-control input-sm inline m-r" name="search" />
          <button class="number-post">{!! sizeof($list_agencys) !!} Đại lý</button>
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
                      Email
                  </th>
                  <th>
                      Đại lý
                  </th>
                  <th>
                      Địa chỉ
                  </th>
                  <th>
                      Số điện thoại
                  </th>
                  <th>
                      Subdomain
                  </th>
                  <th  style="width:17%!important">
                      Sp phân phối
                  </th>
                  <th style="width:10%!important">
                      Tình trạng
                  </th>
                  <th style="width:8%!important">
                      Event
                  </th>
                  <th  style="width:19%!important;padding-left:25px!important" >
                    Hành động
                  </th>
              </tr>
            </thead>
            <tbody>
              @foreach($list_agencys as $key => $item)
              <tr class="d_width">
                  <td style="width:13%!important">
                    {!! $item->email !!}
                  </td>
                  <td>
                    {!! $item->name_agency !!}
                  </td>
                  <td>
                    {!! $item->address_agency !!}
                  </td>
                  <td>
                    {!! $item->phone !!}
                  </td>
                  <?php 
                    $link = $item->subdomain.".".'thietkewebuytinhanoi.com';
                  ?>
                  <td>
                    <a href="http://{!! $link !!}">{!! $item->subdomain !!}</a>
                  </td>
                  <td style="width:17%!important">
                    <a href="{!! route('frame.agency.list',['id'=>$item->id,'slug'=>$item->add_1]) !!}">Chi tiết</a>
                  </td>
                  <td style="width:8%!important">
                    @if($item->status == 1)
                      <span style="color:#009D17;cursor:pointer;" @if(session('admin')->can(['them_dai_ly']))  class="d-status-agency" @endif >
                        <i class="material-icons " data-status="{!! $item->status !!}" data-id="{!! $item->id !!}" style=" font-size:20px;">&#xe80b;</i>
                      </span>
                    @endif
                    @if($item->status == 0)
                      <span style="color:#404040;cursor:pointer;" @if(session('admin')->can(['them_dai_ly']))  class="d-status-agency" @endif>
                          <i class="material-icons " data-status="{!! $item->status !!}" data-id="{!! $item->id !!}" style=" font-size:20px;">&#xe62f;</i>
                      </span>
                    @endif
                  </td>
                  <td><!-- 
                    <label class="ui-check"><input type="checkbox" @if($item->level == 1) checked @endif class="d_share" data-id="{!! $item->id !!}" name="share" ><i class="dark-white" ></i></label> -->
                    @foreach($event_all as $event)
                    	@if($event->id == $item->event_active)
                    	 <label  class="change_event" data-agency="{!! $item->id !!}" data-id="{!! $item->event_active !!}">{{$event->name}}</label>
                    	@endif
                    @endforeach
                    @if($item->event_active == 0 )
                     <label class="change_event"  data-agency="{!! $item->id !!}" data-id="{!! $item->event_active !!}">Không</label>
                    @endif
                  </td>
                  <td  style="width:19%!important">
                  @if(session('admin')->can(['sua_dai_ly']))
                    <a href="{!! route('edit.agency',['id'=>$item->id,'slug'=>$item->add_1]) !!}">Sửa</a>
                  @endif 
                  @if(session('admin')->can(['xoa_dai_ly'])) 
                    <a href="#" id="d_del_agency" data-id="{!! $item->id !!}">Xóa</a>
                  </td>
                  @endif
              </tr>
              @endforeach
            </tbody>
            <tfoot class="hide-if-no-paging">
              <tr>
                  <td colspan="12" class="text-center">
                    <ul class="list-inline comment-pagination">
                    </ul>
                  </td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
</div>

 <div id="popup-event-list" class="modal fade animate in" data-backdrop="true" style="display: none; padding-left: 17px;">
   <div class="modal-dialog" id="animate">
       <div class="modal-content">
           <div class="modal-header">
               <table>
                   <tbody>
                       <tr>
                           <td style="width: 70%;">
                               <h5 class="modal-title">Chọn Event</h5>
                           </td>
                       </tr>
                   </tbody>
               </table>
           </div>
           <div class="modal-body p-lg" id="d-edit-label">
           		
           		
           		<div class="nd-email" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;padding-left: 15px;padding-right: 15px;cursor: pointer;padding-bottom: 9px;background-color: rgb(246,246,246)"  data-event="0">
					   	<div style="margin-bottom: 0;" class="d-click-choose" data-label="0">
					   		<div class="col-md-11" style="padding:0px">Không chọn</div>
					   		<div class="col-md-1 active_event" style="padding:0px"><span></span></div>
					   		<div style="clear: both;"></div>
					   	</div>
				</div>
           		@foreach($events as $key => $event)
           			<div class="nd-email"  data-event="{{$event->id}}" style="margin-bottom: 0px;border-top: solid 1px #EBEDED ;padding-top: 9px;padding-left: 15px;padding-right: 15px;cursor: pointer;padding-bottom: 9px;@if($key%2 ==1)background-color: rgb(246,246,246);@endif">
					   	<div style="margin-bottom: 0;" class="d-click-choose" data-label="{{$event->id}}">
					   		<div class="col-md-4" style="padding:0px">{{$event->name}}</div>
					   		<div class="col-md-3" style="padding:0px">@if($event->share) Y/c share @else Không Y/c share @endif</div>
					   		<div class="col-md-4" style="padding:0px">
					   			@if($event->type) {{number_format($event->money_sale, 0, '', '.')}}/{{number_format($event->money_min, 0, '', '.')}} @else {{$event->percent}}% @endif
					   		</div>
					   		<div class="col-md-1 active_event" style="padding:0px">
					   			<span></span>
					   		</div>
					   		<div style="clear: both;"></div>
					   	</div>
					</div>
           		@endforeach
                
           </div>
       </div>
       <!-- /.modal-content -->
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
      $(document).on('click','#d_del_agency', function(event){
           event.preventDefault();
           if(xacnhanxoa('Bạn có chắc xóa đại lý hiện tại hay không?')===false){

           }
           else{
            id = $(this).attr('data-id');
             $.ajax({
                 type: 'post',
                 url:  '{{ route('del.agency') }}',
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

      $(document).on('change','.d_share',function(e){
          e.preventDefault();
          id = $(this).data('id');
          $.ajax({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            type:"post",
            url:"{{route('change.agency.percent')}}",
            data:{'id':id},
            success:function(data){
              
            },
            cache:false,
            dataType: 'json'
          });
      });
      var agency_id = 0;
       $(document).on('click','.change_event',function(e){
          e.preventDefault();
          id = $(this).data('id');
          agency_id = $(this).data('agency');
          str ='<span><i class="material-icons pull-right" style="color: #BC0098">&#xe5ca;</i></span>';
          $('.d-click-choose .active_event').html('');
          $('.d-click-choose[data-label='+id+'] .active_event').html(str);
          $('#popup-event-list').modal('show');
      });
       $(document).on('click','.nd-email',function(e){
          e.preventDefault();
          event = $(this).data('event');
          $.ajax({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            type:"post",
            url:"{{route('change.agency.event')}}",
            data:{'event':event,"agency":agency_id},
            success:function(data){
              $('#popup-event-list').modal('hide');
              location.reload();
            },
            cache:false,
            dataType: 'json'
          });
         
      });
  </script>
@endsection