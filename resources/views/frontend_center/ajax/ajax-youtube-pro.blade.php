@if ($link_youtube)
<?php 
	$links_yt = json_decode($link_youtube);
	
?>
<div class="youtube-playing" id="id_video">
@foreach($links_yt as $link)

	<?php
   		
		$video_id = explode("?v=", $link);
		$video_id1 = $video_id[1];
	?>
    <iframe src="https://www.youtube.com/embed/{{$video_id1}}" frameborder="0" allowfullscreen></iframe>
    <?php
    	break;
    ?>

@endforeach
</div>
<div class="youtube-list">
	<p>Danh sách video hướng dẫn lắp đặt</p>
   <?php $links_yt = json_decode($link_youtube);?>
   @foreach($links_yt as $link)
   	<?php
   		
		$video_id = explode("?v=", $link);
		$video_id = $video_id[1];
	?>
	@if($video_id == $video_id1)
		<a class="youtube-list-active" href="javascript:void(0);"><img  style= "cursor:pointer;" src="http://img.youtube.com/vi/{!! $video_id !!}/mqdefault.jpg" alt=""></a>
	@else
	<a href="javascript:void(0);"><img id="p_video" data-vid="{!! $video_id !!}" data-id ="{!! $id !!}" style= "cursor:pointer;" src="http://img.youtube.com/vi/{!! $video_id !!}/mqdefault.jpg" alt=""></a>
	@endif	
    @endforeach
   
</div>
@endif
