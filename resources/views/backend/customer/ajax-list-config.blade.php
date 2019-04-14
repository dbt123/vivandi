<?php $Configure_discounts = App\Configure_discounts::where('value','config_tichdiem')->first();
?>
<form method="post" id="d-popup-config-tichdiem">
   <div class="modal-header">
     <table>
        <tbody>
          <tr>
             <td style="width: 98%;"><h5 class="modal-title">Cấu hình giảm giá</h5></td>
             <td><button>Lưu</button></td>
          </tr>
        </tbody>
     </table>
   </div>
   @if($Configure_discounts)
      <div class="modal-body p-lg">
        <p style="  margin-bottom: 10px; ">Khi khách hàng share Facebook sẽ được giảm %:</p>
        <input type="text" placeholder="Nhập % giảm giá" name="targets" value="{!! $Configure_discounts->percent !!}" style="width: 100%;height: 38px;font-size: 10pt !important;border: 1px solid #E7E7E7 !important;padding-left: 10px;padding-right: 10px;margin-bottom: 10px;">
        <input type="hidden" name="id" value="{!! $Configure_discounts->id !!}">
        <div id="d_err" style="color:#E53E31;display:none;"></div>
      </div>
    @else
      <div class="modal-body p-lg">
        <p style="  margin-bottom: 10px; ">Khi khách hàng share Facebook sẽ được giảm %:</p>
        <input type="text" placeholder="Nhập % giảm giá" value="" name="targets" style="width: 100%;height: 38px;font-size: 10pt !important;border: 1px solid #E7E7E7 !important;padding-left: 10px;padding-right: 10px;margin-bottom:10px;">
        <div id="d_err" style="color:#E53E31;display:none;"></div>
      </div>
   @endif   
</form>