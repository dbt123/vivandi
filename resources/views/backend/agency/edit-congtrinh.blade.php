@extends('backend.layouts.default')
@section('css')
	 <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2-bootstrap-theme/dist/select2-bootstrap.min.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2/dist/css/select2.min.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('summernote/dist/summernote.css') }}" type="text/css" />
	
	 <link rel="stylesheet" href="{{ asset('libs/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('backend/assets/styles/backend.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('backend/stag/css/stag.css') }}" type="text/css" />
	 <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
	 <style type="text/css">
	 	.list-value,.select2-search__field{display:none}.add-attribute,.material-icons{cursor:pointer}h2{font-family:Roboto-Bold;font-size:10.5pt!important}div#myDropZone{width:100%;min-height:100px;background-color:#F0F0F0;border:1px solid #E7E7E7!important}.dz-message span{font-size:10pt!important}.dz-remove{font-size:9pt!important}.dz-image{border-radius:0!important}option:disabled{background:#ddd}.select2-container .select2-selection--single{height:37px}.select2-selection__arrow{height:35px!important}.select2-search--dropdown{padding:0!important}.select2{width:100%!important;font-size:10pt}.select2-selection__rendered{font-size:10pt!important}.dz-progress{background-color:rgba(255,255,255,0)!important}.add-attribute{position:absolute;right:15px;top:10px;color:#738CEC}.modal-dialog{width:600px;margin:70px auto}.modal-header{padding:12px 15px;border-bottom:1px solid #E7E7E7}.modal-title{font-size:10.5pt;font-family:"Roboto Bold"}.add-attr{background-color:#92D050;color:#fff;font-size:10pt;padding-top:5px;padding-bottom:5px;width:70px}.add-attr:hover{background-color:#92D050!important;color:#fff}.modal-content{border-radius:0;border:0}.attr-item{position:relative}.list-value{position:absolute;background-color:#fff;border:1px solid #E7E7E7;width:100%;z-index:99;max-height:150px;overflow-y:scroll}.m-money,.seo_tags{position:relative}.m-money1:hover .m-tooltip,.m-money:hover .m-tooltip{display:block}.list-value div{padding:5px 10px}.add_attr_tab{color:#738CEC}.autocomplete{font-family:Roboto;font-size:9pt;padding:7px 10px}.autocomplete:hover{background-color:#F0F0F0}.attr-item .bootstrap-tagsinput span,.seo_tags .bootstrap-tagsinput span{background-color:rgba(0,0,0,0)!important;border:1px solid transparent!important}.attr-item .bootstrap-tagsinput{padding:4px 10px}.attr-item .bootstrap-tagsinput span[data-role=remove]{color:#bfbfbf!important;margin-left:0!important}.attr-item .bootstrap-tagsinput span,.attr-item .bootstrap-tagsinput span[data-role=remove]:hover{color:#404040!important}.attr-item .bootstrap-tagsinput .label{padding:2px 0!important}.attr-item .bootstrap-tagsinput input{padding-left:0;min-height:1em}.seo_tags .bootstrap-tagsinput{padding:4px 10px}.seo_tags .bootstrap-tagsinput span[data-role=remove]{color:#bfbfbf!important;margin-left:0!important}.seo_tags .bootstrap-tagsinput span,.seo_tags .bootstrap-tagsinput span[data-role=remove]:hover{color:#404040!important}.seo_tags .bootstrap-tagsinput .label{padding:2px 0!important}.seo_tags .bootstrap-tagsinput input{padding-left:0;min-height:1em}.m-money .m-tooltip,.m-money1 .m-tooltip{height:28px;width:auto;padding-top:4px;padding-left:10px;padding-right:10px;font-family:Roboto;font-size:10pt;z-index:9999;background-color:#000;color:#fff;top:60px}.m-money .m-tooltip{position:absolute;border:1px solid #E7E7E7;border-bottom:0;border-radius:6px}.m-money .m-tooltip:after{content:"";position:absolute;bottom:100%;left:50%;margin-left:-5px;border-width:5px;border-style:solid;border-color:transparent transparent #000}.m-money1{position:relative}.m-tooltip{display:none}.m-money1 .m-tooltip{position:absolute;border:1px solid #E7E7E7;border-bottom:0;border-radius:6px}.m-money1 .m-tooltip:after{content:"";position:absolute;bottom:100%;left:50%;margin-left:-5px;border-width:5px;border-style:solid;border-color:transparent transparent #000}#add_youtube{position:absolute;right:15px;top:10px;color:#738CEC}.link_youtube{position:relative}.link_youtube input{width:calc(100% - 30px)}.link_youtube i{position:absolute;right:0;top:18px;transform:rotate(135deg);color:#DA2623}
	 		.link_youtube input{width:calc(100%)}
	 		.link_youtube i{position:absolute;right:0;top:14px;transform:rotate(135deg);color:#DA2623;margin-right: 7px;margin-top:-3px; color: #9c9c94 !important; visibility: hidden; opacity: 0}
	 		.link_youtube:hover i{
	 			visibility: visible; opacity: 1;
	 			transition: 0.4s
	 		}
	 		i {
			  -webkit-touch-callout: none; 
			    -webkit-user-select: none; 
			     -khtml-user-select: none; 
			       -moz-user-select: none; 
			        -ms-user-select: none;
			            user-select: none; 
			}
			.list_attr_tab button{
				background-color: #F0F0F0 !important;
			    border: 1px solid #E7E7E7;
			    border-radius: 0px;
			    color: #7f7f7f;
				min-height: 1.375rem;
    			padding: 0.2345rem 0.30rem;
			}
			.list_attr_tab button:hover{
				background-color: #7f7f7f !important;
				color: #fff !important;
			}
			.list_attr_tab button:active{
				background-color: #7f7f7f  !important;
				color: #fff !important;
			}
			.list_attr_tab button:focus{
				background-color: #7f7f7f  !important;
				color: #fff !important;
			}
			.list_attr_tab .form-control {
				min-height: 1.375rem;
			}
			.del_related #d_sty:hover{
				font-family: Roboto-Bold;
				color: #000!important;
			}
	 </style>
@endsection
@section('content')
<form ui-jp="parsley" method="post" action="{!! route('post.edit.contruct') !!}" enctype="multipart/form-data" id="form-edit-product">
<div class="app-header white box-shadow">
<div class="navbar">
		<div style="float:left;" class="title_form">
	      <p>Sửa Công trình {!! $contruct->name !!}</p>
	    </div>
    	<div style="float:right;margin-top:10px;">
		
    	<button type="submit" name="submit" value="save" class="btn" style="
    	padding-bottom: 8px;padding-top: 8px;font-size: 10pt;margin-right: 10px;font-family: 'Roboto-Bold';
    	min-width:100px; background-color:#F2F2F2">LƯU</button>
		
		</div>
</div>
</div>
	 <div class="app-body" id="view">
		 <style type="text/css">
		 	.alert{
		 		margin-top:20px;
		 		margin-bottom: 0px;
		 	}
		 </style>
	 	<div class="padding" style="padding-top:0px !important; padding-bottom:0px;">
 			@include('backend.partials._messages')
	 	</div>
	 	<div class="padding">
			 	 <div class="row masonry-container">
				    <div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Ảnh</h2></div>
				          <div class="box-body">
							<div class="row">
								<div class="col-sm-12">
									<input type="hidden" value="{{csrf_token()}}" name="_token">
									<input type="hidden" name="contruct_id" value="{!! $contruct->id !!}"> 
						           
						            <label tyle="margin-bottom:10px;">
						                <p style="margin-bottom:10px;line-height:0px">Ảnh</p>
						            </label>
						            <div class="body-nest" id="DropZone" >
									   <div id="myDropZone" class="dropzone">
									   </div>
									</div>
									<input type="hidden" name="img_product">    
								</div>
				         	</div>	 
		                  </div>
				        </div>
				    </div>

				    <div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Thông tin cơ bản</h2></div>
				          <div class="box-body">
							<div class="row">
								<div class="col-sm-12" style="">
									<div class="form-group">
						              <label>Tên công trình</label>
						              <input type="text" class="form-control" name="name" value="{!! $contruct->name !!}" autocomplete="off"  >                        
						            </div>
									
									<div class="form-group">
						              <label>Địa chỉ</label>
						              <input type="text" class="form-control" name="address" autocomplete="off" value="{!! $contruct->address !!}" >
						            </div>

						            <div class="form-group">
						              <label>Điện thoại</label>
						              <input type="text" class="form-control" name="phone" autocomplete="off" value="{!! $contruct->phone !!}" >
						            </div>
						            
						            <div class="form-group">
						              <label>Khách hàng</label>
						              <input type="text" class="form-control" name="customer" autocomplete="off" value="{!! $contruct->customer !!}" >
						            </div>
								</div>
				         	</div>	 
		                  </div>
				        </div>
				    </div>
				   

				    <?php $links_yt = json_decode($contruct->youtube_link);?>
				    <div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Video Youtube</h2>
				          <i class="material-icons md-24" id="add_youtube">&#xe147;</i>
				          </div>
				          <div class="box-body">
							<div class="row">
								<div class="col-sm-12" id="add_youtube_containner">
									@if( is_array($links_yt) )
									@foreach($links_yt as $link)
									<div class="form-group link_youtube" >
						              <input type="text" class="form-control" name="youtube[]"  autocomplete="off" value="{!! $link !!}">
						              <i class="material-icons md-20 close_yt">&#xe147;</i>
						            </div>
						            @endforeach
						            @endif
								</div>
							</div>
						  </div>
						</div>
					</div>
					
					<div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Mô tả chi tiết</h2></div>
				          <div class="box-body">
							<div class="row">
									<div class="col-sm-12">
										
							           	<ul class="nav nav-sm nav-pills nav-active-primary clearfix" id="list_tab_title">
										   
										</ul>
										
										<div class="tab-content" id="list_tab_content">      
										    <div class="tab-pane p-v-sm active" id="tab_1">
										      <div class="box m-t p-a-sm">
									            <div class="form-group">
									              <textarea  id="editor_1" class="form-control" rows="5" name="post_content">{!!$content->content !!}</textarea>
									            </div>
									          </div>
									          
										    </div>
										</div>       	
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
  <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
  <script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
  <script src="{{ asset('backend/stag/js/stag.js') }}"></script>
   <?php   $font_default = App\Item::where('key_item', 'font_default')->first();

           $font_custom = App\Item::where('key_item', 'font_custom')->first(); ?>
    <script type="text/javascript">
   		submit = 0;
   		$(document).on('mouseenter',"button[type=submit]",function(){
   			submit = 1;
   		});
   		$(document).on('mouseleave',"button[type=submit]",function(){
   			submit = 0;
   		});	
   		$(document).on('submit','#form-edit-product',function(e){
   			if(submit ==0){
   				e.preventDefault();
   			}
		});
		
   		i_name = $('.i_name');
   		$.each(i_name,function(i,v){
   			$(v).stag("Thêm " + $(v).prev().val(),[]);
   		});
   		i_name_fea = $('.i_name_fea');
   		$.each(i_name_fea,function(i,v){
   			$(v).stag("Thêm " + $(v).prev().val(),[],'stag2');
   		});
   		setInterval(function(){
   			load_masonry();
   		},1000);
   		$(document).on('mouseenter','.m-money',function(){
   			value = $(this).find('input').val();
   			if(!value){
				$(this).find('.m-tooltip').text("Chưa nhập giá");
   			}else{
   				value = (value + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
   				
   				$(this).find('.m-tooltip').text(value+" "+"đ");
   			}
   		});
   		$(document).on('keyup','.m-money input',function(){
   			value = $(this).val();
   			if(!value){
				$(this).next().text("Chưa nhập giá");

   			}else{
   				value = parseInt(value);
				value = (value + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
   				$(this).next().text(value+" "+"đ");
   			}
   		});
   		$(document).on('mouseenter','.m-money1',function(){
   			value = $(this).find('input').val();
   			if(!value){
				$(this).find('.m-tooltip').text("Chưa nhập Khối Lượng");
   			}else{
   				// value = (value + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
   				
   				$(this).find('.m-tooltip').text(value+"gam");
   			}
   		});
   		$(document).on('keyup','.m-money1 input',function(){
   			value = $(this).val();
   			if(!value){
				$(this).next().text("Chưa nhập Khối Lượng");

   			}else{
   				value = parseFloat(value);
				// value = (value + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
   				$(this).next().text(value+"gam");
   			}
   		});
  
  	$(document).on('click','#add_item',function(){
  		var list_check = $("#m-a-a .add_check:checked");
  		var list_uncheck = $("#m-a-a .add_check:not(:checked)");
  		$.each(list_check,function(i,v){
  			id = $(v).attr('data-id');
  			text = $(v).attr('data-name');
  			var d = $('#atrribute-containner .attr-item input[value="'+text+'"]');
  			if(d.length == 0){
	  			content = '<div class="row attr-item ">'+
				        	'<div class="col-sm-3">'+
				        		'<label style="margin-top:10px;">'+text+'</label>'+
				        	'</div>'+
				        	'<div class="col-sm-9">'+
				        		'<div class="form-group attr-item ">'+
				        			'<input type="hidden"  name="attrbute_k[]" value="'+text+'">'+
						            '<input type="text"  class="form-control i_name attr_temp" name="attrbute_v[]" autocomplete="off">'+
						        '</div>'+
				        	'</div>'+
				        '</div>';
		  		$("#atrribute-containner").append(content);
		  		$(".attr_temp").stag('Thêm '+text,[]);
	  			$(".attr_temp").removeClass('attr_temp');
	  		}	  		
  		});
  		$.each(list_uncheck,function(i,v){
  			id = $(v).attr('data-id');
  			text = $(v).attr('data-name');
  			var d = $('.attr-item input[value="'+text+'"]');
  			if(d.length !== 0){
  				$(d).parent().parent().parent().remove();
  			}
  		});
  		load_masonry();
  	});
  	// Thêm đặc tính
  	$(document).on('click','#add_item_features',function(){
  		var list_check = $("#m-a-a2 .add_check:checked");
  		var list_uncheck = $("#m-a-a2 .add_check:not(:checked)");
  		$.each(list_check,function(i,v){
  			id = $(v).attr('data-id');
  			text = $(v).attr('data-name');
  			var d = $('#atrribute-containner_features .attr-item input[value="'+text+'"]');
  			if(d.length == 0){
  				content = '<div class="row attr-item ">'+
				        	'<div class="col-sm-3">'+
				        		'<label style="margin-top:10px;">'+text+'</label>'+
				        	'</div>'+
				        	'<div class="col-sm-9">'+
				        		'<div class="form-group attr-item ">'+
				        			'<input type="hidden"  name="feature_k[]" value="'+text+'">'+
						            '<input type="text"  class="form-control i_name feature_temp" name="feature_v[]" autocomplete="off">'+
						        '</div>'+
				        	'</div>'+
				        '</div>';
		  		$("#atrribute-containner_features").append(content);
		  		$(".feature_temp").stag('Thêm '+text,[],'stag2');
	  			$(".feature_temp").removeClass('feature_temp');
	  		}	  		
  		});
  		$.each(list_uncheck,function(i,v){
  			id = $(v).attr('data-id');
  			text = $(v).attr('data-name');
  			var d = $('.attr-item input[value="'+text+'"]');
  			if(d.length !== 0){
  				$(d).parent().parent().parent().remove();
  			}
  		});
  		load_masonry();
  	});

  	$(document).on('click','#add_item1',function(){
  		var list_check = $("#m-a-a1 .add_check:checked");
  		var list_uncheck = $("#m-a-a1 .add_check:not(:checked)");
  		$.each(list_check,function(i,v){
  			id = $(v).attr('data-id');
  			text = $(v).attr('data-name');
  			init = $(v).attr('data-init');
  			if(init.length) init= " ("+init+")";
  			var d = $('#atrribute-containner1 .attr-item input[value="'+text+'"]');
  			if(d.length == 0){
	  			content = '<div class="row attr-item ">'+
				        	'<div class="col-sm-3">'+
				        		'<label style="margin-top:10px;">'+text+init+'</label>'+
				        	'</div>'+
				        	'<div class="col-sm-9">'+
				        		'<div class="form-group attr-item ">'+
				        			'<input type="hidden"  name="attrbute_k[]" value="'+text+'">'+
						            '<input type="text"  class="form-control i_name attr_temp" name="attrbute_v[]" autocomplete="off">'+
						        '</div>'+
				        	'</div>'+
				        '</div>';
		  		$("#atrribute-containner1").append(content);
		  		// $(".attr_temp").stag('Thêm '+text,['1','2']);
	  			$(".attr_temp").removeClass('attr_temp');
	  		}	  		
  		});
  		$.each(list_uncheck,function(i,v){
  			id = $(v).attr('data-id');
  			text = $(v).attr('data-name');
  			var d = $('.attr-item input[value="'+text+'"]');
  			if(d.length !== 0){
  				$(d).parent().parent().parent().remove();
  			}
  		});
  		load_masonry();
  	});
  
  	$(document).on('focus','#atrribute-containner .attr-item .stag-input',function(e){
  		input = this;
  		container  = $(this).getStagContainer();
  		var key = $(container).prev().prev().val();
  		if($(input).hasClass('data_avaiable')){
  		}else{
  			$.ajax({
              headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
              },
              type:"post",
              url:"{{route('check-key.products')}}",
              data:{'key':key},
              success:function(data){
              	list = [];
              	$.each(data.list,function(i,v){
              		list.push(v.value);
              	});
              	$(input).addClass('data_avaiable');
              	$(container).stagSuggestList(list);
              },
              cache:false,
              dataType:'json'
          	});
  			
  		}
  	});
  	$(document).on('focus','#atrribute-containner_features .attr-item .stag-input',function(e){
  		input = this;
  		container  = $(this).getStagContainer();
  		var key = $(container).prev().prev().val();
  		if($(input).hasClass('data_avaiable')){
  		}else{
  			$.ajax({
              headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
              },
              type:"post",
              url:"{{route('check-key.feature')}}",
              data:{'key':key},
              success:function(data){
              	list = [];
              	$.each(data.list,function(i,v){
              		list.push(v.value);
              	});
              	$(input).addClass('data_avaiable');
              	$(container).stagSuggestList(list);
              },
              cache:false,
              dataType:'json'
          	});
  			
  		}
  	});

  	$('#single').select2();
  	$(".select2-multiple").select2({
      placeholder: "Chọn danh mục "
    });
	$(function() {
		Dropzone.autoDiscover = false;
	    $("div#myDropZone").dropzone({
	    		maxFiles:6 - {{$image->count() }},
	    		maxfilesexceeded:function(file){
	    			// this.removeAllFiles();
           			 this.removeFile(file);
	    		},
		        url : "{{route('quan-tri.upload.up-img')}}",
	            addRemoveLinks : true,
			    maxFilesize: 5 - {{$image->count() }},
			    dictDefaultMessage: '',
			    dictResponseError: 'Error uploading file!',
			    headers: {
			        'X-CSRF-Token': '{{ csrf_token() }}'
			    },
			    error: function (file, response) {
			       load_masonry();
			    },
			    success: function (file, response) {
			    	console.log(response);
			    	$(file.previewElement).find('.dz-filename span').text(response);
			        var fileupload = $('.dz-filename span');
			  		var t = "";
			  		$.each(fileupload,function(i,v){
			  			if( i== fileupload.length - 1 ){
			  				t += $(v).text();
			  			}else{
			  				t += $(v).text()+ ",,,";
			  			}
			  		});
			  		$("input[name='img_product']").val(t);
			  		load_masonry();
			    },
			    removedfile: function(file) {
				    var _ref;
				    _ref = file.previewElement;

				    if(_ref!= null){
				    	_ref.parentNode.removeChild(file.previewElement);
				    	var fileupload = $('.dz-filename span');
				  		var t = "";
				  		$.each(fileupload,function(i,v){
				  			if( i== fileupload.length - 1 ){
				  				t += $(v).text();
				  			}else{
				  				t += $(v).text()+ ",,,";
				  			}
				  		});
				  		$("input[name='img_product']").val(t);
				  		load_masonry();
				    	setTimeout(function(){
				  			load_masonry();
				  		},200);
				    }
				}
	    });
	    
		var myDropzone = Dropzone.forElement("#myDropZone");
		@foreach($image as $img)
		
			  var myFile = {
				    name: "{!! $img->img !!}",
				    @if(file_exists(public_path().''.$img->img))
				    	size: "{!! filesize(public_path().''.$img->img) !!}"
				    @endif
			  };
			  myDropzone.emit("addedfile", myFile);
		      myDropzone.createThumbnailFromUrl(myFile, '{{asset($img->img)}}');

		@endforeach
	  	var fileupload = $('.dz-filename span');
			  		var t = "";
			  		$.each(fileupload,function(i,v){
			  			if( i== fileupload.length - 1 ){
			  				t += $(v).text();
			  			}else{
			  				t += $(v).text()+ ",,,";
			  			}
		});
		$("input[name='img_product']").val(t);
	});
  	$(document).on('click',"#add_tab",function(e){
    	e.preventDefault();
    	var c = $("#list_tab_title li").length;
    	if(c>5) return false;
    	
    	if( $("#li_tab2").length == 0  ){
    		c = 2;
    	}else{
    		if( $("#li_tab3").length  == 0 ){
	    			c = 3;
	    	}else{
	    		if( $("#li_tab4").length == 0  ){
		    		c = 4;
		    	}else{
		    		if( $("#li_tab5").length >0  ){
			    		c= 5;
			    	}
		    	}
	    	}
    	}
    	console.log('c = ' +c );    
    	var html = '<li class="nav-item new_tab" id="li_tab'+c+'">'+
    					'<a class="nav-link " href data-toggle="tab" data-target="#tab_'+c+'">Tab '+c+'<span  tab_id="'+c+'" >×</span></a>'
										   + '</li>';
		var content = '<div class="tab-pane p-v-sm" id="tab_'+c+'">'+
					'<div class="box m-t p-a-sm">'+
					'<input type="hidden" name="content[id][]" value="0" />'+
			      	'<div class="form-group">'+
		              '<label>Tên thẻ tab</label>'+
		              '<input  type="text" class="form-control i_name"'+
		               'name="content[name][]" value="Tab '+c+'">'+                        
		            '</div>'+
		            '<div class="form-group">'+
		     '<textarea  id="editor_'+c+'" class="form-control i_content"'+
		  'rows="5" name="content[content][]" ></textarea></div>'+
		          '</div>';
    	$(this).parent().before(html);
    	$("#list_tab_content").append(content);
    	$('#editor_'+c).summernote({
   	        lang: "vi-VN",
		    height: (452),
		    fontNames: [{!!isset($font_default) ?$font_default->value.',':''!!}{!!isset($font_custom) ?$font_custom->value:''!!}],
			fontNamesIgnoreCheck: [{!!isset($font_custom) ?$font_custom->value:''!!}],
		    popover: {
					  image: [
					    ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
					    ['float', ['floatLeft', 'floatRight', 'floatNone']],
					    ['remove', ['removeMedia']]
					  ],
					  link: [
					    ['link', ['linkDialogShow', 'unlink']]
					  ],
					  air: [
					    ['color', ['color']],
					    ['font', ['bold', 'underline', 'clear']],
					    ['para', ['ul', 'paragraph']],
					    ['table', ['table']],
					    ['insert', ['link', 'picture']]
					  ]
			},
		    toolbar: [
			    ['style', ['style']],
			    ['font', [ 'italic', 'underline', 'clear']],
			    ['fontname', ['fontname']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    // ['height', ['height']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture']],
			    ['view', [ 'codeview']],
			    ['help', ['help']]
			  ],
		    callbacks: {
		        onImageUpload: function(image) {
		            uploadImage(image[0],'#editor_'+c);
		        }
		    }
		});		
    	 
	});
	 $(document).on('click','.nav-link',function(){
	    	load_masonry();
    });
    $('#editor_1').summernote({
   	        lang: "vi-VN",
		    height: (270),
		    fontNames: [{!!isset($font_default) ?$font_default->value.',':''!!}{!!isset($font_custom) ?$font_custom->value:''!!}],
			fontNamesIgnoreCheck: [{!!isset($font_custom) ?$font_custom->value:''!!}],
	  
		    popover: {
					  image: [
					    ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
					    ['float', ['floatLeft', 'floatRight', 'floatNone']],
					    ['remove', ['removeMedia']]
					  ],
					  link: [
					    ['link', ['linkDialogShow', 'unlink']]
					  ],
					  air: [
					    ['color', ['color']],
					    ['font', ['bold', 'underline', 'clear']],
					    ['para', ['ul', 'paragraph']],
					    ['table', ['table']],
					    ['insert', ['link', 'picture']]
					  ]
			},
			
			toolbar: [
			    ['style', ['style']],
			    ['font', [ 'italic', 'underline', 'clear']],
			    ['fontname', ['fontname']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    // ['height', ['height']],
			    ['table', ['table']],
			    ['insert', ['link','picture']],
			    ['view', [ 'codeview']],
			    ['help', ['help']]
			  ],
		    callbacks: {
		        onImageUpload: function(image) {
		            uploadImage(image[0],"#editor_1");
		        }
		    }
		    
	});
	$("#list_tab_title li").each(function(i){
     	
     		$('#editor_'+i).summernote({
		   	        lang: "vi-VN",
		   	        defaultFontName:'Roboto',
		   	        fontNames: [{!!isset($font_default) ?$font_default->value.',':''!!}{!!isset($font_custom) ?$font_custom->value:''!!}],
			        fontNamesIgnoreCheck: [{!!isset($font_custom) ?$font_custom->value:''!!}],
			  
				    popover: {
							  image: [
							    ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
							    ['float', ['floatLeft', 'floatRight', 'floatNone']],
							    ['remove', ['removeMedia']]
							  ],
							  link: [
							    ['link', ['linkDialogShow', 'unlink']]
							  ],
							  air: [
							    ['color', ['color']],
							    ['font', ['bold', 'underline', 'clear']],
							    ['para', ['ul', 'paragraph']],
							    ['table', ['table']],
							    ['insert', ['link', 'picture']]
							  ]
					},
					toolbar: [
					    ['style', ['style']],
					    ['font', [ 'italic', 'underline', 'clear']],
					    ['fontname', ['fontname']],
					    ['color', ['color']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    // ['height', ['height']],
					    ['table', ['table']],
					    ['insert', ['link', 'picture']],
					    ['view', [ 'codeview']],
					    ['help', ['help']]
					  ],
				    height: (479),
				    callbacks: {
				        onImageUpload: function(image) {
				            uploadImage(image[0],'#editor_'+i);
				        }
				    }
			});
     	
        
     });
    $(document).on('click','.nav-link span',function(){
    	id = $(this).attr('tab_id');
    		if(id!=1){
    				$("#tab_"+id).remove();
    				$("#li_tab"+id).remove();
    		};
    	$("#default_tab").click();
    });
	function uploadImage(image,editor) {
		    var data = new FormData();
		    data.append("image", image);
		    $.ajax({
		        url: "{{route('quan-tri/dang-anh')}}",
		        cache: false,
		        contentType: false,
		        processData: false,
		        data: data,
		        type: "post",
		        success: function(data) {
		           var image = $('<img>').attr('src', data['url']).attr('alt', data['name']).attr('title', data['name']);
		            $(editor).summernote("insertNode", image[0]);
		        },
		        error: function(data) {
		            console.log(data);
		        }
		    });
	}
	function readURL(input) {
    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#img_preview').attr('src', e.target.result);
	            load_masonry();
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#file_img_preview").change(function(){
	    readURL(this);
	});
	  $(".select2-multiple").select2({
	  placeholder: "Không thuộc danh mục nào",
	  allowClear: true
	});
	
	 $.each($('textarea'),function(i,v){
	 	$(v).attr('spellcheck','false');
	 });
	 	$.each($('input'),function(i,v){
	 	$(v).attr('spellcheck','false');
	 });
	 $.each($('.note-editable'),function(i,v){
	 	$(v).attr('spellcheck','false');
	 });
	 function load_masonry(){
	      var container = $('.masonry-container');
	      container.masonry({
	        columnWidth: '.item',
	        itemSelector: '.item'
	      });   
	  }
	  load_masonry();
	  setTimeout(function(){
			load_masonry();
	  },200);

	  add_attr_tab = null;
  $(document).on('click','.add_attr_tab',function(e){
  	    add_attr_tab =  this;
  		$("#m-a-tab").modal('show');
  		var list_k = $("#atrribute-containner .form-group.attr-item input[name='attrbute_k[]']");
  		var list_v = $("#atrribute-containner .form-group.attr-item input[name='attrbute_v[]']");
  		$("#m-a-tab tbody").html('');
  		list = $(add_attr_tab).parent().next().val();
  		list_str_k  = list.split(",");

  		$.each(list_k,function(i,v){
  			k = $(v).val();
  			v = $(list_v[i]).val();
  			x = 0;
  			for(j=0 ; j< list_str_k.length;j++){
  				if(list_str_k[j] == k){
  					x++;
  				}
  			}
  			if(x == 0){
  				str = '<tr>'+
		              '<td style="width: 5%">'+
		              '<label class="ui-check m-a-0">'+
		              '<input type="checkbox" class="add_check_attr" data-key="'+k+'">'+
		              	'<i class="dark-white" ></i>'+
		              '</label>'+
		              '</td>'+
		              '<td>'+k+'</td>'+
		          '</tr>';
		      }else{
		      	str = '<tr>'+
		              '<td style="width: 5%">'+
		              '<label class="ui-check m-a-0">'+
		              '<input type="checkbox" checked class="add_check_attr" data-key="'+k+'">'+
		              	'<i class="dark-white" ></i>'+
		              '</label>'+
		              '</td>'+
		              '<td>'+k+'</td>'+
		          '</tr>';
		      }
  			
		  	$("#m-a-tab tbody").append(str);
  		});
  		
  });
   //  Thêm thuộc tính vào tab
	  add_attr_tab = null;
	  // Thêm input vào tab
	  function add_attr_tab_none(){
	  	str = '<div class="row">'+
	  	    		'<div class="col-sm-3">'+
	      	    		'<div class="form-group">'+
	      	    			'<input type="text" class="form-control attr_option_key" autocomplete="off">'+
	      	    		'</div>'+
	  	    		'</div>'+
	  	    		'<div class="col-sm-8">'+
	  	    			'<div class="form-group">'+
	      	    			'<input type="text" class="form-control attr_option_value" autocomplete="off">'+
	      	    		'</div>'+
	  	    		'</div>'+
	  	    		'<div class="col-sm-1" style="padding-left:0px">'+
	  	    			'<div class="form-group">'+
	      	    			'<button class="btn btn-sm warn pull-left ">'+
	      	    				'<i class="material-icons md-24 remove_row_attr">&#xe5cd;</i>'+
	      	    			'</button>'+
	      	    		'</div>'+
	  	    		'</div>'+
	  	    	'</div>';
	  		$('.list_attr_tab').append(str);
	  } 
	  $(document).on('click','.add_row_attr',function(){
	  		add_attr_tab_none();
      });
	  $(document).on('click','.remove_row_attr',function(){
	  		$(this).parent().parent().parent().parent().remove()
	  });
	  count_rank = null;
	  $(document).on('click','.add_attr_tab',function(e){
	  	    add_attr_tab =  this;
	  	    count_rank = $(this).next();
	  		$("#m-a-tab").modal('show');
	  		$(".list_attr_tab").html('');
	  		list = $(add_attr_tab).parent().next().val();

	  		if(list == ""){
	  			add_attr_tab_none();
	  			return false;
	  		}
	  		obj = JSON.parse(list);
	  		html = "";
	  		$.each(obj,function(i,v){
	  			str = '<div class="row">'+
	  	    		'<div class="col-sm-3">'+
	      	    		'<div class="form-group">'+
	      	    			'<input type="text" class="form-control attr_option_key" autocomplete="off" value="'+v.key+'">'+
	      	    		'</div>'+
	  	    		'</div>'+
	  	    		'<div class="col-sm-8">'+
	  	    			'<div class="form-group">'+
	      	    			'<input type="text" class="form-control attr_option_value" autocomplete="off"  value="'+v.value+'">'+
	      	    		'</div>'+
	  	    		'</div>'+
	  	    		'<div class="col-sm-1" style="padding-left:0px">'+
	  	    			'<div class="form-group">'+
	      	    			'<button class="btn btn-sm warn pull-left ">'+
	      	    				'<i class="material-icons md-24 remove_row_attr">&#xe5cd;</i>'+
	      	    			'</button>'+
	      	    		'</div>'+
	  	    		'</div>'+
	  	    	'</div>';
	  	    	html += str;
	  		});
	  		$('.list_attr_tab').html(html);
	  		add_attr_tab_none();
	  		return false
	  });
	
  	// thêm yt
	 $(document).on('click','#add_youtube',function(){
	 	str = '<div class="form-group link_youtube" >'+
	              '<input type="text" class="form-control" name="youtube[]" autocomplete="off" >'+
	              '<i class="material-icons md-20 close_yt">&#xe147;</i>'+
	            '</div>';
	    $("#add_youtube_containner").append(str);
	    load_masonry();
	 });
	  $(document).on('click','.close_yt',function(){
	 	$(this).parent().remove();
	 	load_masonry();
	 });
	  $(document).on('click','#d_product_related',function(e){
	  	e.preventDefault();
	  	id=$(this).data('id');
	  	$('#m-a-tab_related').modal('show');
	  	$('#search').on('keyup',function(e){
	      e.preventDefault();
	      var code = e.which;
	      value = $(this).val();
	        if($.trim(value)){
	            $.ajax({
	              headers: {
	                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
	              },
	              type:"post",
	              url:"{{route('add.related.product')}}",
	              data:{'key':value,'id':id},
	              success:function(data){
	                console.log(data);
	                if(data.status ==true ){
	                	$('#l-box1').html(data.html_search);
	                	if(data.pro.id){
	                		$('#l-box1').html("");
	                	}
	                }else{
	                	$('#l-box1').html("");
	                }
	                
	              },
	              cache:false,
	              dataType:'json'
	            });
	        }else{
	           
	        }
	    });
	  });
	c_related = 0;
	$(document).on('click', '.choose-product1', function(event) {
	  	event.preventDefault();
	  	id=$(this).val();
	  	container = this;
		$.ajax({
	        headers: {
	              'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
	        },
	        type:"post",
	        url:"{{route('checkbox.add.related')}}",
	        data:{'id':id},
	        success:function(data){
	          if(data.status == true){
	          	$('#d_popup_related').css('display','block');
	          	c_related += 1;
	          	id = data.product.id;
	          	c_ = $('#d_list_related > tr[data-id="'+id+'"]');
		          	if(c_.length > 0){
		            	$(container).parent().parent().parent().remove();
			       	}else{
			        	$('#d_list_related').append(data.html_check);
			        	$(container).parent().parent().parent().remove();
			        }
	          	d = $('#l-box1 > tr');
	        	if(d.length == 1){
	        		$('#search').val("");
	        		$('#d_none').css('display','none');
	        		$('#m-a-tab_related').modal('hide');
	        	}
	          }
	         
	        },
	        cache:false,
	        dataType:'json'
	    });
	});
	$(document).on('click','.del_related',function(){
      id = $(this).data('id');
      	$('#d-del_related_'+id).remove();
	  	e = $('#d_list_related > tr');
	  	console.log(e.length);
	  	if(e.length == 1){
	  		$('#d_popup_related').css('display','none');
	  	}
    });
  </script>
  <script>
  	function readURL2(input) {
    if (input.files && input.files[0]) {
    	filename = $('#file_upload').val().split('\\').pop();
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#file_preview').text(filename);
	            load_masonry();
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#file_upload").change(function(){
	    readURL2(this);
	});
  </script>

@endsection