  <style type="text/css">
  .nav-text{
    font-size: 10pt;
    font-family: 'Roboto';
  }
  .nav-text::first-letter{
    text-transform: uppercase;
  }

</style>
  <ul class="nav" ui-nav>
   
    <li ui-sref-active="active">
      <a href="" ui-sref="app.dashboard">
        <span class="nav-icon">
          <i class="material-icons">&#xe3fc;<span ui-include="'{{ asset('backend/assets/images/i_1.svg') }}'"></span></i>
        </span>
        <span class="nav-text">Bảng quản trị</span>
      </a>
    </li>
    <li class="no-bg">
      <a href="{{ route('list.center.slide') }}">
      <span class="nav-icon"><i class="material-icons">&#xe7ef;</i></span>
      <span class="nav-text">Slide</span>
      </a>
    </li>
    <li class="no-bg">
      <a href="{{ route('build.center') }}">
      <span class="nav-icon"><i class="material-icons">&#xe7ef;</i></span>
      <span class="nav-text">Form công trình</span>
      </a>
    </li>

    <li class="no-bg">
      <a href="{{ route('center.order.list') }}">
      <span class="nav-icon"><i class="material-icons">&#xe7ef;</i></span>
      <span class="nav-text">Đơn hàng</span>
      </a>
    </li>

    <li class="no-bg">
      <a href="{{ route('center.pro.list') }}">
      <span class="nav-icon"><i class="material-icons">&#xe7ef;</i></span>
      <span class="nav-text">Sản phẩm</span>
      </a>
    </li>

    
  
    <!-- nhật phát bảo hành -->
    <!-- end nhật phát bảo hành -->
    <li class="no-bg">
      <a href="{{ route('info.center')}}">
      <span class="nav-icon"><i class="material-icons">&#xe853;</i></span>
      <span class="nav-text">Cá nhân</span>
      </a>
    </li>
    
   


    <li class="no-bg"><a href="{{ route('logout.center') }}"><span class="nav-icon"><i class="material-icons"></i></span> <span class="nav-text">Đăng xuất</span></a></li>
  </ul>