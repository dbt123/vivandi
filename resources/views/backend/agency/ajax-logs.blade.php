@foreach($logs as $key => $log)
	<div>
		<p><strong>Thời gian cập nhập</strong>:<?php $date = new DateTime($log->created_at);?>
        {{$date->format(' d/m H:i')}}</p>
		<p><strong>Tình trạng phản hồi</strong>:  
			@if($log->status == 1)
                        <span class="label"  style="background-color:#777777">Tiếp nhận</span>
                        @endif
                        @if($log->status == 2)
                        <span class="label"   style="background-color:#D9534F">Đang xử lý</span>
                        @endif
                        @if($log->status == 3)
                        <span class="label"   style="background-color:#0CC2AA">Hoàn thành</span>
                        @endif
        </p>
		<p><strong>Ghi chú</strong>: {{$log->note}}</p>
		@if($key != sizeof($logs) - 1)
		<hr>
		@endif
	</div>
@endforeach