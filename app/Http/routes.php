<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/


//domain
Route::group(['domain' => '{account}.thietkewebuytinhanoi.com'], function () {
    Route::get('/',['as'=>'domain','uses'=>'frontend\DomainController@index']);
});
Route::post('/ajax-pagination-cate-domain',['as'=>'ajax.pagination.cate.domain','uses'=>'frontend\DomainController@AjaxPaginationCate']);
Route::get('/ajax-pro-domain',['as'=>'ajax.pro.domain','uses'=>'frontend\DomainController@ajaxproiddomain']);
Route::get('/ajax-pro-cate-domain',['as'=>'ajax.pro.cate.domain','uses'=>'frontend\DomainController@ajaxproidcate']);
Route::get('/san-pham-domain/chi-tiet-san-pham/{slug}-{id}',['as'=>'getProDetaildomain','uses'=>'frontend\DomainController@getProDetail']);
Route::get('/danh-muc-san-pham-domain/{slug}-{id}',['as'=>'get.Categorydomain','uses'=>'frontend\DomainController@getCategory']);
Route::get('/tim-kiem-domain',['as'=>'domain.search.frame','uses'=>'frontend\DomainController@getSearch']);
Route::get('/ajax-pro-searchdomain',['as'=>'ajax.pro.search.domain','uses'=>'frontend\DomainController@AjaxProSearch']);
Route::post('/ajax-pagination-searchdomain',['as'=>'ajax.pagination.search.domain','uses'=>'frontend\DomainController@AjaxPaginationSearch']);

//filterdomain
Route::post('/load-filter-frontenddomain',['as'=>'load.filter.frontenddomain','uses'=>'frontend\domainFilterController@LoadFilter']);
Route::post('/load-filter-click-frontenddomain',['as'=>'load.filter.click.frontenddomain','uses'=>'frontend\domainFilterController@ClickFilter']);
Route::post('/load-filter-searchdomain',['as'=>'load.filter.searchdomain','uses'=>'frontend\domainFilterController@LoadFilterSearch']);
Route::post('/load-filter-click-searchdomain',['as'=>'load.filter.click.searchdomain','uses'=>'frontend\domainFilterController@load_filter_click_search']);
Route::post('/load-filter-click-search-paginatedomain',['as'=>'load.filter.click.search.paginatedomain','uses'=>'frontend\domainFilterController@load_filter_click_search_paginate']);

//phan quyen csdl
Route::get('/test',['as'=>'test','uses'=>'backend\DevController@test']);

 // Frontend
/*-------------------------------------------------------------------------------------------------------------*/
Route::get('/',['as'=>'home','uses'=>'frontend\PagesController@getHome']);
Route::get('/san-pham/chi-tiet-san-pham/{slug}-{id}',['as'=>'getProDetail','uses'=>'frontend\PagesController@getProDetail']);

//story
Route::get('/ajaxstory',['as'=>'ajax.story','uses'=>'frontend\PagesController@story']);
##
//blog
Route::get('/blog',['as'=>'frontend.blog','uses'=>'frontend\PagesController@blog']);
Route::get('/blog/danhmuc/{slug}-{id}',['as'=>'frontend.blog.cate','uses'=>'frontend\PagesController@blogcate']);
Route::get('/blog/tag/{slug}-{id}',['as'=>'frontend.blog.tag','uses'=>'frontend\PagesController@blogtag']);
Route::post('/ajaxpagiblog',['as'=>'ajax.pagination.blog','uses'=>'frontend\PagesController@blogpagi']);
Route::post('/ajaxpagiblogcate',['as'=>'ajax.pagination.blogcate','uses'=>'frontend\PagesController@blogcatepagi']);
Route::post('/ajaxpagiblogtag',['as'=>'ajax.pagination.blogtag','uses'=>'frontend\PagesController@blogtagpagi']);
##
Route::get('/bai-viet/chi-tiet-bai-viet/{slug}-{id}',['as'=>'Get.Blog.Detail','uses'=>'frontend\PagesController@GetBlogDetail']);
Route::get('/danh-muc-san-pham/{slug}-{id}',['as'=>'get.Category','uses'=>'frontend\PagesController@getCategory']);
//tim kiem sp
Route::get('/tim-kiem',['as'=>'frontend.search.frame','uses'=>'frontend\PagesController@getSearch']);
#############
Route::get('/ajax-pro',['as'=>'ajax.pro.id','uses'=>'frontend\PagesController@ajaxproid']);
Route::get('/ajax-pro-cate',['as'=>'ajax.pro.id.cate','uses'=>'frontend\PagesController@ajaxproidcate']);
Route::get('/ajax-pro-search',['as'=>'ajax.pro.search','uses'=>'frontend\PagesController@AjaxProSearch']);


Route::get('/ajax-youtube-pro',['as'=>'ajax.youtube.id','uses'=>'frontend\PagesController@ajaxYoutubeid']);
Route::get('/ajax-video-pro',['as'=>'ajax.video.id','uses'=>'frontend\PagesController@ajaxvideoid']);
Route::post('/popup-dowload-file',['as'=>'popup.dowload.file','uses'=>'frontend\PagesController@GetPopupDowload']);
Route::post('/submit-dowload-file',['as'=>'submit.dowload.file','uses'=>'frontend\PagesController@SubmitPopupDowload']);
Route::get('/submit-dowload-file2',['as'=>'submit.dowload.file2','uses'=>'frontend\PagesController@SubmitPopupDowload2']);

// Bắt buộc phải có 
Route::get('/san-pham/{id}/{slug}',['as' => 'frontend.san-pham.slug','uses' => 'PageController@getChitietSanphamSlug']);

// Bắt buộc phải có 
Route::get('/bai-viet/{id}/{slug}',['as' => 'frontend.bai-viet.slug','uses' => 'PageController@getBaiViet']);

//tag pro
Route::post('/ajax-tag-pro',['as'=>'ajax.tag.pro','uses'=>'frontend\PagesController@ajaxTagPro']);
Route::post('/art-to-cart',['as'=>'art.to.cart','uses'=>'frontend\PagesController@ArtToCart']);
Route::post('/select-to-cart',['as'=>'select.to.cart','uses'=>'frontend\PagesController@SelectToCart']);
Route::post('/remove-to-cart',['as'=>'remove.to.cart','uses'=>'frontend\PagesController@RemoveToCart']);
Route::post('/submit-order',['as'=>'submit.order','uses'=>'frontend\PagesController@SubmitOrder']);
Route::post('/ajax-popup-binhluan',['as'=>'ajax.popup.binhluan','uses'=>'frontend\PagesController@PopupBinhluan']);
Route::post('/ajax-sm-binhluan',['as'=>'ajax.sm.binhluan','uses'=>'frontend\PagesController@SMPopupBinhluan']);
Route::post('/ajax-popup-luotmua',['as'=>'ajax.popup.luotmua','uses'=>'frontend\PagesController@PopupLuotMua']);
Route::post('/ajax-popup-luotmua-ti',['as'=>'ajax.active.contructs','uses'=>'frontend\PagesController@AjaxActive']);
Route::post('/ajax-popup-dactinh',['as'=>'ajax.popup.dactinh','uses'=>'frontend\PagesController@PopupDacTinh']);
Route::post('/ajax-popup-daily',['as'=>'ajax.popup.daily','uses'=>'frontend\PagesController@PopupDaily']);
Route::post('/ajax-binhluan',['as'=>'ajax.binhluan','uses'=>'frontend\PagesController@AjaxBinhluan']);
Route::post('/ajax-luotmua',['as'=>'ajax.luotmua','uses'=>'frontend\PagesController@AjaxLuotMua']);
Route::post('/ajax-dactinh',['as'=>'ajax.dactinh','uses'=>'frontend\PagesController@AjaxDacTinh']);
Route::post('/ajax-daily',['as'=>'ajax.daily','uses'=>'frontend\PagesController@AjaxDaiLy']);

Route::post('/ajax-dagfdgfdily',['as'=>'upload.img.congtrinh','uses'=>'frontend\PagesController@UploadImgCongtrinh']);
Route::post('/ajax-hgfjhdagfdgfdily',['as'=>'sm.baocao.daily','uses'=>'frontend\PagesController@SmBaoCaoDaiLy']);
Route::post('dgfhgh',['as'=>'ajax.footer.check.agency','uses'=>'frontend\PagesController@AjaxCheckAgency']);


Route::post('/ajax-ewgfdgdg',['as'=>'tracuu.baohanh','uses'=>'frontend\PagesController@AjaxTraCuuBaoHanh']);
Route::post('/ajax-gkajhdlh',['as'=>'ajax.sm.hethang','uses'=>'frontend\PagesController@AjaxHetHang']);
Route::post('/ajax-gkajhdlh-ghjk',['as'=>'ajax.sm.dangki.daili','uses'=>'frontend\PagesController@AjaxDangKiDaiLi']);

Route::post('/ajax-share-facebook',['as'=>'ajax.share.facebook','uses'=>'frontend\PagesController@AjaxShareFacebook']);

Route::post('/submit-tracuu',['as'=>'submit.tracuu','uses'=>'frontend\PagesController@SubmitTracuu']);
Route::post('/ajax-pagination-cate',['as'=>'ajax.pagination.cate','uses'=>'frontend\PagesController@AjaxPaginationCate']);
Route::post('/ajax-pagination-search',['as'=>'ajax.pagination.search','uses'=>'frontend\PagesController@AjaxPaginationSearch']);

Route::post('/load-filter-frontend',['as'=>'load.filter.frontend','uses'=>'frontend\FilterController@LoadFilter']);
Route::post('/load-filter-click-frontend',['as'=>'load.filter.click.frontend','uses'=>'frontend\FilterController@ClickFilter']);

//search
Route::post('/load-filter-search',['as'=>'load.filter.search','uses'=>'frontend\FilterController@LoadFilterSearch']);
Route::post('/load-filter-click-search',['as'=>'load.filter.click.search','uses'=>'frontend\FilterController@load_filter_click_search']);
Route::post('/load-filter-click-search-paginate',['as'=>'load.filter.click.search.paginate','uses'=>'frontend\FilterController@load_filter_click_search_paginate']);

// Backend
/*-------------------------------------------------------------------------------------------------------------*/
Route::get('quan-tri/dang-nhap',['as' => 'quan-tri/dang-nhap','uses' => 'backend\LoginController@getLogin']);
Route::post('quan-tri/dang-nhap',['as' => 'quan-tri/post-dang-nhap','uses' =>'backend\LoginController@postLogin']);
Route::get('quan-tri/dang-xuat',['as' => 'quan-tri/dang-xuat','uses' => 'backend\LoginController@getLogout']);

Route::group(['prefix'=>'quan-tri', 'middleware'=>'permission'],function(){	
		Route::get('/', array('as'=>'admin.home', 'uses'=> 'backend\BackendController@index'));
		Route::get('/backend-create-sitemap',['as' => 'create.sitemap','uses' => 'backend\BackendController@getCreatesitemap']);
		Route::group(['prefix'=>'/quan-tri-vien'],function(){

		});
		Route::group(['prefix'=>'/bai-viet'],function(){
			// Thêm một bài viết mới
			Route::get('/them-bai-viet', array('as'=>'posts.add', 'permissions'=>array('dang_bai_viet', 'luu_bai_viet'), 'uses'=>'backend\PostController@create_post'));
			// Chỉnh sửa bài viết 
			Route::get('/chinh-sua-bai-viet/{id}', array('as'=>'posts.edit', 'permissions'=>'sua_bai_viet', 'uses'=>'backend\PostController@edit_post'));
			// Nhận request thêm bài viết
			Route::post('/them-bai-viet', array('as'=>'ppostt_posts.add', 'uses'=>'backend\PostController@post_create_post'));
			// Hiển thị danh sách tất cả bài viết
			Route::get('/', array('as'=>'posts.list', 'uses'=>'backend\PostController@index_post'));
			//xoa tab content
			Route::post('/xoa-tab-content',['as'=>'xoa.content.tab', 'uses'=>'backend\PostController@xoa_tab']);

			Route::post('/sua-bai-viet', ['as'=>'update.post', 'uses'=>'backend\PostController@update_post']);
			Route::post('/xoa-bai-viet', ['as'=>'del.post', 'permissions'=>'xoa_bai_viet', 'uses'=>'backend\PostController@del_post']);
			// đăng kí thêm một danh mục 
			Route::get('/them-danh-muc', array('as'=>'category.add', 'permissions'=>'them_danh_muc_bai_viet', 'uses'=>'backend\PostController@create_category'));
			// Nhận Form thêm danh mục
			Route::post('/them-danh-muc', array('as'=>'category.post_add', 'uses'=>'backend\PostController@post_create_category'));
			// hiển thị blade Chỉnh sửa một danh mục
			Route::get('/chinh-sua-danh-muc/{id}', array('as'=>'category.edit', 'permissions'=>'sua_danh_muc_bai_viet', 'uses'=>'backend\PostController@edit_category'));
			Route::post('/chinh-sua-danh-muc/askdfhaksdhfkasj/asdkfjhaskdfj', array('as'=>'form_category.edit', 'uses'=>'backend\PostController@formsavecate'));
            // xoa danh muc
			Route::post('xoa-danh-muc', ['as'=>'cate.del', 'permissions'=>'xoa_danh_muc_bai_viet', 'uses'=>'backend\PostController@del_category']);
			// Hiện danh sách bài viết trong danh mục
			Route::get('/danh-sach-bai-viet/{id}', array('as'=>'category.detail', 'uses'=>'backend\PostController@post_in_cate'));
			// Hiện danh sách tất cả danh mục
			Route::get('/danh-sach-danh-muc', array('as'=>'category.list', 'uses'=>'backend\PostController@list_category'));
			// Quản lý comment sản phẩm
			Route::get('/quan-ly-comment', ['as' => 'comments.post.list',  'permissions'=>'quan_ly_binh_luan_bai_viet', 'uses' => 'backend\CommentController@listCommentPost']);
			// Quản lý comment sản phẩm
			Route::get('/quan-ly-comment/da-duyet', ['as' => 'comments.post.list.done', 'permissions'=>'quan_ly_binh_luan_bai_viet', 'uses' => 'backend\CommentController@listCommentPostDone']);
			// Xóa Comment 
			Route::post('/quan-ly-comment/xoqwertyuityuio', ['as' => 'comments.post.delete', 'uses' => 'backend\CommentController@deleteCommentPost']);
			// Duyệt Comment 
			Route::post('/quan-ly-comment/duyetqwertyuio', ['as' => 'comments.post.accept', 'uses' => 'backend\CommentController@acceptCommentPost']);
		});
		Route::group(['prefix'=>'/menu'], function(){
			Route::get('/danh-sach-menu', ['as'=>'menu.list', 'uses'=>'backend\MenuController@index']);	
			Route::get('/tao-menu',['as'=>'menu.add', 'permissions'=>'tao_menu', 'uses'=>'backend\MenuController@create']);
			Route::post('order-menu',array('as'=>'menu.orderby', 'permissions'=>'sua_menu', 'uses'=>'backend\MenuController@ordermenu'));
            Route::post('xoa-menu',array('as'=>'menu.del', 'permissions'=>'xoa_menu', 'uses'=>'backend\MenuController@del_menu'));
			Route::post('/tao-menu-post',['as'=>'menu.post_add', 'uses'=>'backend\MenuController@store']);
			//nhận form tạo menu
			// hiển thị blade Chỉnh sửa một danh mục
			Route::get('/chinh-sua-menu/{id}', array('as'=>'menu.edit', 'permissions'=>'sua_menu', 'uses'=>'backend\MenuController@edit_menu'));
			Route::post('chinh-sua-menu-post',array('as'=>'menu.edit.post', 'uses'=>'backend\MenuController@post_edit_menu'));
			
			// sắp xếp lại menu 
			Route::post('/sap-xep-menu',['as'=>'menu.sap-xep', 'uses'=>'backend\MenuController@Sapxep']);
			//tìm kiếm tag
			Route::post('/tim-kiem-tag/', array('as'=>'tag.post.search', 'uses'=>'backend\PostController@post_search_tag'));
		});
		Route::group(['prefix'=>'/quan-ly-slide'], function(){
			Route::get('/slide/{id}', ['as'=>'slide.manage', 'uses'=>'backend\SlideController@index']);	
			Route::get('/them-anh-vao-slide/{id}', ['as'=>'slide.add', 'permissions'=>'them_slide', 'uses'=>'backend\SlideController@addImg']);	
			Route::get('/chinh-sua-slide/{slide_type_id}/{slide_id}', ['as'=>'slide.edit', 'permissions'=>'sua_slide', 'uses'=>'backend\SlideController@editSlide']);	
			Route::post('/slide/QOIQMAMNDKPQPOIE', ['as'=>'slide.post_add', 'uses'=>'backend\SlideController@formAdd']);	
			Route::post('/slide/qeouoiasl/QOIQMAMNDKPQPOIE', ['as'=>'slide.post_save', 'uses'=>'backend\SlideController@formSave']);	
			Route::post('/slide/qeouoiasl/QOIQMAMNDKPQPaaaaaaaaaOIE', ['as'=>'del.slide', 'permissions'=>'xoa_slide', 'uses'=>'backend\SlideController@delSlide']);	
			Route::post('/fsfsdfsaaafdfd-sdffsdf', ['as'=>'slide.check', 'permissions'=>'sua_slide', 'uses'=>'backend\SlideController@SlideCheck']);
		});
		Route::group(['prefix'=>'/upload'],function(){
			Route::post('/anh', ['as'=>'quan-tri/dang-anh', 'uses'=>'backend\PostController@uploadImg']);
			Route::post('/up-img', ['as'=>'quan-tri.upload.up-img', 'uses'=>'backend\UploadController@uploadImage']);
		});
		 //quan ly tags
		Route::group(['prefix'=>'tags'], function(){
			Route::post('/get_list_tag_ajax', array('as'=>'get_list_tag_ajax', 'uses'=>'backend\TagController@getTag_Ajax'));

            Route::get('quan-ly-tag', ['as'=>'tags.list', 'uses'=>'backend\TagController@index']);
            Route::get('sua-tag/{id}', ['as'=>'tags.edit', 'uses'=>'backend\TagController@edit']);
            Route::get('/danh-sach-tag/{id}', array('as'=>'tags.detail.cate', 'uses'=>'backend\TagController@tag_in_cate'));
            Route::post('update-tag', ['as'=>'tags.edit.post', 'uses'=>'backend\TagController@update']);
            Route::post('xoa-tag', ['as'=>'tags.del', 'uses'=>'backend\TagController@deltag']);

            Route::get('tag-san-pham',['as'=>'tags.product.list','uses'=>'backend\TagController@TagsProduct']);
            Route::get('/danh-sach-tag-san-pham/{id}', array('as'=>'product.tags.detail.cate', 'uses'=>'backend\TagController@tag_in_product'));
            Route::get('sua-tag-product/{id}', ['as'=>'tags.product.edit', 'uses'=>'backend\TagController@productedit']);
            Route::post('update-tag-product', ['as'=>'tags.product.edit.post', 'uses'=>'backend\TagController@productupdate']);
            Route::post('xoa-tag-product', ['as'=>'tags.product.del', 'uses'=>'backend\TagController@productdeltag']);
		});
		
		Route::group(['prefix'=>'/dev', 'permissions'=>'dev'],function(){
				Route::get('/layout-add-group', ['as'=>'layout.add-group', 'uses'=>'backend\DevController@addGroup']);
				
				Route::get('/layout-list-group', ['as'=>'layout.list-group', 'uses'=>'backend\DevController@listGroup']);
				Route::post('/layout-qwertyuioist-group', ['as'=>'layout.group.post_add', 'uses'=>'backend\DevController@createGroup']);
				Route::post('/layout-qwertyuioist-grdffdserqrdoup', ['as'=>'layout.layout.post_add', 'uses'=>'backend\DevController@createLayout']);
				Route::post('/layoutdddaa-qwertyuioist-grdffdserqrdoup', ['as'=>'layout.layout.post_pattern', 'uses'=>'backend\DevController@createPattern']); 
				Route::get('/layout-group/{id}', ['as'=>'layout.view', 'uses'=>'backend\DevController@index']);	
				Route::get('/layout/{id}', ['as'=>'layout.config', 'uses'=>'backend\DevController@config']);	
				Route::get('/duplicate/{id}', ['as'=>'layout.duplicate', 'uses'=>'backend\DevController@duplicate']);	
				// Hiển thị danh mmục
				Route::get('/danh-sach-danh-muc', array('as'=>'dev.list.category', 'uses'=>'backend\DevController@list_category'));

				Route::get('/danh-sach-danh-muc-san-pham', array('as'=>'dev.list.category.product.super', 'uses'=>'backend\DevController@list_category_product')); 

				Route::post('/dev-editable',array('as'=>'dev.editable', 'uses'=>'backend\DevController@editable'));
				Route::post('/dev-editable-product',array('as'=>'dev.editable.product', 'uses'=>'backend\DevController@editableProduct'));
				
				Route::post('/dev-sfsfsdfsd-dsfsd',array('as'=>'dev.check', 'uses'=>'backend\DevController@changelink'));
				Route::get('/dev-slide', ['as'=>'dev.slide', 'uses'=>'backend\DevController@slide']);
				Route::post('/dev-sfsfsdfsd-ddddjkskeiruwosfsd',array('as'=>'layout.dev.slide_add', 'uses'=>'backend\DevController@addslide'));
                //Dev Form
                Route::get('/dev-form', ['as'=>'dev.form', 'uses'=>'backend\DevController@form']);
                Route::get('/dev-thumbnail', ['as'=>'dev.thumbnail', 'uses'=>'backend\DevController@thumbnail']);
                Route::post('/dev-thumbnail', ['as'=>'dev.thumbnail.post', 'uses'=>'backend\DevController@thumbnailPost']);
                Route::get('/thumb-product-auto', ['as'=>'create.thumbnail.auto', 'uses'=>'backend\DevController@refresh_thumb_all']);
                Route::get('/thumb-post-auto', ['as'=>'create.thumbnail.auto.post', 'uses'=>'backend\DevController@refresh_thumb_all_post']);

                Route::post('/dev-dfsdfsdf-sfsfsdfsd-ddddjkskeiruwosfsd',array('as'=>'dev.form.post', 'uses'=>'backend\DevController@form_post'));
                Route::post('/dev-edit-form-type/{id}', ['as' => 'edit.form.types', 'uses' => 'backend\DevController@editFormType']);
                Route::post('/dev-form-kgjklsgdlk', ['as' => 'del.form.types', 'uses'=>'backend\DevController@DelFormType']);

				Route::get('/dev-abcef-gh', ['as' => 'dev.slides.list', 'uses' => 'backend\DevController@slide_add_in']);
				Route::post('/dev-del-kgjklsgdlk', ['as' => 'del.slide.types', 'uses'=>'backend\DevController@delSlideType']);
				Route::post('/dev-edit-slide-type/{id}', ['as' => 'edit.slide.types', 'uses' => 'backend\DevController@editSlideType']);

				Route::get('/he-thong', ['as'=>'admin.config', 'uses'=>'backend\DevController@config_system']);		
		    	Route::post('/he-thong-post', ['as'=>'admin.post.config', 'uses'=>'backend\DevController@config_system_update']);
				Route::post('/dev-add-item', ['as'=>'dev.add.item', 'uses'=>'backend\DevController@devadditem']);
				Route::get('/config-font', ['as'=>'admin.config.font', 'uses'=>'backend\DevController@config_fonts']);	
		    	Route::post('/config-font-post', ['as'=>'admin.config.fonts.post', 'uses'=>'backend\DevController@config_fonts_update']);
		    	// phân quyền
		    	Route::get('/danh-sach-phan-quyen', ['as'=>'admin.config.permission', 'uses'=>'backend\DevController@permission_list']);
		    	Route::post('/them-phan-quyen', ['as'=>'admin.config.add.permission', 'uses'=>'backend\DevController@add_permission']);
				// Frame config
				Route::get('/config-frame', ['as'=>'admin.config.frame', 'uses'=>'backend\DevController@config_frame']);
                Route::post('/cconfig-frame-post', ['as'=>'admin.config.frame.post', 'uses'=>'backend\DevController@config_frame_update']);
                Route::get('/phan-quyen-admin', ['as' => 'editor.user.add.admin', 'permissions'=>'phan_quyen_thanh_vien', 'uses' => 'backend\AdminController@add_permission_admin']);
		});
		
		Route::group(['prefix'=>'/layout'],function(){
			Route::get('/manage/{id}', ['as'=>'layout.manage', 'permissions'=>'sua_layout', 'uses'=>'backend\WidgetController@index']);	
			Route::get('/manage/layout/{id}', ['as'=>'layout.manage.config', 'uses'=>'backend\WidgetController@config']);	
			Route::get('/manage/edit/pattern/{id}', ['as'=>'layout.edit.partern', 'permissions'=>'sua_layout', 'uses'=>'backend\WidgetController@edit']);	
			Route::post('akhdsfkoiquerppdwoirk', ['as'=>'layout.formedit', 'uses'=>'backend\WidgetController@formedit']);
			Route::post('/fsfsdfsd-sdffsdf', ['as'=>'layout.update', 'uses'=>'backend\WidgetController@update']);	
			Route::post('/fsfsdfsd-sdffsdf/delete', ['as'=>'layout.delete', 'uses'=>'backend\WidgetController@deletelayoutItem']);	
		});
		Route::group(['prefix'=>'/lien-he'],function(){
			Route::get('/form/{id}', ['as'=>'form.manage', 'permissions'=>'xem_lien_he', 'uses'=>'backend\ContactController@index']);	
			Route::post('/del-form-qwertyu/dfghj', ['as'=>'form.del.ajax', 'uses'=>'backend\ContactController@delForm']);	
		});

        Route::group(['prefix'=>'/admin'],function(){
	    	Route::get('/thong-tin-ca-nhan', ['as'=>'admin.edit', 'uses'=>'backend\AdminController@index']);
	    	Route::post('/thong-sdfsdf-tin-ca-nhan', ['as'=>'admin.post.edit', 'uses'=>'backend\AdminController@updatecanhan']);

	    	Route::get('/thong-tin-he-thong', ['as'=>'admin.system.edit', 'uses'=>'backend\AdminController@indexsystem']);
	    	Route::post('/thong-sdfsdf-tin-he-thong', ['as'=>'admin.system.post.edit', 'uses'=>'backend\AdminController@update']);

	    	Route::get('/them-editor', ['as' => 'editor.add', 'permissions'=>'them_thanh_vien', 'uses' => 'backend\AdminController@editor']);
	    	Route::post('/post-them-editor', ['as' => 'post.editor.add', 'uses' => 'backend\AdminController@addEditor']);

	    	Route::get('/sua-editor/{id}', ['as' => 'editor.edit', 'permissions'=>'sua_thanh_vien', 'uses' => 'backend\AdminController@get_edit_editor']);
	    	Route::post('/post-sua-e/{id}', ['as' => 'post.editor.edit', 'uses' => 'backend\AdminController@post_edit_editor']);


			Route::get('/danh-sach-editor', ['as' => 'editor.list', 'uses' => 'backend\AdminController@listEditor']);
			Route::get('/them-phan-quyen-thanh-vien/{id}', ['as' => 'editor.user.add', 'permissions'=>'phan_quyen_thanh_vien', 'uses' => 'backend\AdminController@add_permission_user']);
			Route::post('/them-phan-quyen-thanh-vien-post-dfsfsd', ['as' => 'editor.user.add.permission', 'uses' => 'backend\AdminController@add_permission_user_post']);
			Route::post('/del-editor-abcd', ['as' => 'del.editor', 'uses' => 'backend\AdminController@delEditor']);
	    });	
	    Route::group(['prefix' =>'don-hang'], function(){
	     	Route::get('/them-don-hang',['as'=>'order.add','permissions'=>'them_don_hang','uses'=>'backend\OrderController@getOrderadd']);
	     	Route::get('/tim-don-hang', ['as'=>'order.search', 'uses' =>'backend\OrderController@search']);	
            Route::get('/chitiet/{id}', ['as'=>'order.show','uses' =>'backend\OrderController@show']);

            Route::get('/danh-sach', ['as'=>'order.list', 'uses' =>'backend\OrderController@index']);
            Route::get('/loai-don-hang/{id}', ['as'=>'order.type', 'uses' =>'backend\OrderController@list_type']);
            
            Route::post('status', ['as'=>'order.status', 'uses' =>'backend\OrderController@status']);
	     	Route::post('/them-don-hang',['as'=>'order.add','uses'=>'backend\OrderController@postOrderadd']);
            Route::post('/info-order/qwerty', ['as'=>'order.get.info', 'uses' =>'backend\OrderController@infoOrder']);
            Route::post('/submit-order/qwertyqwertyqwerty', ['as'=>'order.ajax.submit', 'uses' =>'backend\OrderController@saveOrder']);
            
            Route::post('/search/qwerty/ytrewq',['as'=>'order.search.add','uses'=>'backend\OrderController@postOrderSearchadd']);
            Route::post('/checkbox/qwertyqwerty',['as'=>'order.checkbox.add','uses'=>'backend\OrderController@postOrderCheckadd']);
            Route::post('/submit/qwertyqwerty',['as'=>'order.submit.add','uses'=>'backend\OrderController@postOrderadd']);
	   		Route::post('/show/qwertyqwerty',['as'=>'order.history','uses'=>'backend\OrderController@getHistory']);
	   		//config email thanh toan va bị hủy
            Route::post('/email-thanh-toan-bi-huy',['as'=>'ajax.form.email.thanh.toan','uses'=>'backend\OrderController@FormEmailThanhToan']);
            Route::post('/ajax-order-config-task',['as'=>'ajax.order.config.task','uses'=>'backend\OrderController@configTask']);
            Route::post('ajax-province',['as'=>'order.ajax.province','uses'=>'backend\OrderController@ajaxProvince']);
	     });
	    Route::group(['prefix'=>'frame'],function(){
             //Tạo Frame
             Route::get('create-frame/{id}',['as'=>'frame.create.frame','uses'=>'backend\FrameController@createFrame']);
             Route::post('create-frame-post',['as'=>'frame.create.frame.post','uses'=>'backend\FrameController@postFrame']);
             Route::post('ajax-list-frame',['as'=>'ajax.list.frame','uses'=>'backend\FrameController@ajaxListFrame']);
             Route::post('/xoa-frame', array('as'=>'frame.delete', 'uses'=>'backend\FrameController@del_frame_post'));
             Route::get('sua-frame/{id}',['as'=>'frame.edit.frame','uses'=>'backend\FrameController@editFrame']);
             Route::post('post-sua-frame',['as'=>'frame.edit.frame.post','uses'=>'backend\FrameController@editFramepost']);
         });
        Route::group(['prefix'=>'khach-hang'],function(){
         	Route::get('list-customer',['as'=>'list.customer','permissions'=>'thong_tin_khach_hang','uses'=>'backend\CustomerController@listCustomer']);
         	Route::post('list-customer-order',['as'=>'ajax.list.customer.order','uses'=>'backend\CustomerController@ajaxCustomerOrder']);
         	Route::post('list-customer-order-agency',['as'=>'ajax.list.customer.order.agency','uses'=>'backend\CustomerController@ajaxCustomerOrderAgency']);
         	//del configgiam giá
         	//tim kiem khach hang
         	Route::get('/tim-kiem-khach-hang',['as'=>'search.customer','uses'=>'backend\CustomerController@Search']);
		 	Route::post('/del-config-giamgia',['as'=>'config.giamgia.del','uses'=>'backend\CustomerController@DelConfigGiamGia']);
		 	//list
		 	Route::post('/list-config-discounts',['as'=>'ajax.list.config.discounts','uses'=>'backend\CustomerController@AjaxListDiscounts']);
		 	Route::post('/config-tichdiem',['as'=>'ajax.config.tichdiem','uses'=>'backend\CustomerController@ajaxConfigTichDiem']);
        });
        Route::group(['prefix'=>'/dai-ly'],function(){
        	Route::get('tim-kiem',['as'=>'search.dai.ly','uses'=>'backend\AgencyControlller@SearchAgency']);
        	Route::get('tim-kiem-san-pham/{slug}-{id}',['as'=>'search.list.frame.agency','uses'=>'backend\AgencyControlller@SearchListFrameAgency']);
        	Route::get('/danh-sach-dai-ly',['as'=>'list.dai.ly','uses'=>'backend\AgencyControlller@ListAgency']);
        	Route::get('/list-feedback',['as'=>'list.feedback','uses'=>'backend\AgencyControlller@ListFeeback']);
        	Route::get('/tim-kiem-bao-cao',['as'=>'search.feedback','uses'=>'backend\AgencyControlller@SearchFeedback']);
        	Route::get('/add-agency',['as'=>'add.agency','uses'=>'backend\AgencyControlller@AddAgency']);
        	Route::get('/edit-agency/{slug}-{id}',['as'=>'edit.agency','uses'=>'backend\AgencyControlller@EditAgency']);
        	Route::get('/san-pham-dai-ly/{slug}-{id}',['as'=>'frame.agency.list','uses'=>'backend\AgencyControlller@FrameAgencyList']);
        	
        	Route::get('/event',['as'=>'agency.list.event','uses'=>'backend\AgencyControlller@event']);
        	Route::get('/event-create',['as'=>'agency.create.event','uses'=>'backend\AgencyControlller@createEvent']);
        	Route::post('/event-create/submit',['as'=>'agency.create.event.post','uses'=>'backend\AgencyControlller@createEventPost']);
        	
        	Route::post('/rydtfuyghjk',['as'=>'ajax.search.frame.agency','uses'=>'backend\AgencyControlller@AjaxSearchFrameAgency']);
        	Route::post('/rydtghjk/ghkjlk',['as'=>'submit.frame.agency','uses'=>'backend\AgencyControlller@SubmitFrameAgency']);
        	Route::post('/rydtghjk/ghkjlk/fghjk',['as'=>'del.frame.agency','uses'=>'backend\AgencyControlller@DelFrameAgency']);
        	// feedback
        	Route::post('feedback1',['as'=>'ajax.feedback1.detail','uses'=>'backend\AgencyControlller@Feedback1']);
        	Route::post('feedback2',['as'=>'ajax.feedback2.detail','uses'=>'backend\AgencyControlller@Feedback2']);
        	Route::post('feedback3',['as'=>'ajax.feedback3.detail','uses'=>'backend\AgencyControlller@Feedback3']);
        	Route::post('feedback4',['as'=>'ajax.feedback4.detail','uses'=>'backend\AgencyControlller@Feedback4']);
        	Route::post('feedback5',['as'=>'ajax.feedback5.detail','uses'=>'backend\AgencyControlller@Feedback5']);
        	Route::post('get-feed-back',['as'=>'ajax.get.feedback.logs','uses'=>'backend\AgencyControlller@getFeedBackLogs']);

        	Route::post('/post-create-agency',['as'=>'post.create.agency','uses'=>'backend\AgencyControlller@PostCreateAgency']);
        	Route::post('/post-edit-agency',['as'=>'post.edit.agency','uses'=>'backend\AgencyControlller@PostEditAgency']);
        	Route::post('/del-agency',['as'=>'del.agency','uses'=>'backend\AgencyControlller@DelAgency']);
        	Route::post('/ajax-change-status',['as'=>'change.status.agency','uses'=>'backend\AgencyControlller@ChangeAgency']);
        	Route::post('/ajax-edit-sku-frame-agency',['as'=>'ajax.edit.frame.agency.sku','uses'=>'backend\AgencyControlller@AjaxEditFrameAgencySku']);
        	Route::post('/change-agency-percent',['as'=>'change.agency.percent','uses'=>'backend\AgencyControlller@ChangeAgencyPercent']);
        	Route::post('/change-event-agency',['as'=>'change.agency.event','uses'=>'backend\AgencyControlller@ChangeAgencyEvent']);
        	Route::post('/change-event-status',['as'=>'change.status.event','uses'=>'backend\AgencyControlller@ChangeStatusEvent']);
        	Route::post('/clear-event-status',['as'=>'clear.status.event','uses'=>'backend\AgencyControlller@ClearStatusEvent']);
        	Route::post('/active-event-status-vivandi',['as'=>'active.event.vivandi','uses'=>'backend\AgencyControlller@ActiveEventVivandi']);
        	
        	//congtrinh
        	Route::get('/danh-sach-cong-trinh',['as'=>'list.cong.trinh','uses'=>'backend\ContructController@ListContruct']);
        	//timkiemcongtrinh
        	Route::get('/timkiem-congtrinh',['as'=>'search.cong.trinh','uses'=>'backend\ContructController@SearchContruct']);
        	Route::get('/edit-congtrinh/{id}',['as'=>'edit.contruct','uses'=>'backend\ContructController@getEditContruct']);
        	Route::post('/post-edit-congtrinh',['as'=>'post.edit.contruct','uses'=>'backend\ContructController@postEditContruct']);
        	Route::get('/san-pham-cong-trinh/{id}',['as'=>'frame.contruct','uses'=>'backend\ContructController@FrameContructList']);
        	Route::post('/ajaxsearchframecontruct',['as'=>'ajax.search.frame.contruct','uses'=>'backend\ContructController@AjaxSearchFrameContruct']);
        	Route::post('/submitframecontruct',['as'=>'submit.frame.contruct','uses'=>'backend\ContructController@SubmitFrameContruct']);
        	Route::post('/delframecontruct',['as'=>'del.frame.contruct','uses'=>'backend\ContructController@DelFrameContruct']);
        	Route::post('/delcontruct',['as'=>'del.contruct','uses'=>'backend\ContructController@DelContruct']);

        	//thongkedaily
        	Route::get('/thongke-daily',['as'=>'re.agency','uses'=>'backend\AgencyControlller@ReAgency']);
        	Route::get('/thongke-timkiem',['as'=>'search.thongke','uses'=>'backend\AgencyControlller@SearchReAgency']);
        	//thongke181
        	Route::post('/ajaxagencystatic',['as'=>'ajax.agency.static','uses'=>'backend\AgencyControlller@AjaxAgencystatic']);
        	Route::get('/thongke-ngay/{year1}/{month1}/{day1}/{year2}/{month2}/{day2}/{id}',['as'=>'agency.static','uses'=>'backend\AgencyControlller@Agencystatic']);

        	//donhang
        	Route::get('/danh-sach-donhang-daily', ['as'=>'agency.order.list', 'uses' =>'backend\AgencyControlller@AgencyListOrder']);
        	Route::get('/chitiet-donhang-daily/{id}', ['as'=>'agency.order.show','uses' =>'backend\AgencyControlller@AgencyOrdershow']);
        	Route::get('/loai-don-hang-daily/{id}', ['as'=>'agency.order.type', 'uses' =>'backend\AgencyControlller@AgencyOrderlist_type']);
        	Route::get('/don-hang-daily/{ag}', ['as'=>'agency.order.agency', 'uses' =>'backend\AgencyControlller@AgencyOrderlist_agency']);
        	Route::get('/tim-don-hang-daily', ['as'=>'agency.order.search', 'uses' =>'backend\AgencyControlller@AgencysearchOrder']);
        	
        });
		Route::group(['prefix'=>'/san-pham'],function(){
		 	//nhập kho số lượng 
		 	Route::post('/nhap-kho',['as'=>'d.edit.sku','uses'=>'backend\ProductController@getNhapKho']);

		 	// submit-nhap-kho
		 	Route::post('submit-nhap-kho',['as'=>'ajax.form.nhap.kho','uses'=>'backend\ProductController@postSubmitNhapKho']);
		 	//phân trang
		 	Route::post('/phan-trang-nhap-kho',['as'=>'ajax.phan.trang.nhap.kho','uses'=>'backend\ProductController@getPhanTrangNhapKho']);
		 	//list transposst
		 	Route::get('danh-sach-transpost',['as'=>'list.transpost','permissions'=>'phi_van_chuyen_san_pham','uses'=>'backend\ProductController@listTranspost']);
		 	Route::post('/ajax-sm-province',['as'=>'ajax.sm.province','uses'=>'backend\ProductController@ajaxSmProvince']);
		 	Route::post('/ajax-sm-distric',['as'=>'ajax.sm.district','uses'=>'backend\ProductController@ajaxSmDistric']);
			Route::post('/ajax-xem',['as'=>'ajax.xem','uses'=>'backend\ProductController@LoadXem']);
		 	// Tạo sản phẩm
		 	Route::get('/tao-san-pham', ['as'=>'product.create.product', 'uses'=>'backend\ProductController@createProduct']);
		 	// Sửa sản phẩm
		 	Route::get('/sua-san-pham/{id}', ['as'=>'product.edit.product', 'uses'=>'backend\ProductController@editProduct']);
		 	// Danh sách sản phẩm
		 	Route::get('/danh-sach-san-pham', ['as'=>'product.list.product', 'uses'=>'backend\ProductController@listProduct']);
		 	// Bộ lọc
		 	Route::get('/tao-bo-loc', ['as'=>'product.create.filter', 'uses'=>'backend\ProductController@createFilter']);
		 	Route::get('/quan-ly-dac-tinh', ['as'=>'product.create.feature', 'uses'=>'backend\ProductController@createFeature']);
       		// Xem sản phẩm theo danh mục
       		Route::get('/nhom-san-pham/{id}', array('as'=>'cate.products.detail', 'uses'=>'backend\ProductController@products_in_cate'));
       		// Tạo mới sản phẩm
       		Route::post('/tao-san-pham-form', array('as'=>'product.add', 'uses'=>'backend\ProductController@formProduct'));
       		// Sửa sản phẩm
       		Route::post('/sua-san-pham-form', array('as'=>'product.edit', 'uses'=>'backend\ProductController@formProductEdit'));
            // Xóa sản phẩm
            Route::post('/xoa-san-pham', array('as'=>'products.del', 'uses'=>'backend\ProductController@del_product_post'));
       		// Danh mục sản phẩm
       		Route::get('/danh-muc-san-pham', ['as' => 'dev.list.category.product', 'uses' => 'backend\ProductController@listCategoryProduct']);
			// Thêm danh mục sản phẩm
			Route::get('/them-danh-muc-san-pham', array('as'=>'category.product.add', 'uses'=>'backend\ProductController@createCategoryProduct'));
			// Quản lý comment sản phẩm
			Route::get('/tim-kiem-comment', ['as' => 'search.cmpro',  'permissions'=>'quan_ly_binh_luan_san_pham', 'uses' => 'backend\CommentController@searchCommentProduct']);

			Route::get('/quan-ly-comment', ['as' => 'comments.product.list',  'permissions'=>'quan_ly_binh_luan_san_pham', 'uses' => 'backend\CommentController@listCommentProduct']);
			Route::get('/quan-ly-comment/da-duyet', ['as' => 'comments.product.list.done',  'permissions'=>'quan_ly_binh_luan_san_pham', 'uses' => 'backend\CommentController@listCommentProductDone']);
			// Quản lý comment sản phẩm phong
			Route::get('/tim-kien-comment/da-duyet', ['as' => 'search.cmpro.done',  'permissions'=>'quan_ly_binh_luan_san_pham', 'uses' => 'backend\CommentController@searchCommentProductdone']);
			
			// Xóa Comment 
			Route::post('/quan-ly-comment/xoqwertyuityuio', ['as' => 'comments.product.delete', 'permissions'=>'quan_ly_binh_luan_san_pham', 'uses' => 'backend\CommentController@deleteCommentProduct']);
			// Duyệt Comment 
			Route::post('/quan-ly-comment/duyetqwertyuio', ['as' => 'comments.product.accept', 'permissions'=>'quan_ly_binh_luan_san_pham', 'uses' => 'backend\CommentController@acceptCommentProduct']);

			// Thêm danh mục sản phẩm
       		Route::post('/them-danh-muc-san-pham', array('as'=>'category.product.post_add', 'uses'=>'backend\ProductController@post_create_category_product'));
       		// Xóa danh mục sản phẩm
      		Route::post('/xoa-danh-muc-san-pham', array('as'=>'cate.products.del', 'uses'=>'backend\ProductController@del_product_category'));
      		// Sửa danh mục sản phẩm
       		Route::get('/sua-danh-muc-san-pham/{id}', array('as'=>'cate.products.edit', 'uses'=>'backend\ProductController@edit_product_category'));
       		// Lưu danh mục sản phẩm
      		Route::post('/save-danh-muc-san-pham', array('as'=>'save.cate.products.edit', 'uses'=>'backend\ProductController@save_edit_category'));
      		Route::post('/create-attr', array('as'=>'attr.products.create', 'uses'=>'backend\ProductController@createAttribute'));
      		Route::post('/check-key', array('as'=>'check-key.products', 'uses'=>'backend\ProductController@checkKey'));
      		Route::post('/add-filter-price', array('as'=>'product.add-filter', 'uses'=>'backend\ProductController@addFilterPrice'));
      		Route::post('/get-filter-ajax-dinh-tinh', array('as'=>'ajax.filter.get.dt', 'uses'=>'backend\ProductController@getFilterAjaxDT'));
      		Route::post('/get-filter-ajax-dinh-luong',['as'=>'ajax.filter.get.dl','uses'=>'backend\ProductController@getFilterAjaxDL']);
      		Route::post('/save-filter-ajax', array('as'=>'ajax.filter.submit', 'uses'=>'backend\ProductController@saveFilterAjax'));
      		Route::post('/save-filter-ajax-dl', array('as'=>'ajax.filter.submit.dl', 'uses'=>'backend\ProductController@saveFilterAjaxDL'));
      		Route::post('/del-filter-ajax', array('as'=>'ajax.filter.del', 'uses'=>'backend\ProductController@delFilterAjax'));
      		Route::post('/change-attr-filter-ajax', array('as'=>'ajax.attr.filter.change', 'uses'=>'backend\ProductController@changeFilterStatus'));
      		Route::post('/ajax-del-attr', array('as'=>'ajax.del.attr', 'uses'=>'backend\ProductController@delAttribute'));
      		Route::post('/get-attr-ajax', array('as'=>'ajax.attr.get', 'uses'=>'backend\ProductController@getAttrAjax'));
      		Route::post('/get-attr-save', array('as'=>'ajax.attr.save', 'uses'=>'backend\ProductController@saveAttrAjax'));
      		Route::post('/get-filter-price',array('as'=>'ajax.get.filter.price','uses'=>'backend\ProductController@getFilterPriceAjax'));
      		Route::post('/save-filter-ajax-price', array('as'=>'ajax.filter.submit.price', 'uses'=>'backend\ProductController@saveFilterPriceAjax'));
      		
      		// config email het hang
             Route::post('/config-email-hethang',['as'=>'d.ajax.config.hethang','uses'=>'backend\ProductController@ConfigEmailHetHang']);
             //submit email het hang
             Route::post('submit-email-hethang/sfsfsf',['as'=>'ajax.form.email.hethang','uses'=>'backend\ProductController@SubmitConfigEmailHetHang']);

             // ajax edit status list
             Route::post('/edit-list-product-ajax',['as'=>'ajax.edit.list.status','uses'=>'backend\ProductController@EditAjaxStatusList']);

             //ajax edit label list
             Route::post('/edit-label-list',['as'=>'ajax.get.label','uses'=>'backend\ProductController@getAjaxLabelList']);
             Route::post('/edit-label-list-post',['as'=>'ajax.edit.label','uses'=>'backend\ProductController@EditAjaxLabelList']);
            // tìm kiếm prodcut
            Route::get('/tim-kiem-san-pham',['as'=>'search.product','uses'=>'backend\ProductController@getSearchProductList']);

            // add_attr_filter
            Route::post('/add-attr-filter',['as'=>'ajax.add.attr.filter','uses'=>'backend\ProductController@postAddAttrFilter']);
            // add_related_product
            Route::post('/add-related-product',['as'=>'add.related.product','uses'=>'backend\ProductController@postAddRelatedProduct']);

            // checkbox related
            Route::post('/checkbox-related',['as'=>'checkbox.add.related','uses'=>'backend\ProductController@postCheckRelated']);
            Route::get('/thu-muc',['as'=>'folder.product.cate','uses'=>'backend\ProductController@getFolder']);
            Route::get('/xem-thu-muc/{id}',['as'=>'folder.product','uses'=>'backend\ProductController@getViewFolder']);
            Route::post('/get-modal-child/gfdfkhalfhaskdfh',['as'=>'product.get.modal.attribute','uses'=>'backend\ProductController@getModalAttribute']);
            Route::post('/get-select-attr/gfdfkhalfhaskdfasdfsdh',['as'=>'product.get.select.attribute','uses'=>'backend\ProductController@getSelectAttribute']);
            
            Route::post('/submit-folder1/gfdfkhalfhaskdfasdfsdh',['as'=>'folder-submit-1','uses'=>'backend\ProductController@FolderSubmit1']);

            Route::post('/submit-folder2/gfdfkhalfhaskdfasdfsdh',['as'=>'folder-submit-2','uses'=>'backend\ProductController@FolderSubmit2']);
            Route::post('/del-folder2/gfdfkhalfhaskdfasdfsdh',['as'=>'folder-del','uses'=>'backend\ProductController@FolderDelete']);
            Route::get('/toi-uu-hoa-du-lieu',['as'=>'product.optimal','uses'=>'backend\ProductController@Optimal']);
            Route::get('/chinh-sua-noi-dung-danh-muc/{id}',['as'=>"edit-content-folder",'uses'=>'backend\ProductController@EditContentFolder']);
            Route::post('/submit-category/post/halfhask',['as'=>'submit-folder-content','uses'=>'backend\ProductController@submitContentCategory']);
            // Đặc tính :
            Route::post('/create-feature', array('as'=>'feature.products.create', 'uses'=>'backend\FeatureController@createFeature'));
            Route::post('/add-feature-filter',['as'=>'ajax.add.feature.filter','uses'=>'backend\FeatureController@postAddFeatureFilter']);
            Route::post('/ajax-del-feature', array('as'=>'ajax.del.feature', 'uses'=>'backend\FeatureController@delFeature'));
            Route::post('/del-feature-ajax', array('as'=>'ajax.feature.del', 'uses'=>'backend\FeatureController@delFeatureAjax'));
            Route::post('/get-feature-ajax', array('as'=>'ajax.feature.get', 'uses'=>'backend\FeatureController@getFeatureAjax'));
            Route::post('/save-feature-ajax', array('as'=>'ajax.feature.submit', 'uses'=>'backend\FeatureController@saveFeatureAjax'));
            Route::post('/check-key-feature', array('as'=>'check-key.feature', 'uses'=>'backend\FeatureController@checkKey'));
            // end đặc tính

            // Seri sản phẩm
            Route::get('/seri/{id}', array('as'=>'product.seri', 'uses'=>'backend\ProductController@EditSeriProduct'));
            Route::post('/seri_post', array('as'=>'product.seri.post', 'uses'=>'backend\ProductController@FormEditSeriProduct'));
            // end seri
            // Danh mục sản phẩm
       		Route::get('/nhom-san-pham', ['as' => 'admin.list.category.product', 'uses' => 'backend\ProductController@listGroupProduct']);

       		Route::get('/danh-sach-khach-hang/{id}',['as'=>'agency.customer','uses'=>'backend\ProductController@AgencyCustomer']);
       });
});
// Đại lý
Route::get('quan-tri/dai-ly/login',['as' => 'login.center','uses' => 'backend_center\loginCController@getLogin']);
Route::get('quan-tri/dai-ly/quenmatkhau',['as' => 'login.center.forget','uses' => 'backend_center\loginCController@forgetpass']);
Route::post('quan-tri/dai-ly/quenmatkhau',['as' => 'login.center.forget.post','uses' => 'backend_center\loginCController@forgetpasspost']);
Route::get('quan-tri/dai-ly/matkhau/{id}/{key}',['as' => 'login.center.repass','uses' => 'backend_center\loginCController@repass']);
Route::post('quan-tri/dai-ly/matkhau/{id}/{key}',['as' => 'login.center.repass.post','uses' => 'backend_center\loginCController@postrepass']);
Route::post('quan-tri/dai-ly/login',['as' => 'login.center.post','uses' => 'backend_center\loginCController@postLogin']);
Route::get('quan-tri/dai-ly/logout',['as' => 'logout.center','uses' => 'backend_center\loginCController@getLogout']);
Route::group(['prefix'=>'quan-tri/dai-ly','middleware'=>'loginC'],function(){	
	Route::get('/', array('as'=>'center.home', 'uses'=>'backend_center\CenterController@index'));
	Route::get('/thongtin',['as' => 'info.center','uses' => 'backend_center\CenterController@getInfo']);
	Route::post('/thongtin',['as' => 'info.center.post','uses' => 'backend_center\CenterController@postInfo']);
	Route::get('/congtrinh',['as' => 'build.center','uses' => 'backend_center\CenterController@getBuild']);
	Route::post('/congtrinhadf',['as' => 'build.center.post','uses' => 'backend_center\CenterController@postBuild']);
	Route::post('/gfgdhth', ['as'=>'quan-tri.upload.up-img.center', 'uses' =>'backend_center\CenterController@uploadImg']);

	Route::get('/sanpham/danh-sach', ['as'=>'center.pro.list', 'uses' =>'backend_center\CenterController@listpro']);
	Route::get('tim-kiem-sanpham-daily',['as'=>'search.pro.center','uses'=>'backend_center\CenterController@SearchProCenter']);

	Route::get('/donhang/timkiem', ['as'=>'center.order.search', 'uses' =>'backend_center\OrderController@searchorder']);
	Route::get('/donhang/danh-sach', ['as'=>'center.order.list', 'uses' =>'backend_center\OrderController@listorder']);
	Route::get('/donhang/danh-sach-doi', ['as'=>'center.order.listwait', 'uses' =>'backend_center\OrderController@listorderwait']);
	Route::get('/donhang/danh-sach-huy', ['as'=>'center.order.listx', 'uses' =>'backend_center\OrderController@listorderx']);
	Route::get('/donhang/danh-sach-xuly', ['as'=>'center.order.listxuly', 'uses' =>'backend_center\OrderController@listorderxuly']);
	Route::get('/donhang/danh-sach-giaohang', ['as'=>'center.order.listgh', 'uses' =>'backend_center\OrderController@listordergh']);
	Route::get('/donhang/danh-sach-thanhtoan', ['as'=>'center.order.listtt', 'uses' =>'backend_center\OrderController@listordertt']);
	Route::get('/donhang/danh-sach-nhanhang', ['as'=>'center.order.listnh', 'uses' =>'backend_center\OrderController@listordernh']);
	
	Route::get('/them-don-hang',['as'=>'center.order.add','uses'=>'backend_center\OrderController@getOrderadd']);
	Route::get('/chitiet/{id}', ['as'=>'center.order.show','uses' =>'backend_center\OrderController@show']);
	Route::post('/submit/qwertyqwfhfhferty',['as'=>'center.order.submit.add','uses'=>'backend_center\OrderController@postOrderadd']);
	Route::post('/search/qwerty/ytrewqgg',['as'=>'center.order.search.add','uses'=>'backend_center\OrderController@postOrderSearchadd']);
	Route::post('/checkbox/qwerty',['as'=>'center.order.checkbox.add','uses'=>'backend\OrderController@postOrderCheckadd']);
	Route::post('statusbb', ['as'=>'center.order.status', 'uses' =>'backend_center\OrderController@status']);
	Route::post('statusbbhfdgdf', ['as'=>'order.get.info.agency', 'uses' =>'backend_center\OrderController@infoOrderAgency']);
	Route::post('statusbbhfdgdfgfdf', ['as'=>'order.ajax.submit.agency', 'uses' =>'backend_center\OrderController@saveOrderAgency']);

	//slide
	Route::get('/slidedaily', ['as'=>'list.center.slide', 'uses'=>'backend_center\CenterController@listslide']);
	Route::post('/slidedaily/postadd', ['as'=>'slidecenter.post_add', 'uses'=>'backend_center\CenterController@formAdd']);
	Route::post('/slidedaily/postsave', ['as'=>'slidecenter.post_save', 'uses'=>'backend_center\CenterController@formSave']);
	Route::post('/slidedaily/delslidecenter', ['as'=>'del.slidecenter',  'uses'=>'backend_center\CenterController@delSlide']);
	Route::post('/slidedaily/checkslidecenter', ['as'=>'slidecenter.check', 'uses'=>'backend_center\CenterController@SlideCheck']);
});