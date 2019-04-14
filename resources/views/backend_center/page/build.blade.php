@extends('backend_center.layouts.defaultC')
@section('css')
	 <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2-bootstrap-theme/dist/select2-bootstrap.min.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('backend/libs/jquery/select2/dist/css/select2.min.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('summernote/dist/summernote.css') }}" type="text/css" />
	
	 <link rel="stylesheet" href="{{ asset('libs/bootstrap-tagsinput/bootstrap-tagsinput.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('backend/assets/styles/backend.css') }}" type="text/css" />
	 <link rel="stylesheet" href="{{ asset('backend/stag/css/stag.css') }}" type="text/css" />
	
	 <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
	 <style type="text/css">
	 	.add-attribute,.material-icons{cursor:pointer}.list-value,.none,.select2-search__field{display:none}h2{font-family:Roboto-Bold;font-size:10.5pt!important}div#myDropZone{width:100%;min-height:100px;background-color:#F0F0F0;border:1px solid #E7E7E7!important}.dz-message span{font-size:10pt!important;font-family:Roboto;color:#7F7F7F}.dz-remove{font-size:9pt!important}.dz-image{border-radius:0!important}option:disabled{background:#ddd}.select2-container .select2-selection--single{height:37px}.select2-selection__arrow{height:35px!important}.select2-search--dropdown{padding:0!important}.select2{width:100%!important;font-size:10pt}.select2-selection__rendered{font-size:10pt!important}.add-attribute{position:absolute;right:15px;top:10px;color:#738CEC}.modal-dialog{width:600px;margin:70px auto}.modal-content{border-radius:0}.modal-header{padding:12px 15px;border-bottom:1px solid #E7E7E7}.modal-title{font-size:10.5pt;font-family:"Roboto Bold"}.add-attr{background-color:#92D050;color:#fff;font-size:10pt;padding-top:5px;padding-bottom:5px;width:70px}.add-attr:hover{background-color:#92D050!important;color:#fff}.attr-item{position:relative}.list-value{position:absolute;background-color:#fff;border:1px solid #E7E7E7;width:100%;z-index:99;max-height:150px;overflow-y:scroll}.m-money,.seo_tags{position:relative}.autocomplete:hover,.autocomplete_tag:hover{background-color:#F0F0F0}.list-value div{padding:5px 10px}.autocomplete,.autocomplete_tag{font-family:Roboto;font-size:9pt;padding:7px 10px}.add_attr_tab{color:#738CEC}.attr-item .bootstrap-tagsinput span,.seo_tags .bootstrap-tagsinput span{background-color:rgba(0,0,0,0)!important;border:1px solid transparent!important}.attr-item .bootstrap-tagsinput{padding:4px 10px}.attr-item .bootstrap-tagsinput span[data-role=remove]{color:#bfbfbf!important;margin-left:0!important}.attr-item .bootstrap-tagsinput span,.attr-item .bootstrap-tagsinput span[data-role=remove]:hover{color:#404040!important}.attr-item .bootstrap-tagsinput .label{padding:2px 0!important}.attr-item .bootstrap-tagsinput input{padding-left:0;min-height:1em}.seo_tags .bootstrap-tagsinput{padding:4px 10px}.seo_tags .bootstrap-tagsinput span[data-role=remove]{color:#bfbfbf!important;margin-left:0!important}.seo_tags .bootstrap-tagsinput span,.seo_tags .bootstrap-tagsinput span[data-role=remove]:hover{color:#404040!important}.seo_tags .bootstrap-tagsinput .label{padding:2px 0!important}.seo_tags .bootstrap-tagsinput input{padding-left:0;min-height:1em}.m-money .m-tooltip,.m-money1 .m-tooltip{height:28px;width:auto;padding-top:4px;padding-left:10px;padding-right:10px;font-family:Roboto;font-size:10pt;z-index:9999;background-color:#000;color:#fff;top:60px}.modal-content{border:0}.m-money1:hover .m-tooltip,.m-money:hover .m-tooltip{display:block}.m-money .m-tooltip{position:absolute;border:1px solid #E7E7E7;border-bottom:0;border-radius:6px}.m-money .m-tooltip:after{content:"";position:absolute;bottom:100%;left:50%;margin-left:-5px;border-width:5px;border-style:solid;border-color:transparent transparent #000}.m-money1{position:relative}.m-tooltip{display:none}.m-money1 .m-tooltip{position:absolute;border:1px solid #E7E7E7;border-bottom:0;border-radius:6px}.m-money1 .m-tooltip:after{content:"";position:absolute;bottom:100%;left:50%;margin-left:-5px;border-width:5px;border-style:solid;border-color:transparent transparent #000}#add_youtube{position:absolute;right:15px;top:10px;color:#738CEC}.link_youtube{position:relative}.alert{margin-top:20px;margin-bottom: 0px;}
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
			/*.splq tr:nth-child(2) td, .splq tr:nth-child(4) td, .splq tr:nth-child(6) td, .splq tr:nth-child(8) td, .splq tr:nth-child(10) td {
				background-color: #f6f6f6;
			}*/
	</style>
@endsection
@section('content')
<form ui-jp="parsley" method="post" action="{{ route('build.center.post') }}" enctype="multipart/form-data" id="form-add-product">
<div class="app-header white box-shadow">
<div class="navbar">
		<div style="float:left;" class="title_form">
	      <p>Gửi công trình</p>
	    </div>
    	<div style="float:right;margin-top:10px;">
    
    	<button  type="submit" name="submit" value="save" class="btn" style="
    	padding-bottom: 8px;padding-top: 8px;font-size: 10pt;margin-right: 10px;font-family: 'Roboto-Bold';
    	min-width:100px; background-color:#F2F2F2">GỬI</button>
		
		</div>
    <!-- / navbar collapse -->
</div>
</div>
	 <div class="app-body" id="view">
	 	<div class="padding" style="padding-top:0px !important; padding-bottom:0px;">
	 		@include('backend_center.partials._messagesC')
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

				    <!-- End item -->
				    <!-- Begin Item Nhãn -->
				    <div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Thông tin cơ bản</h2></div>
				          <div class="box-body">
							<div class="row">
								<div class="col-sm-12" style="">
									<div class="form-group">
						              <label>Tên công trình</label>
						              <input type="text" class="form-control" name="name" autocomplete="off" value="" >
						            </div>

						            <div class="form-group">
						              <label>Địa chỉ</label>
						              <input type="text" class="form-control" name="address" autocomplete="off" value="" >
						            </div>

						            <div class="form-group">
						              <label>Điện thoại</label>
						              <input type="text" class="form-control" name="phone" autocomplete="off" value="" >
						            </div>
						            
						            <div class="form-group">
						              <label>Khách hàng</label>
						              <input type="text" class="form-control" name="customer" autocomplete="off" value="" >
						            </div>
								</div>
				         	</div>	 
		                  </div>
				        </div>
				    </div>
				    <!-- End item -->
				    
				    
				    <div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Mô tả chi tiết</h2></div>
				          <div class="box-body">
							<div class="row">
									<div class="col-sm-12">
										
							           	<ul class="nav nav-sm nav-pills nav-active-primary clearfix" id="list_tab_title">
										    <!-- <li class="nav-item">
										      <a class="nav-link active" id="default_tab" href data-toggle="tab" data-target="#tab_1">Tab 1</a>
										    </li>
										    <li class="nav-item">
										      <a class="nav-link" href="#" id="add_tab">Thêm tab</a>
										    </li> -->
										</ul>
										
										<div class="tab-content" id="list_tab_content">      
										    <div class="tab-pane p-v-sm active" id="tab_1">
										      <div class="box m-t p-a-sm">
										      	<!-- <div class="form-group">
									              <label>Tên thẻ tab</label>
									              <input type="text" class="form-control i_name" data-tab="1" name="post_name[]" value="Tab 1">
									            </div> -->
									            <div class="form-group">
									              
									              <textarea  id="editor_1" class="form-control" rows="5" name="post_content"></textarea>
									            </div>
									          </div>
									          
										    </div>
										</div>       	
				          			</div> 
				        	 </div>	 	
		                  </div>
				        </div>
				    </div> 
				    <!-- End Item -->
				    <!-- Begin Item youtube -->
				    <div class="col-sm-6 item">
				        <div class="box">
				          <div class="box-header"><h2>Video Youtube</h2>
				          <i class="material-icons md-24" id="add_youtube">&#xe147;</i>
				          </div>
				          <div class="box-body">
							<div class="row">
								<div class="col-sm-12" id="add_youtube_containner">
									
								</div>
							</div>
						  </div>
						</div>
					</div>
					
					<!-- End item -->
			 	</div>
	 </div>
</form>


@stop
@section('js-footer')
  <?php   $font_default = App\Item::where('key_item', 'font_default')->first();
           $font_custom = App\Item::where('key_item', 'font_custom')->first();
   ?>
  <script src="{{ asset('backend/libs/jquery/screenfull/dist/screenfull.min.js') }}"></script>
  <script src="{{ asset('backend/libs/jquery/select2/dist/js/select2.min.js') }}"></script>
  <script src="{{ asset('summernote/dist/summernote.min.js') }}"></script>
  <script src="{{ asset('summernote/dist/lang/summernote-vi-VN.js') }}"></script>
  <script src="{{ asset('libs/bootstrap-tagsinput/bootstrap-tagsinput.min.js') }}"></script>
  <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
  <script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
  <script src="{{ asset('backend/stag/js/stag.js') }}"></script>
  <script type="text/javascript">
   		submit = 0;
   		$(document).on('mouseenter',"button[type=submit]",function(){
   			submit = 1;
   		});
   		$(document).on('mouseleave',"button[type=submit]",function(){
   			submit = 0;
   		});	
   		$(document).on('submit','#form-add-product',function(e){
   			if(submit ==0){
   				e.preventDefault();
   			}
		});
   		
   		setInterval(function(){
   			load_masonry();
   		},1000);
   		
  </script>
  <script>
	$(function() {
		Dropzone.autoDiscover = false;
	    $("div#myDropZone").dropzone({
	    		maxFiles:6,
	    		maxfilesexceeded:function(file){
	    			 this.removeFile(file);
	    		},
		        url : "{{route('quan-tri.upload.up-img.center')}}",
	            addRemoveLinks : true,
			    maxFilesize: 5,
			    dictDefaultMessage: 'Ảnh chi tiết ',
			    dictResponseError: 'Error uploading file!',
			    headers: {
			        'X-CSRF-Token': '{{ csrf_token() }}'
			    },
			    error: function (file, response) {
			       load_masonry();
			    },
			    success: function (file, response) {
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
				    	console.log(1);
				    	setTimeout(function(){
				  			load_masonry();
				  		},200);
				    }
				 }
	    });
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
   
	
	 function load_masonry(){
	      var $container = $('.masonry-container');
	      $container.masonry({
	        columnWidth: '.item',
	        itemSelector: '.item'
	      });   
	  }
	  load_masonry();
	  setTimeout(function(){
			load_masonry();
	  },500);

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

	 
  </script>
@endsection