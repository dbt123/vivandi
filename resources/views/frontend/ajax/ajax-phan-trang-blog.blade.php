<?php 
    $kt =0;
?>
@foreach($post as $p)
<?php
    $kt=$kt+1;
?>
@if ($kt % 2 != 0)
    <div class="blog-catagory-section">
        <div class="row">
            <div class="col-md-6 col-blog-catagory-left">
                <img src="{{$p->img}}" alt="">
            </div><!-- end of col-md-6 -->
            <div class="col-md-6 col-blog-catagory-right">
                <div class="wrap-blog-catagory-content">
                    <h1>{{$p->title}}</h1>
                    <?php $date = new DateTime($p->created_at);?>
                    <p class="blog-detail-date">{{$date->format(' d.m.Y ')}}</p>
                    <p class="blog-catagory-content">{!! substr( $p->description,  0, 140); !!} <span>...</span></p>
                    <a href="">
                        <div class="button-download">
                            <button>Chi tiết</button>
                            <div class="button-white"></div>
                        </div>
                    </a>
                </div>
            </div><!-- end of col-md-6 -->
        </div>
    </div>
    <!-- end of blog-catagory-section -->
@else
    <div class="blog-catagory-section">
        <div class="row">
            <div class="col-md-6 col-blog-catagory-left">
                <img src="{{$p->img}}" alt="">
            </div><!-- end of col-md-6 -->
            <div class="col-md-6 col-blog-catagory-right">
                <div class="wrap-blog-catagory-content">
                    <h1>{{$p->title}}</h1>
                    <?php $date = new DateTime($p->created_at);?>
                    <p class="blog-detail-date">{{$date->format(' d.m.Y ')}}</p>
                    <p class="blog-catagory-content">{!! substr( $p->description,  0, 140); !!} <span>...</span></p>
                    <a href="">
                        <div class="button-download">
                            <button>Chi tiết</button>
                            <div class="button-white"></div>
                        </div>
                    </a>
                </div>
            </div><!-- end of col-md-6 -->
        </div>
    </div>
    <!-- end of blog-catagory-section -->
@endif
@endforeach