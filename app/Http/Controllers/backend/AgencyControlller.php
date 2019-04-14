<?php
namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Product;
use App\Frame;
use App\Item;
use App\System;
use App\Agency;
use App\Agency_frame;
use App\Email_General;
use App\Feedback;
use App\Feedback_Image;
use App\Order;
use App\Order_agency;
use App\EventSale;
use Mail;
use DateTime;
use DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;


class AgencyControlller extends Controller
{
	//thongke
    public function ReAgency(Request $req){
        $search = trim($req->search);
        $list_agencys = Agency::orderby('id','desc')->paginate(10);
        return view('backend.agency.re-agency',['list_agencys'=>$list_agencys,'search'=>$search]);
    }

    public function SearchReAgency(Request $req){
        $search = trim($req->search);
        $list_agencys = Agency::where('name_agency','like',"%$search%")->orderby('id','desc')->paginate(10);
        return view('backend.agency.re-agency',['list_agencys'=>$list_agencys,'search'=>$search]);   
    }
    
    public function ListAgency(Request $req){
        $list_agencys = Agency::orderby('id','desc')->get();
        return view('backend.agency.list-daily',['list_agencys'=>$list_agencys]);
    }
    public function SearchAgency(Request $req){
        $search = trim($req->search);
        $list_agencys = Agency::where('email','like',"%$search%")->orwhere('phone','like',"%$search%")->orwhere('subdomain','like',"%$search%")->orwhere('name_agency','like',"%$search%")->orderby('created_at','desc')->get();
        return view('backend.agency.list-daily',['list_agencys'=>$list_agencys]);
    }

    public function AddAgency(Request $req){
        return view('backend.agency.add-agency');
    }

    public function EditAgency($slug=null,$id){
        $str = $slug."-".$id;
        $arr = explode("-",$str);
        $id = $arr[sizeof($arr)-1];
        $slug = substr($str,0,strlen($str) - strlen($id)-1);
        $agency = Agency::where('id',$id)->first();
        if($agency){
            if(!$agency->add_1 == $slug){
                return redirect('/');
            }else{
                return view('backend.agency.edit-agency',['agency'=>$agency]);
            }
        }else{
            return view('errors.404');
        }
    }

    public function PostEditAgency(Request $req){
        $name_agency = $req->name_agency;
        $representative = $req->representative;
        $do = $req->domain;
        $doma = vn_str_filter($do);
        $domain = preg_replace("#[^a-z0-9]#","", $doma);
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
        $email = trim($req->email);
        $password = $req->password;
        $location = $req->location;
        $search_location = $req->address;
        $id = $req->agency_id;
        $agency = Agency::find($id);
        $d_do = Agency::where('subdomain',$domain)->first();
        $e_email = Agency::where('email',$email)->first();
        if($e_email && $e_email->id != $agency->id){
            return redirect()->back()->with('error','Email này đã tồn tại . Vui lòng chọn Email khác ');
        }else{
            if($d_do && $d_do->id != $agency->id){
                return redirect()->back()->with('error','Subdomain này đã tồn tại . Vui lòng chọn subdomain khác ');
            }else{
                
                $agency->name_agency = $name_agency;
                $agency->add_1 = str_slug($name_agency);
                $agency->representative = $representative;
                $agency->subdomain = $domain;
                $agency->phone = $phone;
                $agency->email = $email;
                $agency->address_agency = $search_location;
                $agency->location = $location;
                if($password == $agency->password){

                }else{
                    $agency->password = md5($password);
                }
                $agency->status = $agency->status;
                $agency->save();
                return redirect()->route('list.dai.ly')->with('success','Sửa thành công'); 
            }
        }
    }

    public function DelAgency(Request $req){
        $id = $req->id;
        $agency = Agency::find($id);
        if($agency->getFrame()->count()){
            $agency->getFrame()->delete();
        }
        $agency->delete();
        echo "true";
    }

    public function PostCreateAgency(Request $req){
    	$name_agency = $req->name_agency;
    	$representative = $req->representative;
    	$do = $req->domain;
        $doma = vn_str_filter($do);
        $domain = preg_replace("#[^a-z0-9]#","", $doma);
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
    	$email = trim($req->email);
    	$password = $req->password;
    	$location = $req->location;
    	$search_location = $req->address;
        $d_do = Agency::where('subdomain',$domain)->first();
        $e_email = Agency::where('email',$email)->first();
        if($e_email){
            return redirect()->route('add.agency')->with('error','Email này đã tồn tại . Vui lòng chọn Email khác ')->withInput(Input::flash());
        }else{
            if($d_do){
                return redirect()->route('add.agency')->with('error','Subdomain này đã tồn tại . Vui lòng chọn subdomain khác ')->withInput(Input::flash());
            }else{
              if(empty($location)){
                return redirect()->route('add.agency')->with('error','Bạn phải chọn địa chỉ đại lý trên google maps')->withInput(Input::flash());
                }else{
                    $agency = new Agency;
                    $agency->name_agency = $name_agency;
                    $agency->add_1 = str_slug($name_agency);
                    $agency->representative = $representative;
                    $agency->subdomain = $domain;
                    $agency->phone = $phone;
                    $agency->email = $email;
                    $agency->address_agency = $search_location;
                    $agency->location = $location;
                    $agency->password = md5($password);
                    $agency->status = 0;
                    $agency->save();
                    return redirect()->route('list.dai.ly')->with('success','Thêm thành công');
                }  
            }
        }
    }

    public function ChangeAgency(Request $req){
        $id = $req->id;
        $status = $req->status;
        $agency = Agency::find($id);
        if($agency){
            if($agency->status == 1){
                $agency->status = 0;
                $agency->save();
                return json_encode(array('status'=>true,'agency'=>$agency,'sta'=>0));
            }else{
                $agency->status = 1;
                $agency->save();
                return json_encode(array('status'=>true,'agency'=>$agency,'sta'=>1));
            }
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function FrameAgencyList($slug=null, $id){
        $string = $slug."-".$id;
        $arr = explode("-",$string);
        $id  = $arr[sizeof($arr)-1];
        $slug = substr($string,0,strlen($string) - strlen($id)-1);
        $agency = Agency::find($id);
        $search = '';
        if($agency){
            if(!$agency->add_1 == $slug){
                return redirect('/');
            }else{
                $list = $agency->getFrame()->get();
                $arr = array();
                foreach ($list as $key => $value) {
                    array_push($arr, $value->frame_id);
                }
                $frame = Frame::whereIn('frames.id',$arr)->where('agency_frames.agency_id',$agency->id)->leftjoin('agency_frames','frames.id','=','agency_frames.frame_id')->select('frames.*','agency_frames.sku_frame_agency')->where('frames.status',1)->orderby('frames.updated_at','desc')->paginate(15);
                return view('backend.agency.frame-agency-list',['agency'=>$agency,'frame'=>$frame,'search'=>$search]);
            }
        }else{
            return view('errors.404');
        }
    }

    public function SearchListFrameAgency(Request $req,$slug=null, $id){
        $string = $slug."-".$id;
        $arr = explode("-",$string);
        $id  = $arr[sizeof($arr)-1];
        $slug = substr($string,0,strlen($string) - strlen($id)-1);
        $agency = Agency::find($id);
        $search = trim($req->search);
        if($agency){
            if(!$agency->add_1 == $slug){
                return redirect('/');
            }else{
                $list = $agency->getFrame()->get();
                $arr = array();
                foreach ($list as $key => $value) {
                    array_push($arr, $value->frame_id);
                }
                $frame = Frame::whereIn('id',$arr)->where(function($query) use ($search){
                    $query->where('name','like',"%$search%")->orwhere('code_frame','like',"%$search%");
                })->where('status',1)->orderby('updated_at')->paginate(10);
                return view('backend.agency.frame-agency-list',['agency'=>$agency,'frame'=>$frame,'search'=>$search]);
            }
        }else{
            return view('errors.404');
        }
    }

    public function AjaxSearchFrameAgency(Request $req){
        $val = $req->val;
        $id = $req->id;
        $agency = Agency::find($id);
        $frame_agen = $agency->getFrame()->get();
        $arr = array();
        foreach ($frame_agen as $key => $value) {
            array_push($arr,$value->frame_id);
        }
        $frame = Frame::whereNotIn('id',$arr)->where(function($query) use ($val){
            $query->where('name','like',"%$val%")->orwhere('code_frame','like','%$val%');
        })->where('status',1)->limit(10)->get();
        if($val != "" && sizeof($frame) > 0){
            $html = view('backend.agency.ajax-search-frame-agency',['frame'=>$frame]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function SubmitFrameAgency(Request $req){
        $id = $req->id;
        $frame_agenc = $req->frame_agency;
        $agency = Agency::find($id);
        if($agency){
            for ($i=0; $i < sizeof($frame_agenc) ; $i++) { 
                $frame_agency = new Agency_frame;
                $frame_agency->agency_id = $agency->id;
                $frame_agency->frame_id = $frame_agenc[$i];
                $frame_agency->save();
            }
                return json_encode(array('status'=>true));
        }else{
                return json_encode(array('status'=>false));
        }
    }

    public function DelFrameAgency(Request $req){
        $id = $req->id;
        $id_agency = $req->agency;
        $agency = Agency::find($id_agency);
        $list_age = $agency->getFrame()->get();
        foreach ($list_age as $key => $item){
            if($item->frame_id == $id){
                $frame = Frame::find($id);
                $frame->sku = $frame->sku + $item->sku_frame_agency;
                $frame->save();
                $item->delete();
            }
        }
        echo "true";
    }

    public function AjaxEditFrameAgencySku(Request $req){
        $id = $req->id;
        $id_agency = $req->id_agency;
        $val = preg_replace('/[^\dxX]/', '', $req->sku);
        $frame = Frame::find($id);
        if($frame){
            if($val >= $frame->sku){
                return json_encode(array('status'=>false,'message'=>'Số lượng nhập kho đại lý phải nhỏ hơn số lượng tổng kho'));
            }else{
                $agency = Agency_frame::where('frame_id',$id)->where('agency_id',$id_agency)->first(); 
                $agency->sku_frame_agency = $agency->sku_frame_agency + $val;
                if($agency->save()){
                    $frame->sku = $frame->sku - $val;
                    if($frame->save()){
                        $email_hethang = Email_General::where('name','Config Hết Hàng')->first();
                        if(!$email_hethang){
                                return json_encode(array('status'=>true));
                            }else{
                                if($frame->sku <= $email_hethang->config_sku ){
                                    ignore_user_abort(true);
                                    set_time_limit(3000);
                                    ob_start();
                                    echo json_encode(array('status'=>true));
                                    $size = ob_get_length();
                                    header('Connection: close');
                                    header('Content-Length: '.$size);
                                    // header("Content-Range: 0-".($size-1)."/".$size);
                                    ob_flush();
                                    flush();
                                    $mail = System::select('email_send','email_password')->first();
                                    config(['mail.username' => $mail->email_send]);
                                    config(['mail.password' => $mail->email_password]);
                                    config(['mail.port' => "587"]);
                                    config(['mail.host' => "smtp.gmail.com"]);
                                    config(['mail.encryption' => "tls"]);
                                    $data = ['frame' => $frame];
                                        if($email_hethang->email){
                                            $data['statu'] = "admin";
                                            Mail::send('backend.email.het-hang',$data, function($message) use ($mail,$email_hethang,$frame){
                                            $message->from($mail->email_send);
                                            $message->to($email_hethang->email, 'Admin')->subject(url('')." Sắp hết sản phẩm ".$frame->name);
                                            });
                                        }
                                    
                                }else{
                                    return json_encode(array('status'=>true));
                                }
                            }
                        }
                    }
                    
                }        
            }else{
            return json_encode(array('status'=>false));
        }
    }

    public function ChangeAgencyPercent(Request $req){
        $id = $req->id;
        $agency = Agency::find($id);
        if($agency){
            if($agency->level == 0 ){
                $agency->level = 1;
            }else{
                $agency->level = 0;
            }
            $agency->save();
            return json_encode(array('status'=>true)); 
        }else{  
           return json_encode(array('status'=>flase)); 
        }

    }
    public function ChangeAgencyEvent(Request $req){
        $event = $req->event;
        $agency_id = $req->agency;
        $agency = Agency::find($agency_id);
        if($agency){
            if($event == 0){
                $agency->event_active = 0;
                $agency->save();
                return json_encode(array('status'=>true));
            }else{
                $agency->event_active = $event;
                $agency->save();
                return json_encode(array('status'=>true));
            }
        }else{
            return json_encode(array('status'=>false));
        }
        
    }
    public function ListFeeback(Request $req){
        $list = Feedback::orderby('id','desc')->paginate(15);
        $search = '';
        return view('backend.agency.list-feedback',['list'=>$list,'search'=>$search]);
    }

    public function SearchFeedback(Request $req){
        $search = trim($req->search);
        $list = Feedback::where('name_agency','like',"%$search%")->orwhere('phone_agency','like','%$search%')->orwhere('address_agency','like','%$search%')->orderby('id','desc')->paginate(15);
        return view('backend.agency.list-feedback',['list'=>$list,'search'=>$search]);
    }

    public function Feedback1(Request $req){
        $id = $req->id;
        $feedback = Feedback::find($id);
        if($feedback){
            $html = view('backend.agency.ajax_feedback1',['feedback'=>$feedback]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }else{
            return json_encode(array('status'=>false));
        }
    }
    public function Feedback2(Request $req){
        $id = $req->id;
        $feedback = Feedback::find($id);
        if($feedback){
            $html = view('backend.agency.ajax_feedback2',['feedback'=>$feedback]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function Feedback3(Request $req){
        $id = $req->id;
        $feedback = Feedback::find($id);
        if($feedback){
            $list_image = $feedback->getImage()->get();
            $html = view('backend.agency.ajax_feedback3',['list_image'=>$list_image]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function Feedback4(Request $req){
        $id = $req->id;
        $status = $req->log;
        $note = $req->txt;

        $feedback = Feedback::find($id);
        if($feedback){
            $date = new DateTime();
            $result = $date->format('Y-m-d H:i:s');
            $array = array('feedback_id'=>$id,'note'=>$note,'status'=>$status,'created_at'=>$result,'updated_at'=>$result);
            $x = DB::table('feedback_logs')->insert($array);
            $feedback->status = $status;
            $feedback->save();
            
            if($x){
             return json_encode(array('status'=>true));
                
            }else{
             return json_encode(array('status'=>false));

            }
            // if($feedback->status == 0){
            //     $feedback->status = 1;
            //     $feedback->save();
            //     return json_encode(array('status'=>true,'stt'=>1));
            // }else{
            //     $feedback->status = 0;
            //     $feedback->save();
            //     return json_encode(array('status'=>true,'stt'=>0));
            // }
        }else{
            return json_encode(array('status'=>false));
        }
    }
    public function getFeedBackLogs(Request $req){
        $id = $req->id;
        $feedback = Feedback::find($id);
        if($feedback){
            $logs = DB::table('feedback_logs')->where('feedback_id',$feedback->id)->orderby('id','desc')->get();
            $log_html = view('backend.agency.ajax-logs',compact('logs','feedback'));
            return json_encode(array('status'=>true,'feedback'=>$feedback,'feedback_log'=>$logs,'log_html'=>$log_html.''));
        }else{
            return json_encode(array('status'=>false));
        }
    }
    public function Feedback5(Request $req){
        $id = $req->id;
        $feedback = Feedback::find($id);
        if($feedback){
            $feedback->delete();
            return json_encode(array('status'=>true));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    //donhang
    public function AgencyListOrder(Request $req){
         $s = trim($req->od);
         $id=null;
         $ag=null;
         return view('backend.agency.agency-order',compact('ag','id','s'));
    }

    public function AgencyOrdershow($id=null)
    {
            $order = Order::find($id);
            if($order){
                return view('backend.agency.showorder', compact('order'));  
            }
            return redirect()->back();
    }

    public function AgencyOrderlist_type($id=null){
        return view('backend.agency.agency-order',compact('id'));   
    }

    public function AgencyOrderlist_agency($ag=null){
        return view('backend.agency.agency-order',compact('ag'));   
    }

    public function AgencysearchOrder(Request $req){
        $s = trim($req->od);
        $id = substr($s,1);
        $list_order = Order_agency::leftjoin('orders','orders.id','=','order_agencys.order_id')->get();
          $in = array();
          foreach ($list_order as $key => $item) {
            array_push($in,$item->order_id);
          }

        $list_orders = Order::whereIn('id',$in)->where(function($query) use ($s,$id){
            $query->where('id','like',"%$id%")->orwhere('phone','like',"%$s%")->orwhere('fullname','like',"%$s%");
        })->orderby('created_at','desc')->paginate(10);
          
            $id=null;
            $ag=null;
            $a=1;
            return view('backend.agency.agency-order',compact('ag','id','list_orders','a','s'));
        
    }
    
    // thongke181
    public function AjaxAgencystatic(Request $req){
        
        $arr1 = explode("/",$req->day1);
        $arr2 = explode("/",$req->day2);
        if ((sizeof($arr1) != 3)){
            return json_encode(array('status'=>true,'errors'=>2));   
        }
        if ((sizeof($arr2) != 3)){
            return json_encode(array('status'=>true,'errors'=>2));   
        }
        $id = $req->agency;

        if (sizeof($id)>0){
            $arr =$id[0];
            for ($i=1;$i<sizeof($id);$i++){
                $arr=$arr."-".$id[$i];
            }
        }else{
            $arr = "all";
        }
        
        $link = route('agency.static',['year1'=>$arr1[2],'month1'=>$arr1[0],'day1'=>$arr1[1],'year2'=>$arr2[2],'month2'=>$arr2[0],'day2'=>$arr2[1],'id'=>$arr]);
        return json_encode(array('status'=>true,'errors'=>0,'link'=>$link));   
    } 

    public function Agencystatic($year1=null,$month1=null,$day1=null,$year2=null,$month2=null,$day2=null,$id=null,Request $req){
        $search = trim($req->search);
        $item = Agency::where('id',$id)->first();
        $dday1 = $year1.'-'.$month1.'-'.$day1;
        $dday2 = $year2.'-'.$month2.'-'.$day2;
        if ($id != "all"){
            $arr = explode('-', $id);
            $item = Agency::whereIn('id',$arr)->paginate(10);
        }
        else{
            $item = Agency::paginate(10);   
        }
        return view('backend.agency.static',['list_agencys'=>$item,'search'=>$search,'dday1'=>$dday1,'dday2'=>$dday2]);
    }
    public function event(){
        return view('backend.agency.event-list');
    }
    public function createEvent(){
        return view('backend.agency.event');
    }
    public function createEventPost(Request $req){
        $name = $req->name;
        $typeSale = $req->typeSale;
        
        $share = $req->fbshare;
        $mdiscount = $req->mdiscount;
        $mmin = $req->mmin;
        $percent = $req->percent;
        $dstart = $req->dstart;
        $dend = $req->dend;
        if(! trim($name)){
             return json_encode(array('status'=>false,'msg'=>"Phải có tên của event"));
        }
        if ($this->validateDate($dstart) == false) {
            return json_encode(array('status'=>false,'msg'=>"Lỗi định ngày bắt đầu, ví dụ 31-01-2016"));
        }
        if ($this->validateDate($dend) == false) {
            return json_encode(array('status'=>false,'msg'=>"Lỗi định ngày kết thúc, ví dụ 31-01-2016"));
        }
        $timestamp1 = strtotime($dstart);
        $timestamp2 = strtotime($dend);
        if($timestamp1 > $timestamp2){
            return json_encode(array('status'=>false,'msg'=>"Ngày bắt đầu phải nhỏ hơn ngày kết thúc."));
        }
        
        
        if($typeSale == 1){
            // loại 1 trừ tiền
            
            if( ( (int)$mdiscount < (int)$mmin ) && ((int)$mdiscount > 0)){
            }else{
                 return json_encode(array('status'=>false,'msg'=>"Số tiền không hợp lệ"));
            }
            $EventSale =  new EventSale;
            $EventSale->share =  $share;
            $EventSale->start_day =  $dstart;
            $EventSale->end_day =  $dend;
            
            $EventSale->type =  1;
            $EventSale->money_sale =  $mdiscount;
            $EventSale->money_min =  $mmin;
            $EventSale->name =  $req->name;
            if($req->description) $EventSale->description =  $req->description;
            $EventSale->save();
            return json_encode(array('status'=>true,'data'=>$EventSale));
        }else{
            if((float)$percent >= 100 || (float)$percent <= 0){
                return json_encode(array('status'=>false,'msg'=>"Phần trăm giảm giá từ 1 đến 99"));
            }
            // loại 0 giảm theo phần trăm
            $EventSale =  new EventSale;
            $EventSale->share =  $share;
            $EventSale->start_day =  $dstart;
            $EventSale->end_day =  $dend;
            
            $EventSale->type =  0;
            $EventSale->percent =  (float)$percent;
            $EventSale->name =  $req->name;
            if($req->description) $EventSale->description =  $req->description;
            $EventSale->save();
            return json_encode(array('status'=>true,'data'=>$EventSale));
        }

    }
    public function ChangeStatusEvent(Request $req){
        $id = $req->id; 
        $status = $req->status;
        $event = EventSale::find($id);
        if($event){
            if($status == 0){
                $event->status = 1;
                $event->save();
                return json_encode(array('status'=>true,'sta'=>1,'event'=>$event));
            }
            if($status == 1){
                $event->status = 0;
                $event->save();
                return json_encode(array('status'=>true,'sta'=>0,'event'=>$event));

            }
        }else{
            return json_encode(array('status'=>false));
        }
    }
    public function ClearStatusEvent(Request $req){
        $id = $req->id; 
        $event = EventSale::find($id);
        if($event){
            // check event:
            $curdate = date("d-m-Y");
            $startdate = $event->start_day;
            $end_day = $event->end_day;
            $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
            $timestamp_c = $dtime1->getTimestamp();
            $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
            $timestamp_s = $dtime2->getTimestamp();
            $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
            $timestamp_e = $dtime3->getTimestamp();
            if($timestamp_c > $timestamp_s && $timestamp_c < $timestamp_e){
                $x = Order::where('event',$event->id)->first();
                if($x){
                    return json_encode(array('status'=>false,'msg'=>"Event Đang trong thời gian hoạt động"));
                }else{
                    $event->status = -1;
                    $event->save();
                    Agency::where('event_active',$event->id)->update(array('event_active'=>0));
                    return json_encode(array('status'=>true,'event'=>"2"));
                }
            }else{
                $event->status = -1;
                $event->save();
                Agency::where('event_active',$event->id)->update(array('event_active'=>0));
                return json_encode(array('status'=>true,'event'=>"1"));
                
            }
           
        }else{
            return json_encode(array('status'=>false,'msg'=>"Event không tồn tại"));
        }
    }
    public function ActiveEventVivandi(Request $req){
        $id = $req->id;
        $active = $req->active;
        
        $event = EventSale::find($id);
        if($event){
            if($active == 1){
                EventSale::where('vivandi',1)->where('id','<>',$event->id)->update(array('vivandi'=>0));
                EventSale::where('id',$event->id)->update(array('vivandi'=>1));
            }else{
                EventSale::where('vivandi',1)->update(array('vivandi'=>0));
            }
        }else{
            return json_encode(array('status'=>false));
        }
    }
    function validateDate($date)
    {
        $d = DateTime::createFromFormat('d-m-Y', $date);
        return $d && $d->format('d-m-Y') === $date;
    }
}
