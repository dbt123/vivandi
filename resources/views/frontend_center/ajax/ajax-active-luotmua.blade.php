<div id="owl-slide" class="owl-carousel owl-model" > 
  @foreach($list_image as $item)
      <div class="item"><img src="{!! $item->img !!}" alt=""></div>
  @endforeach
</div>
<script>
  $(".owl-model").owlCarousel ({
      navigation : true,
      pagination : false,
      slideSpeed : 200,
      paginationSpeed : 400,
      singleItem : true,
      items : 1,
      autoPlay : true
      });
    $('.owl-model .owl-controls .owl-next').html('<img src="{!! asset('frontend/html/img/right-arrow.svg') !!}" alt="">');
    $('.owl-model .owl-controls .owl-prev').html('<img src="{!! asset('frontend/html/img/left-arrow.svg') !!}" alt="">');
</script>