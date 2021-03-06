<!doctype html>
<html class="no-js" lang="en">
    <head>
        <title>@yield('title')</title>
        @yield('meta')
        <meta name="keywords" content="">
        <meta charset="utf-8">
        <meta name="author" content="{!! url('') !!}">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1" />
        <!-- favicon -->
        <link rel="shortcut icon" href="{!! asset('frontend/html/images/favicon.png') !!}">
        <link rel="apple-touch-icon" href="{!! asset('frontend/html/images/apple-touch-icon-57x57.png') !!}">
        <link rel="apple-touch-icon" sizes="72x72" href="{!! asset('frontend/html/images/apple-touch-icon-72x72.png') !!}">
        <link rel="apple-touch-icon" sizes="114x114" href="{!! asset('frontend/html/images/apple-touch-icon-114x114.png') !!}">
        <!-- animation --> 
        @include('frontend_center.partinal.css')
        @yield('css')
    </head>
    <body>
        <!-- HEADER ///////////////////////////////////////////////////////////////////////////// -->
        @include('frontend_center.partinal.main-menu')
        <!-- BODY ///////////////////////////////////////////////////////////////////////////// -->
        @yield('content')
        <!-- POPUP ///////////////////////////////////////////////////////////////////////////// -->
        @include('frontend_center.partinal.js')
        @yield('js')
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>

        <script>
            // $.lockfixed("#sidebar",{offset: {top: 40, bottom: 45}});

            $(document).ready(function() {
                        win = $(window).width();
                        if(win >= 992){
                            $.lockfixed("#sidebar",{offset: {top: 40, bottom: 45}});
                        }
                    });

            $(document).on('change','#d_agency_check',function(e){
                e.preventDefault();
                value = $(this).val();
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('ajax.footer.check.agency')}}",
                    data:{'value':value},
                    success:function(data){
                        if(data.status == true){
                            $('#d_diachi_daily').val(data.agency.address_agency);
                            $('#d_phone_agency').val(data.agency.phone);
                        }else{
                            $('#d_diachi_daily').val("");
                            $('#d_phone_agency').val("");
                        }
                    },
                    cache:false,
                    dataType: 'json'
                })
            });

             $(document).on('click','.btn-search-rps',function(e) {
                    e.preventDefault();
                    $('header .search-rps input').toggleClass("search-rps-active");
                });

            $(document).on('click','.d_click_tracuu',function(e){
                e.preventDefault();
                $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-tracuu' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    callbacks: {
                       beforeOpen: function() {
                          
                       },
                       beforeClose: function() {
                           
                       }
                    }
                });
            });

            $(document).on('submit','#d_sb_tracu',function(e){
                e.preventDefault();
                var form = $('#d_sb_tracu')[0];
                var formData = new FormData(form);
                $.ajax({
                    headers: {
                                'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                    type:"post",
                    url:"{{route('submit.tracuu')}}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success:function(data){
                        if(data.status == true){
                            $("#d_sb_tracu")[0].reset();
                            $('#modal-popup-tracuu').magnificPopup('close');
                            $.magnificPopup.open({
                                items: {
                                    src: '#modal-popup-tracuu-kq' 
                                },
                                type: 'inline',
                                blackbg: true,
                                zoom: {
                                        enabled: true,
                                        duration: 300 
                                       },
                                mainClass: 'my-mfp-zoom-in',
                                callbacks: {
                                   beforeOpen: function() {
                                      $('#d_kq_sm').html(data.html);
                                      $('.notify-file').text("1");
                                        jQuery('.scrollbar-dynamic').scrollbar();
                                   },
                                   beforeClose: function() {
                                       
                                   }
                                }
                            });
                        }else{
                            $('#d_error_tracuu').text(data.message).css('color','rgb(201, 48, 44)').slideDown("slow").delay(3000).slideUp();
                        }
                    },
                    dataType:"json"
                });
            });

            //add cart
            spamadd = 0;
            $(document).on('click','.art_to_cart',function(e){
                e.preventDefault();
                id = $(this).data('id');
                num =1;
                if(spamadd == 0){
                    spamadd++;
                    $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('art.to.cart')}}",
                    data:{'id':id,'num':num},
                    success:function(data){
                        spamadd = 0;
                        if(data.status == true){
                            $('#d_cart_ajax').html(data.html);
                            count = parseInt($('.counts').text()) + 1;
                            $('.counts').text(count);
                            count1 = parseInt($('.counts1').text()) + 1;
                            $('.counts1').text(count1);
                            if(id == data.frame.id ){
                                $('.d_del_class_'+data.frame.id).removeClass('art_to_cart').addClass('button-likedd').text("ĐÃ THÍCH").css('color','#0D0D0D');
                                img ='<img src="{!! asset('frontend/html/img/favorite-FFC000.svg')  !!}">';
                                $('.d_like_'+data.frame.id).html(data.frame.like_frame+" "+img);
                            }
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
                }
                spamadd =1;
            });
            // select
            $(document).on('change','.d_select',function(e){
                e.preventDefault();
                all_some = $(this).parent().parent().next().next().data('value');
                id = $(this).data('id');
                num = $(this).val();
                $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('select.to.cart')}}",
                    data:{'id':id,'num':num},
                    success:function(data){
                        if(data.status == true){
                            $('.d_total').text((data.total + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+"đ");
                            $('.d_total_all').text((data.all_total + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+"đ");
                            total_some = parseInt(all_some)*num;
                            $('.d_all_some_'+id).text((total_some + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+"đ");
                            content = '<td><h5>Giảm</h5></td>'+
                                                '<td><h5><span id="d_discount">'+data.discount_type+'</span></h5></td>';
                            if($('.dathang-top tr:nth-child(2)').length){
                            }else{
                                $('.dathang-top tr:last-child').after("<tr></tr>");
                            }
                            $('.dathang-top tr:nth-child(2)').html(content);
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
            });
            
            setInterval(function(){
            c = $('.counts').text();
            c1 = $('.counts1').text();
            if( c > 0 && c1>0){
                $('.shopping_cart').addClass('d_list_cart');
                //cart
                $(document).on('click','.d_list_cart',function(e){
                    e.preventDefault();
                    $.magnificPopup.open({
                        items: {
                            src: '#modal-popup-dathang' 
                        },
                        type: 'inline',
                        blackbg: true,
                        zoom: {
                                enabled: true,
                                duration: 300 
                               },
                        mainClass: 'my-mfp-zoom-in',
                        callbacks: {
                           beforeOpen: function() {
                              jQuery('.scrollbar-dynamic').scrollbar();
                           },
                           beforeClose: function() {
                               
                           }
                        }
                    });

                $(document).on('click','#d_dat_hang',function(e){
                    e.preventDefault();
                    $('#modal-popup-dathang').magnificPopup('close');
                        $.magnificPopup.open({
                            items: {
                                src: '#modal-popup-thongtin' 
                            },
                            type: 'inline',
                            blackbg: true,
                            zoom: {
                                    enabled: true,
                                    duration: 300 
                                   },
                            mainClass: 'my-mfp-zoom-in',
                            callbacks: {
                               beforeOpen: function() {
                               }
                            }
                        });   
                    });
                });
            }else{
                $('.shopping_cart').removeClass('d_list_cart');
            }
            }, 1000);
            // submit order
            order = 0;
            $(document).on('submit','#d_submit_order_thong_tin',function(e){
                e.preventDefault();
                $.magnificPopup.open({
                    items: {
                        src: '#modal-popup-loading' 
                    },
                    type: 'inline',
                    blackbg: true,
                    zoom: {
                            enabled: true,
                            duration: 300 
                           },
                    mainClass: 'my-mfp-zoom-in',
                    closeOnBgClick: false,
                    enableEscapeKey: false,
                    callbacks: {
                    }
                });
                var form = $('#d_submit_order_thong_tin')[0];
                var formData = new FormData(form);
                if(order == 0){
                    order++;
                    $.ajax({
                    headers: {
                                  'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                    type:"post",
                    url:"{{route('submit.order')}}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success:function(data){
                        order = 0;
                        if(data.status == true){
                            $("#d_submit_order_thong_tin")[0].reset();
                            $('#modal-popup-dathang').magnificPopup('close');
                            $('#modal-popup-loading').magnificPopup('close');
                            $.magnificPopup.open({
                                items: {
                                    src: '#modal-popup-success' 
                                },
                                type: 'inline',
                                blackbg: true,
                                zoom: {
                                        enabled: true,
                                        duration: 300 
                                       },
                                mainClass: 'my-mfp-zoom-in',
                                callbacks: {
                                   beforeOpen: function() {
                                   }
                                }
                            }); 
                            $('.button-likedd').addClass('art_to_cart').removeClass('button-likedd').text('YÊU THÍCH').css('color','#0D0D0D');
                            count = 0;
                            $('.counts').text(count);
                            count1 = 0;
                            $('.counts1').text(count1);
                        }
                    },
                    dataType:"json"
                });
                }
                order = 1;
            });
            //remove
            spamdel = 0;
            $(document).on('click','.d_remove_cart',function(e){
                e.preventDefault();
                container = $(this);
                id = $(this).data('id');
                if(spamdel == 0){
                    spamdel++;
                    $.ajax({
                    headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    type:"post",
                    url:"{{route('remove.to.cart')}}",
                    data:{'id':id},
                    success:function(data){
                        spamdel = 0;
                        if(data.status == true){
                            $('.d_tab_remove_'+id).remove();
                            $('.d_total').text((data.total + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+"đ");
                            $('.d_total_all').text((data.all_total + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+"đ");
                            count = $('.counts').text() - 1;
                            $('.counts').text(count);
                            count1 = $('.counts1').text() - 1;
                            $('.counts1').text(count1);
                            $('.d_del_class_'+id).removeClass('button-likedd').addClass('art_to_cart').text("YÊU ThÍCH").css('color','#0D0D0D');
                            if(data.session.length == 0){
                                $('#modal-popup-dathang').magnificPopup('close');
                            }
                            if(id == data.frame.id){
                                img ='<img src="{!! asset('frontend/html/img/favorite-FFC000.svg')  !!}">';
                                $('.d_like_'+data.frame.id).html(data.frame.like_frame+" "+img);
                            }
                            content = '<td><h5>Giảm</h5></td>'+
                                                '<td><h5><span id="d_discount">'+data.discount_type+'</span></h5></td>';
                            if($('.dathang-top tr:nth-child(2)').length){
                            }else{
                                $('.dathang-top tr:last-child').after("<tr></tr>");
                            }
                            $('.dathang-top tr:nth-child(2)').html(content);
                        }
                    },
                    cache:false,
                    dataType: 'json'
                });
                }
                spamdel = 1;
            });

             $(document).on('click','#d_tracuu_baohanh',function(e){
                e.preventDefault();
                $.magnificPopup.open({
                   items: {
                       src: '#modal-popup-tracuubaohanh'
                   },
                   type: 'inline',
                   blackbg: true,
                   zoom: {
                    enabled: true,
                    duration: 300 
                  },
                  mainClass: 'my-mfp-zoom-in',
                });
                
             }); 
            $(document).on('submit','#d_sm_tracuu_baohanh',function(e){
                e.preventDefault();
                
                var form = $('#d_sm_tracuu_baohanh')[0];
                var formData = new FormData(form);
                $.ajax({
                headers: {
                  'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                type:"post",
                url:"{{route('tracuu.baohanh')}}",
                data: formData,
                contentType: false,
                processData: false,
                success:function(data){
                    if(data.status == true){
                        $("#d_sm_tracuu_baohanh")[0].reset();
                        $('#d_ajax_tracuu_baohanh').html(data.html);
                            jQuery('.scrollbar-dynamic').scrollbar();
                        $.magnificPopup.open({
                           items: {
                               src: '#modal-popup-kq-tracuu' 
                           },
                           type: 'inline',
                           blackbg: true,
                           zoom: {
                            enabled: true,
                            duration: 300 
                          },
                          mainClass: 'my-mfp-zoom-in',
                          callbacks: {
                          beforeOpen: function() {
                           }
                          }
                        });
                    }else{
                        $("#d_err").css('display','block').text(data.message).delay(4000).slideUp();
                    }
                },
                dataType:"json"
                });
            });

            $(document).on('click','#d_esc',function(e){
                e.preventDefault();
                
                $('#modal-popup-kq-tracuu').magnificPopup('close');
            });

            $(document).on('click','#d_baocao_daily',function(e){
                e.preventDefault();
                $.magnificPopup.open({
                   items: {
                       src: '#modal-popup-baocaodaily'
                   },
                   type: 'inline',
                   blackbg: true,
                   zoom: {
                    enabled: true,
                    duration: 300 
                  },
                  mainClass: 'my-mfp-zoom-in',
                });

            });
            $(function() {
                Dropzone.autoDiscover = false;
                $("div#myDropZone").dropzone({
                    maxFiles:8,
                    maxfilesexceeded:function(file){
                         this.removeFile(file);
                    },
                    url : "{{route('upload.img.congtrinh')}}",
                    addRemoveLinks : true,
                    maxFilesize: 8,
                    dictDefaultMessage: 'Ảnh công trình',
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
                        console.log(t);
                        $("input[name='img_product']").val(t);
                    },
                    removedfile: function(file) {
                        var _ref;
                        _ref = file.previewElement;
                        if(_ref!= null){
                            _ref.parentNode.removeChild(file.previewElement);
                        }
                     }
                });
            });

            $(document).on('submit','#d_sm_baocao_daily',function(e){
                e.preventDefault();
                var form = $('#d_sm_baocao_daily')[0];
                var formData = new FormData(form);
                $.ajax({
                headers: {
                          'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                type:"post",
                url:"{{route('sm.baocao.daily')}}",
                data: formData,
                contentType: false,
                processData: false,
                success:function(data){
                     if(data.status == true){
                            $("#d_sm_baocao_daily")[0].reset();
                            $.magnificPopup.open({
                               items: {
                                   src: '#modal-popup-success-bc' 
                               },
                               type: 'inline',
                               blackbg: true,
                               zoom: {
                                enabled: true,
                                duration: 300 
                              },
                              mainClass: 'my-mfp-zoom-in',
                              callbacks: {
                              beforeOpen: function() {

                               }
                              }
                            });
                        }
                },
                dataType:"json"
                });
            });

            $(document).on('click','.congtrinh-img a',function() {
                $('.chenanh-congtrinh').slideToggle("slow");
            });


            // share
            window.fbAsyncInit = function() {
            FB.init({
              appId      : '1742912909316590',
              xfbml      : true,
              version    : 'v2.8'
            });
          };

          (function(d, s, id){
             var js, fjs = d.getElementsByTagName(s)[0];
             if (d.getElementById(id)) {return;}
             js = d.createElement(s); js.id = id;
             js.src = "//connect.facebook.net/en_US/sdk.js";
             fjs.parentNode.insertBefore(js, fjs);
           }(document, 'script', 'facebook-jssdk'));
                
             <?php
                $meta_title = DB::table('items')->where('key_layout','Meta Home')->where('key_item','title')->first();
                $meta_des = DB::table('items')->where('key_layout','Meta Home')->where('key_item','description')->first();
                $meta_img = DB::table('items')->where('key_layout','Meta Home')->where('key_item','image')->first();
                $sharecard = DB::table('items')->where('key_layout','Share')->where('key_item','share')->first();
            ?>   
            // share
            function shareOnFacebook() {
                FB.ui(
                  {
                    method        : 'feed',
                    display       : 'iframe',
                    // name          : '{!! $meta_title->value !!}',
                    link          : '{!! $sharecard->link !!}',
                    // picture       : '{!! asset($meta_img->value) !!}',
                    // description   : '{!! $meta_des->value !!}',
                    access_token  : 'user access token'
                  },
                  function(response) {
                    if (response && response.post_id) {
                        $.ajax({
                            headers: {
                                  'X-CSRF-TOKEN': '{{ csrf_token() }}'
                            },
                            type:"post",
                            url:"{{route('ajax.share.facebook')}}",
                            data:{},
                            success:function(data){
                                if(data.status == true){
                                    $('.d_total_all').text((data.all_total + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")+"đ");
                                    if($('.dathang-top tr:nth-child(2)').length){
                                    }else{
                                        $('.dathang-top tr:last-child').after("<tr></tr>");
                                    }

                                    content = ''+
                                                '<td><h5>Giảm</h5></td>'+
                                                '<td><h5><span id="d_discount">'+data.discount_type+'</span></h5></td>'+
                                            '';
                                    $('.dathang-top tr:nth-child(2)').html(content);
                                    // $('.dathang-top').append(content);        
                                }
                            },
                            cache:false,
                            dataType: 'json'
                        });
                    }else {
                        
                    }
                  }
                );
              }




        </script>
    </body>
</html>
