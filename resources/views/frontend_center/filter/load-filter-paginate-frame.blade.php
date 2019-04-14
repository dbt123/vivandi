<?php $link_limit = 9;  ?>
<ul>
    <li><a class="d_cate_click" style=" cursor:pointer;" data-page="@if($frames->currentPage() > 1) {{ $frames->currentPage() - 1 }} @endif">Trang trước</a></li>
    @for ($i = 1; $i <= $frames->lastPage(); $i++)
        <?php
        $half_total_links = floor($link_limit / 2);
        $from = $frames->currentPage() - $half_total_links;
        $to = $frames->currentPage() + $half_total_links;
        if ($frames->currentPage() < $half_total_links) {
           $to += $half_total_links - $frames->currentPage();
        }
        if ($frames->lastPage() - $frames->currentPage() < $half_total_links) {
            $from -= $half_total_links - ($frames->lastPage() - $frames->currentPage()) - 1;
        }
        ?>
        @if ($from < $i && $i < $to)
            <li>
                <a class="d_cate_click {{ ($frames->currentPage() == $i) ? 'number-page-active' : '' }}" style="cursor:pointer;" data-page="{{ $i }}" href="{{ $frames->url($i) }}">{{ $i }}</a>
            </li>
        @endif
  @endfor
   <li><a class="d_cate_click" style="cursor:pointer;" data-page="@if($frames->currentPage() < $frames->lastPage()) {{ $frames->currentPage() + 1 }} @else {!! $frames->currentPage() !!}  @endif">Trang kế</a></li>
</ul>
<div class="clearfix"></div>