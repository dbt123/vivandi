<?php
	$name = "";
	$count = 0;
?>
@foreach($filter_0 as $key => $item)
	@if(!in_array($item->name, $group_name))
		<?php $filter_h = App\Attribute::where('name',$item->name)->where('type',1)->first();?>
		@if($filter_h->isDelete == 0)
			@if($item->name != $name)
				<div class="content-right-tag">
	    			<h4>{!! $item->name !!}</h4>
			@endif
			@if(isset($filter_0[$key+1]))
				@if($filter_0[$key+1]->name != $filter_0[$key]->name)
						<h5 style="cursor:pointer" class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif" data-filter="{!! $item->id !!}">{!! $item->value !!}</h5>
					</div>
				@else
					<h5 style="cursor:pointer" class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif" data-filter="{!! $item->id !!}">{!! $item->value !!}</h5>
				@endif
			@else
				<h5 style="cursor:pointer" class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif" data-filter="{!! $item->id !!}">{!! $item->value !!}</h5>
				</div>
			@endif
		@else
			@if($item->name != $name)
				<div class="content-right-kieudang">
    				<h4>{!! $item->name !!}</h4>
			@endif
			@if(isset($filter_0[$key+1]))
				@if($filter_0[$key+1]->name != $filter_0[$key]->name)
						<a  href=""><img class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif"  data-filter="{!! $item->id !!}" style="width:63px;height:51px" src="{{asset($filter_0[$key]->img)}}" alt="{{asset($filter_0[$key]->img)}}"></a>
					</div>
				@else
					@if($key < 3)
						<a  href=""><img class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif"  data-filter="{!! $item->id !!}" style="width:63px;height:51px" src="{{asset($filter_0[$key]->img)}}" alt="{{asset($filter_0[$key]->img)}}"></a>
					@endif	
				@endif
			@else
					<a  href=""><img class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif"  data-filter="{!! $item->id !!}" style="width:63px;height:51px" src="{{asset($filter_0[$key]->img)}}" alt="{{asset($filter_0[$key]->img)}}"></a>
				</div>
			@endif
		@endif	
	@endif
	<?php $name = $item->name;?>
@endforeach

<?php $name_y = ""; ?>
@foreach($filter_y as $key => $item)
	@if(!in_array($item->name, $group_name))
		@if($item->name != $name_y)
			<div class="content-right-tag">
    			<h4>{!! $item->name !!}</h4>	            
		@endif
		@if(isset($filter_y[$key+1]))
			@if($filter_y[$key+1]->name != $filter_y[$key]->name)
					<h5 style="cursor:pointer" class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif" data-filter="{!! $item->id !!}">{!! $item->config_name !!}</h5>
				</div>
	    	@else
				<h5 style="cursor:pointer" class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif" data-filter="{!! $item->id !!}">{!! $item->config_name !!}</h5>
	    	@endif
		@else
				<h5 style="cursor:pointer" class="filter_click @if(in_array($item->id,$list_filter)) chucnag-active @endif" data-filter="{!! $item->id !!}">{!! $item->config_name !!}</h5>
			</div>	
		@endif
	@endif
	<?php $name_y = $item->name;?>
@endforeach