<?php

namespace App\Http\Controllers\backend_center;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Agency;
use App\Contruct;
use App\Contruct_image;
use App\Contruct_content;
use App\Order;
use App\OrderItem;
use App\Order_agency;
use App\Agency_frame;
use App\OrderLogs;
use App\Frame;
use App\Email_General;
use Mail;
use App\System;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    //
    public function listorder(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status','<>',0)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }

  
    public function searchorder(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('id','like',"%$search%")->where('status','<>',0)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }
    public function listorderwait(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status',1)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }
    public function listorderx(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status',2)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }
    public function listorderxuly(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status',3)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }
    public function listordergh(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status',4)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }
    public function listordertt(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status',5)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }
    public function listordernh(Request $req){
        $search = trim($req->od);
        $id_order = Agency::where('id',session('center')->id)->first();
        $list = $id_order->OrderAgency()->get();
        $in2 = array();
        foreach ($list as $key => $value) {
            array_push($in2, $value->order_id);
        }
        $order = Order::wherein('id',$in2)->where('status',6)->orderby('created_at','desc')->paginate(5);
        return view('backend_center.page.listorder',['order'=>$order,'search'=>$search]);
    }

    public function getOrderadd(){
    	return view('backend_center.page.addorder');	
    }

    public function show($id=null)
    {
        $order = Order::find($id);
        if($order){
            return view('backend_center.page.show',['order'=>$order]);
        }else{        	
        	return redirect()->back();
        }
    }

    public function postOrderSearchadd(Request $req){
        $name = $req->key;
        // find product like $name = nsme
        $frame_id = Agency_frame::where('agency_id',session('center')->id)->get();
        $in = array();
        foreach ($frame_id as $fi){
        	array_push($in, $fi->frame_id);
        }

        $products  = Frame::whereIn('id',$in)->where(function($query) use ($name){
        	$query->where('name','like',"%$name%")->orwhere('code_frame','like',"%$name%");
        })->limit(15)->get();
        $html_search = view('backend_center.page.ajax-list-search',['product'=>$products]);
        return json_encode(array('status'=>true,'product'=>$products,'html_search'=>$html_search.''));
    }

    public function postOrderCheckadd(Request $req){
        $id = $req->id;
        $product = Frame::find($id);
            if(sizeof($product)){
              $html_check = view('backend_center.page.ajax-list-chon',['product'=>$product]);  
               return json_encode(array('status'=>true,'product'=>$product,'html_check'=>$html_check.''));
            }else{
                    return json_encode(array('status'=>false));
            } 
    }

    public function status(Request $req)
    {
        $order = Order::find($req->id);
        $order->status = 0;
        if($order->save()){
        	$order_agency = Order_agency::where('order_id',$order->id)->first();
        	$order_agency->delete();
        	return json_encode(array('status'=>true));
        }

    }

    public function infoOrderAgency(Request $req){
    	$id = $req->id;
        $order = Order::find($id);
        if(sizeof($order)){
            $view =  view('backend.orders.ajax-info-order',compact('order'));
            return json_encode(array('status'=>true,'order'=>$order,'innertext'=>$view.''));
        }
        return json_encode(array('status'=>false,'order'=>null));
    }

    public function postOrderadd(Request $req){
        $l_p = $req->productId;
        if($l_p == null){
            echo json_encode(array('status'=>false,'errors'=>0));
        }else{
	            $phone = preg_replace('/[^\dxX]/', '', $req->phone);
	            $x84 = substr($phone,0,2);
	            if($x84 == 84){
	                $phone = substr($phone,2);
	            }
	            $x0 = substr($phone,0,1);
	            if($x0 != 0){
	                $phone = "0".$phone;
	            }
	            $phone = $phone;
	            $order = new Order();
	            $order->fullname = $req->full_name;
	            $order->email = $req->email;
	            $order->phone = $phone;
	            $order->address = $req->address;
	            $order->note = $req->note;
	            $order->status = 1;
	            if($order->save()){

	            	$order_agency = new Order_agency;
                    $order_agency->agency_id = session('center')->id;
                    $order_agency->order_id = $order->id;
                    $order_agency->save();  

	                $size =  sizeof($req->productId);
	                $l_p = $req->productId;
	                $l_n = $req->productNum;
	                if($size > 0){
	                    $sum = 0; 
	                    for($i=0 ;$i<$size;$i++){
	                        $id_p = $l_p[$i];
	                        $num = $l_n[$i];
	                        if((int)$num > 0){
	                            $product = Frame::find($id_p); 
	                            if (sizeof($product)) {
	                                $OrderItem = new OrderItem;
	                                $OrderItem->product_id = $product->product_id;
	                                $OrderItem->frame_id = $product->id;
	                                $OrderItem->price = (int)$product->price;
	                                $OrderItem->price_sale = (int)$product->price_sale;
	                                $OrderItem->order_id = $order->id;
	                                $OrderItem->quantity = $num;
	                                if( (int)$product->price_sale ){
	                                  $sum += $num*( (int)$product->price_sale ) ;
	                                }else{
	                                $sum += $num*( (int)$product->price) ;
	                                }
	                                $OrderItem->save();
	                            }
	                        }    
	                    }
	                    $order->total = $sum;
	                    $order->save();
	                }
	                ignore_user_abort(true);
	                set_time_limit(3000);
	                ob_start();
	                $link = route('center.order.show',['id'=>$order->id]);
	                echo json_encode(array('status'=>true,'link'=>$link,'message'=>'Thêm Đơn Hàng Thành Công'));
	                $size = ob_get_length();
	                header('Connection: close');
	                header('Content-Length: '.$size);
	                header("Content-Range: 0-".($size-1)."/".$size);
	                ob_flush();
	                flush();
	                 $email_domain = Agency::where('id',session('center')->id)->first();
                    $mail = System::select('email_send','email_password')->first();
                    if ($email_domain) {
                        config(['mail.username' => $mail->email_send]);
                        config(['mail.password' => $mail->email_password]);
                        config(['mail.port' => "587"]);
                        config(['mail.host' => "smtp.gmail.com"]);
                        config(['mail.encryption' => "tls"]);
                        $orderItem = OrderItem::where('order_id',$order->id)->leftjoin('frames','order_items.frame_id','=','frames.id')->get(); 
                        $data = array('order'=>$order,'orderItem'=>$orderItem);
                        if($email_domain->email){
                                 $data['status'] = "Admin";
                                Mail::send('backend.email.email-new-order',$data, function($message) use ($mail,$email_domain,$order){
                                $message->from($mail->email_send);
                                $message->to($email_domain->email, 'Quản trị')->subject(" Có đơn hàng mới "."#".$order->id);
                            });
                        }
                        if($order->email){
                            $data['status'] = "Khách hàng";
                                Mail::send('backend.email.email-new-order',$data, function($message) use ($mail,$order){
                                $message->from($mail->email_send);
                                $message->to($order->email, 'Hệ Thống')->subject("[".url('')."] Xác nhận đơn hàng "."#".$order->id);    
                            });
                        }
	                $link = route('center.order.show',['id'=>$order->id]);
	                echo json_encode(array('status'=>true,'link'=>$link,'message'=>'Thêm Đơn Hàng Thành Công')); 
	                }
	            }
	    
            // }
        } 
    }

    public function saveOrderAgency(Request $req){
    	$session = session('center');
    	$id = $req->id;
        $status = $req->status;
        $note_stick = $req->note_stick;
        $order = Order::find($id);
        if(sizeof($order)){
        	$last_status =    $order->status;
            $log = new OrderLogs;
            $log->status = $req->status;
            $log->note_stick = $req->note_stick;
            $log->order_id = $order->id;
            $log->user_id = $session->id;
            $log->save();
            $order->status = $status;  
            $order->note_stick = $note_stick;
            if($order->save()){
            	ignore_user_abort(true);
                set_time_limit(3000);
                ob_start();
                echo $order->status;
                $size = ob_get_length();
                header('Connection: close');
                header('Content-Length: '.$size);
                header("Content-Range: 0-".($size-1)."/".$size);
                ob_flush();
                flush();

                // đang xử lí
                if($order->status == 3 ){
                    try {
                        $mail = System::select('email_send','email_password')->first();
                        if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                            config(['mail.username' => $mail->email_send]);
                            config(['mail.password' => $mail->email_password]);
                            config(['mail.port' => "587"]);
                            config(['mail.host' => "smtp.gmail.com"]);
                            config(['mail.encryption' => "tls"]);
                            $data = ['order'=>$order];
                            if($order->email){
                                    Mail::send('backend.email.email-bi-huy',$data, function($message) use ($mail,$order){
                                    $message->from($mail->email_send);
                                    $message->to($order->email, 'Quản trị')->subject("[".url('')."] Thông báo đơn hàng đang xử lý"." #".$order->id);
                                });
                            }
                        }  
                    }catch (Exception $e) { 
                        
                    }
                }
                //end đang xử lí
                 // đang giao hàng
                if($order->status == 4 ){
                    try {
                        $mail = System::select('email_send','email_password')->first();
                        if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                            config(['mail.username' => $mail->email_send]);
                            config(['mail.password' => $mail->email_password]);
                            config(['mail.port' => "587"]);
                            config(['mail.host' => "smtp.gmail.com"]);
                            config(['mail.encryption' => "tls"]);
                            $data = ['order'=>$order];
                            if($order->email){
                                    Mail::send('backend.email.email-bi-huy',$data, function($message) use ($mail,$order){
                                    $message->from($mail->email_send);
                                    $message->to($order->email, 'QTV')->subject("[".url('')."] Thông báo đang giao hàng"." #".$order->id);
                                });
                            }
                        }  
                    }catch (Exception $e) { 
                        
                    }
                }
                // end đang giao hàng
                // neu thanh toan
                if($order->status == 5 && $last_status != 5){
                    try {
                        $mail = System::select('email_send','email_password')->first();
                        if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                            config(['mail.username' => $mail->email_send]);
                            config(['mail.password' => $mail->email_password]);
                            config(['mail.port' => "587"]);
                            config(['mail.host' => "smtp.gmail.com"]);
                            config(['mail.encryption' => "tls"]);
                            $data = ['order'=>$order];
                            if($order->email){
                                    Mail::send('backend.email.thanh-toan',$data, function($message) use ($mail,$order){
                                    $message->from($mail->email_send);
                                    $message->to($order->email, 'QTV')->subject("[".url('')."] Xác nhận thanh toán đơn hàng"." #".$order->id);
                                });
                            }
                        }  
                    }catch (Exception $e) {

                    }

                    $order_item = OrderItem::where('order_id',$order->id)->get();
                    foreach ($order_item as $key => $value) {
                    	$frame = Frame::find($value->frame_id);
                        $agency_frame = Agency_frame::where('frame_id',$value->frame_id)->where('agency_id',$session->id)->first();
                        if($value->frame_id > 0){
                            $agency_frame->sku_frame_agency = $agency_frame->sku_frame_agency - $value->quantity;
                            if($agency_frame->save()){
                                if($agency_frame->sku_frame_agency <= 10){
                                   try {
                                        $mail = System::select('email_send','email_password')->first();
                                        if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                                            config(['mail.username' => $mail->email_send]);
                                            config(['mail.password' => $mail->email_password]);
                                            config(['mail.port' => "587"]);
                                            config(['mail.host' => "smtp.gmail.com"]);
                                            config(['mail.encryption' => "tls"]);
                                            $data = ['frame' => $frame,'agency_frame'=>$agency_frame];
                                            if($session->email){
                                            	$data['statu'] = "agency";
                                                    Mail::send('backend.email.het-hang',$data, function($message) use ($mail,$session,$frame){
                                                    $message->from($mail->email_send);
                                                    $message->to($session->email, 'Admin')->subject(url('')." Sắp hết sản phẩm ".$frame->name);
                                                });
                                            }
                                        }  
                                    }catch (Exception $e) { 
                                    }
                                }
                            }
                        }
                    }
                }
                // đã nhận hàng
                // đã nhận hàng
                if($order->status == 6 ){
                    try {
                        $mail = System::select('email_send','email_password')->first();
                        if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                            config(['mail.username' => $mail->email_send]);
                            config(['mail.password' => $mail->email_password]);
                            config(['mail.port' => "587"]);
                            config(['mail.host' => "smtp.gmail.com"]);
                            config(['mail.encryption' => "tls"]);
                            $data = ['order'=>$order];
                            if($order->email){
                                    Mail::send('backend.email.email-bi-huy',$data, function($message) use ($mail,$order){
                                    $message->from($mail->email_send);
                                    $message->to($order->email, 'QTV')->subject("[".url('')."] Thông báo đã nhận hàng"." #".$order->id);
                                });
                            }
                        }  
                    }catch (Exception $e) { 
                        
                    }
                }
                // end đã nhận hàng
                // neu bi huy
                if($last_status == 5){
                      if($order->status == 2){
                        $order_item = OrderItem::where('order_id',$order->id)->get();
                        foreach ($order_item as $key => $value2) {
                        	$agency_frame = Agency_frame::where('frame_id',$value2->frame_id)->where('agency_id',$session->id)->first();
                            $agency_frame->sku_frame_agency = $agency_frame->sku_frame_agency + $value2->quantity;
                            if($agency_frame->save()){
                                try {
                                    $mail = System::select('email_send','email_password')->first();
                                    if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                                        config(['mail.username' => $mail->email_send]);
                                        config(['mail.password' => $mail->email_password]);
                                        config(['mail.port' => "587"]);
                                        config(['mail.host' => "smtp.gmail.com"]);
                                        config(['mail.encryption' => "tls"]);
                                        $data = ['order'=>$order];
                                        if($order->email){
                                                Mail::send('backend.email.email-bi-huy',$data, function($message) use ($mail,$order){
                                                $message->from($mail->email_send);
                                                $message->to($order->email, 'Quản trị')->subject("[".url('')."] Thông báo đơn hàng bị hủy"." #".$order->id);
                                            });
                                        }
                                    }  
                                }catch (Exception $e) { 
                                    
                                }
                            }
                        }
                    }
                }
                // end huy
                ###
            }
        }
    }
}
