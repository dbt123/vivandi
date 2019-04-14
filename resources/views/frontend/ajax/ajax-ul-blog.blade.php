<?php $link_limit = 9;  ?>
<ul>
    <li><a class="d_cate" style=" cursor:pointer;" data-page="@if($post->currentPage() > 1) {{ $post->currentPage() - 1 }} @endif" >Trang trước</a></li>
    @for ($i = 1; $i <= $post->lastPage(); $i++)
        <?php
        $half_total_links = floor($link_limit / 2);
        $from = $post->currentPage() - $half_total_links;
        $to = $post->currentPage() + $half_total_links;
        if ($post->currentPage() < $half_total_links) {
           $to += $half_total_links - $post->currentPage();
        }
        if ($post->lastPage() - $post->currentPage() < $half_total_links) {
            $from -= $half_total_links - ($post->lastPage() - $post->currentPage()) - 1;
        }
        ?>
        @if ($from < $i && $i < $to)
            <li>
                <a class="d_cate {{ ($post->currentPage() == $i) ? 'number-page-active' : '' }}" style="cursor:pointer;" data-page="{{ $i }}"   href="{{ $post->url($i) }}">{{ $i }}</a>
            </li>
        @endif
  @endfor
   <li><a class="d_cate" style="cursor:pointer;" data-page="@if($post->currentPage() < $post->lastPage()) {{ $post->currentPage() + 1 }} @else {!! $post->currentPage() !!}  @endif">Trang kế</a></li>
</ul>
<div class="clearfix"></div>
