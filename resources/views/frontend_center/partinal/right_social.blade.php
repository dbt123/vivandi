<div class="content-right-share">
      <?php
          $fb = DB::table('items')->where('key_layout','Social')->where('key_item','fb')->first();
      ?>
      @if (sizeof($fb))
      @if ($fb->link)
      <a class="share-facebook" href="{{$fb->link}}"><i class="fa fa-facebook"></i></a>
      @else
      <a class="share-facebook" href=""><i class="fa fa-facebook"></i></a>
      @endif
      @endif

      <?php
          $tw =DB::table('items')->where('key_layout','Social')->where('key_item','tw')->first();
      ?>
      @if (sizeof($tw))
      @if ($tw->link)
      <a class="share-twitter" href="{{$tw->link}}"><i class="fa fa-twitter"></i></a>
      @else
      <a class="share-twitter" href=""><i class="fa fa-twitter"></i></a>
      @endif
      @endif

      <?php
          $gg =DB::table('items')->where('key_layout','Social')->where('key_item','g+')->first();
      ?>
      @if (sizeof($gg))
      @if ($gg->link)
      <a class="share-google-plus" href="{{$gg->link}}"><i class="fa fa-google-plus"></i></a>
      @else
      <a class="share-google-plus" href=""><i class="fa fa-google-plus"></i></a>
      @endif
      @endif

      <!-- <a class="share-dribbble" href=""><i class="fa fa-dribbble"></i></a> -->
      <?php
          $ins =DB::table('items')->where('key_layout','Social')->where('key_item','ins')->first();
      ?>
      @if (sizeof($ins))
      @if ($ins->link)
      <a class="share-instagram" href="{{$ins->link}}"><i class="fa fa-instagram"></i></a>
      @else
      <a class="share-instagram" href=""><i class="fa fa-instagram"></i></a>
      @endif
      @endif
</div>
<div class="content-right-copyright">
      <p><span>&copy</span>Copyright 2016 by <a href="http://mastercus.com/">Mastercus.com</a></p>
</div>
 <div class="content-right-tag content-right-dieukhoan content-right-dieukhoan-blog">
      
      <?php
          $dm_cha = DB::table('categories')->where('name','Footer')->where('editable',1)->first();
          $danhmuc = DB::table('categories')->where('parent_id',$dm_cha->id)->where('editable',0)->get();
      ?>
      @foreach($danhmuc as $dm)
          <h4>{{$dm->name}}</h4>
          <?php
            $footer_idpost = DB::table('post_category')->where('category_id',$dm->id)->get();
            $post_footer = array();
            if(sizeof($footer_idpost)){
                  $in = array();
                  foreach ($footer_idpost as $key => $pc) {
                      array_push($in, $pc->post_id);
                  }
                  $post_footer =DB::table('posts')->whereIn('id',$in)->where('status',1)->orderby('id','desc')->get();
            }
          ?>

          @foreach($post_footer as $key => $pf)
            <?php
                $a = route('Get.Blog.Detail',['id'=>$pf->id,'slug'=>$pf->slug]);
                $pieces = explode('.', $a);
                unset($pieces[0]);
                $b = $pieces[1] .'.'. $pieces[2];

            ?>
            <h5><a href="//{!! $b !!}">{!! $pf->title!!}</a></h5>
            @if ($key==4)
              <?php
                break;
              ?>
            @endif
          @endforeach

      @endforeach
</div>