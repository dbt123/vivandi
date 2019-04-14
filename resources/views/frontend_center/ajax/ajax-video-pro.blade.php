
<div class="youtube-playing" id="id_video">
	<iframe src="https://www.youtube.com/embed/{{$vid}}" frameborder="0" allowfullscreen></iframe>
</div>
<div class="youtube-list">
	<p>Danh sách video hướng dẫn lắp đặt</p>
   <?php $links_yt = json_decode($link_youtube);?>
   @foreach($links_yt as $link)
   	<?php
   		
		$video_id = explode("?v=", $link);
		$video_id = $video_id[1];
	?>

	@if($video_id != $vid)
		 <a href="javascript:void(0);"><img id="p_video" data-vid="{!! $video_id !!}" data-id ="{!! $id !!}" style= "cursor:pointer;" src="http://img.youtube.com/vi/{!! $video_id !!}/mqdefault.jpg" alt=""></a>
		
	@else
	<a class="youtube-list-active" href="javascript:void(0);"><img  data-vid="{!! $video_id !!}" data-id ="{!! $id !!}" style= "cursor:pointer;" src="http://img.youtube.com/vi/{!! $video_id !!}/mqdefault.jpg" alt=""></a>
	@endif	
    @endforeach
   
</div>
