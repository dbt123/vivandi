<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Attribute;
use App\ProductAttribute;
use App\Filter;
use App\FilterPrice;
use Redirect;
use App\CategoryProduct;
use App\TabAttribute;
use App\Product;
use App\ContentProduct;
use App\ProductImage;
use App\ProductInCategory;
use App\Order_agency;
use App\TagP;
use App\District;
use App\Agency;
use App\Transpost;
use App\Province;
use App\Customer;
use App\Order;
use App\Item;
use App\Tag_Product;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use DB;

use App\Frame;
use App\FrameImage;
use App\Configure_discounts;

class CustomerController extends Controller
{   
  //phong tim kiem khach hang
  public function Search(Request $req){
     $search =trim($req->cus);
    $o_a = Order_agency::leftjoin('orders','order_agencys.order_id','=','orders.id')->get();
    $in = array();
    foreach ($o_a as $key => $value) {
      array_push($in,$value->order_id);
    }
    $order = Order::whereNotIn('id',$in)->select('phone', DB::raw('count(*) as total'))->selectRaw('sum(total) as sum1, phone')->where('phone','like',"%$search%")->where('status','>',4)->groupby('phone')->orderby('id','asc')->paginate(10);
    return view('backend.customer.list-customer',['customer'=>$order,'s'=>$search,'status'=>0]);
  }
  public function listCustomer(Request $req){
    $search =trim($req->cus);
    $o_a = Order_agency::leftjoin('orders','order_agencys.order_id','=','orders.id')->get();
    $in = array();
    foreach ($o_a as $key => $value) {
      array_push($in,$value->order_id);
    }
    $order = Order::whereNotIn('id',$in)->select('phone', DB::raw('count(*) as total'))->selectRaw('sum(total) as sum1, phone')->where('status','>',4)->groupby('phone')->orderby('id','asc')->paginate(10);
    return view('backend.customer.list-customer',['customer'=>$order,'s'=>$search,'status'=>0]);
  }

  public function ajaxCustomerOrder(Request $req){
    $phone = $req->phone;
    $o_a = Order_agency::leftjoin('orders','order_agencys.order_id','=','orders.id')->get();
    $in = array();
    foreach ($o_a as $key => $value) {
      array_push($in,$value->order_id);
    }
    if($phone){
      $order = Order::whereNotIn('id',$in)->where('phone',$phone)->where('status','>',4)->get();
      $html = view('backend.customer.ajax-customer-order',['order'=>$order,'status'=>0]);
      return json_encode(array('status'=>true,'html'=>$html.""));
    }
  }
  public function ajaxCustomerOrderAgency(Request $req){
    $phone = $req->phone;
    $id = $req->agency;
    $agency = Agency::find($id);
    $customer = Order_agency::where('order_agencys.agency_id',$agency->id)->get();
    $in = array();
    foreach ($customer as $key => $value) {
      array_push($in,$value->order_id);
    }
    if($phone){
      $order = Order::whereIn('id',$in)->where('phone',$phone)->where('status','>',4)->get();
      $html = view('backend.customer.ajax-customer-order',['order'=>$order,'status'=>1]);
      return json_encode(array('status'=>true,'html'=>$html.""));
    }
  }

  //list
  public function AjaxListDiscounts(Request $req){
    $html = view('backend.customer.ajax-list-config');
    return json_encode(array('status'=>true,'html'=>$html.""));
  }

  public function ajaxConfigTichDiem(Request $req){
    $targets =  (float)$req->targets;
    $Configure_discounts = Configure_discounts::where('value','config_tichdiem')->first();
    if($Configure_discounts){
      if($targets < 100 && $targets >=0){
        $Configure_discounts->percent = $targets;
        $Configure_discounts->save();
        return json_encode(array('status'=>true));
      }else{
       return json_encode(array('status'=>false,'message'=>'Giá trị nhập vào phải lớn hơn 0 và nhỏ hơn 100')); 
      }
    }else{
      if($targets < 100 && $targets >=0){
        $config = new Configure_discounts;
        $config->percent = $targets;
        $config->value = 'config_tichdiem';
        $config->save();
        return json_encode(array('status'=>true));
      }else{
        return json_encode(array('status'=>false,'message'=>'Giá trị nhập vào phải lớn hơn 0 và nhỏ hơn 100')); 
      }
     
    }
  }

  public function DelConfigGiamGia(Request $req){
    $id = $req->id;
    $config_discounts = Configure_discounts::find($id);
    $config_discounts->delete();

    return json_encode(array('status'=>true));
  }
   
}
