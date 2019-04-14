<div class="vivandi-stories example-classname">
                <div class="slideshow">
                    <?php
                              $story_bt =  DB::table('slides')->where('type','Slide Story')->where('status',1)->get();
                    ?>
                    @foreach($story_bt as $key => $ss)
                    @if($key==0)
                        <input id="button-{{$key+1}}" type="radio" name="radio-set" class="selector-{{$key+1}}" checked="checked"/>
                        <label for="button-{{$key+1}}" class="button-label-{{$key+1}} arrow a{{$key+1}}"></label>
                    @else
                        <input id="button-{{$key+1}}" type="radio" name="radio-set" class="selector-{{$key+1}}"/>
                        <label for="button-{{$key+1}}" class="button-label-{{$key+1}} arrow a{{$key+1}}"></label>
                    @endif
                    @endforeach
                     
                    
                     
                    <div class="content">
                        <div class="parallax-bg"></div>
                        <ul class="slider">
                            <?php
                              $story_slide =  DB::table('slides')->where('type','Slide Story')->where('status',1)->get();
                            ?>
                            @foreach($story_slide as $key => $ss)
                            <li>
                                <div class="wrap-slider-content">
                                    <div class="slider-content">
                                        <figure>
                                            <div class="bg-tittle wow fadeInDown animated" data-wow-duration="0.7s"><h1>{{$ss->text_1}}</h1></div>
                                        </figure>
                                        <p><mark id="slider-{{$key}}-content"><span></span></mark></p>
                                        <div class="content-creat wow fadeIn animated" data-wow-duration="1s" data-wow-delay="14.5s"><p>{{$ss->text_2}}</p></div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div><!-- content -->
                     
                </div><!-- slideshow -->
            </div>


            <a href="#click-to-home">
                <div class="button-to-home">
                    <img src="{{asset('frontend/html/img/to-home.png')}}" alt="">
                </div>
            </a>


                <script type="text/javascript">
           var slider1 = [
          {
            text: $('#slideid_0').val(),
          }
        ]
        var slider2 = [
          {
            text: $('#slideid_1').val(),
          }
        ]
        var slider3 = [
          {
            text: $('#slideid_2').val(),
          }
        ]
        var slider4 = [
          {
            text: $('#slideid_3').val(),
          }
        ]
        var slider5 = [
          {
            text: $('#slideid_4').val(),
          }
        ]
        var slider6 = [
          {
            text: $('#slideid_5').val(),
          }
        ]
       

        $(function() {
          $('#slider-0-content').typelink({
            pages: slider1
          });
        });

        $('.arrow.a2').on('click', function() {
          $('#slider-1-content').typelink({
            pages: slider2
          });
        });

        $('.arrow.a3').on('click', function() {
          $('#slider-2-content').typelink({
            pages: slider3
          });
        });
        $('.arrow.a4').on('click', function() {
          $('#slider-3-content').typelink({
            pages: slider4
          });
        });
        $('.arrow.a5').on('click', function() {
          $('#slider-4-content').typelink({
            pages: slider5
          });
        });
        $('.arrow.a6').on('click', function() {
          $('#slider-5-content').typelink({
            pages: slider5
          });
        });
        </script>
        <script>
            $(function() {
                $.scrollify({
                    section : ".example-classname",
                    interstitialSection : "",
                    easing: "easeOutExpo",
                    scrollSpeed: 1500,
                    offset : 0,
                    scrollbars: true,
                    standardScrollElements: "",
                    setHeights: false,
                    overflowScroll: true,
                    updateHash: false,
                    touchScroll:false,
                    before:function() {},
                    after:function() {

                    },
                    afterResize:function() {},
                    afterRender:function() {}
                });
            });
        </script>