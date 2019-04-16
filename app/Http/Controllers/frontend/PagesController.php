<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Session;
use App\CategoryProduct;
use App\ProductAttribute;
use App\Form;
use App\System;
use App\Product;
use App\Category;
use App\District;
use App\Filter;
use App\Attribute;
use App\Item;
use App\Province;
use App\Order;
use App\Frame;
use App\OrderItem;
use App\Account;
use App\CommentProduct;
use App\ContentFrame;
use App\Post;
use App\Post_category;
use App\Email_out_of_stocks;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use Mail;
use App\Customer;
use App\Configure_discounts;
use App\Email_General;
use App\CommentFrame;
use App\Config_distric;
use App\FrameFeature;
use App\Dowload;
use App\GroupAttribute;
use App\Relation_frame;
use App\FolderAttribute;
use App\Model\RelationFrame;
use App\ProductInCategory;
use App\FramCate;
use App\Agency_frame;
use App\Tag_post;;
use App\Frame_Contruct;;
use App\Contruct;;
use App\Content_contruct;
use App\Feedback;;
use App\Feedback_Image;;
use App\Order_agency;;
use App\Agency;;
use App\EventSale;;
use DB;
use DateTime;

class PagesController extends Controller
{   
    public function story(Request $req){
         $html = view('frontend.ajax.ajaxstory');

         return json_encode(array('status'=>true,'html'=>$html.""));
    }
    
    public function getHome(){
        $storycheck=0;
        $group = CategoryProduct::get();
        return view('frontend.page.home',compact('group','storycheck'));
    }

    public function GetBlogDetail($slug = null,$id,Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2 || $pieces[0] == 'localhost'){
            $str = $slug."-".$id;
            $arr = explode('-',$str);
            if($arr){
                $id = $arr[sizeof($arr)-1];
                $slug = substr($str,0,strlen($str) - strlen($id)-1);
                $post = Post::where('id',$id)->where('status',1)->first();
                if($post){
                    if(!str_slug($post->slug) == $slug){
                        return redirect('/');
                    }
                    return view('frontend.page.blog-detail',['post'=>$post]); 
                }else{
                    return view('errors.404');
                }
            }
        }else{
            return view('errors.404');
        }        
    }

     //phong cate
    public function ajaxproidcate(Request $req){
        $id = $req->id;
        $gr = $req->gr;
        $pro =$req->pro;
        $frames = RelationFrame::where('product_id',$pro)->where('relation_frame.group_id',$gr)->where('status',1)->get();
        $in = array();
        foreach ($frames as $f) {
                array_push($in, $f->frame_id);
        }
      
        $pr = Product::where('id',$pro)->first();
        $frame_show = Frame::whereIn('id',$in)->where('status',1)->get();
        if (sizeof($frame_show[$id])){
            $html = view('frontend.ajax.ajax-pro',['frame_show'=>$frame_show,'id'=>$id,'pr'=>$pr,'gr'=>$gr]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }
                            
    }

    public function getCategory($slug = null,$id,Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2){
            $str = $slug."-".$id;
            $arr = explode('-',$str);
            if( sizeof($arr) ){
                $id = $arr[sizeof($arr)-1];
                $slug =  substr($str,0,strlen($str) - strlen($id)-1);
                $group_attr = GroupAttribute::where('id',$id)->first();
                if($group_attr){
                    if(!str_slug($group_attr->name) == $slug){
                        return redirect('/');
                    }
                    $frames = RelationFrame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(frame_id) ,',')  as frame_str") )->where('relation_frame.group_id',$group_attr->id)->where('status',1)->groupby('product_id')->orderby('frame_id','desc')->paginate(12);
                    return view('frontend.page.category',['frames'=>$frames,'group_attr'=>$group_attr]);
                }
            }else{
                return view('errors.404');
            }
        }else{
            return view('errors.404');
        }
    }

    public function AjaxPaginationCate(Request $req){
        $id = $req->id_group;
        $page = $req->page;
        $group_attr = GroupAttribute::find($id);
        if($group_attr){
            $frames = RelationFrame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(frame_id) ,',')  as frame_str") )->where('relation_frame.group_id',$group_attr->id)->where('status',1)->groupby('product_id')->orderby('frame_id','desc')->paginate(12);
            $html = view('frontend.ajax.ajax-phan-trang-cate',['frames'=>$frames,'group_attr'=>$group_attr]);
            $ul = view('frontend.ajax.ajax-ul-cate',['frames'=>$frames,'group_attr'=>$group_attr]);
            return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function getSearch(Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2){
            $search = $req['search'];
            $search_frames = trim($search);
                $frame_des = Frame::where(function($query) use ($search_frames){
                    $query->where('name','like',"%$search_frames%")->orwhere('code_frame','like',"%$search_frames%");
                })->where('status',1)->get();
                if(sizeof($frame_des) > 0 && $search_frames != ''){
                    $frames = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->where(function ($query) use ($search_frames) {
                            $query->where('name','like',"%$search_frames%")->orwhere('code_frame','like',"%$search_frames%");
                    })->where('status',1)->groupby('product_id')->paginate(12);
                return view('frontend.page.tim-kiem',['status'=>0,'frames'=>$frames,'search_frames'=>$search_frames,'frame_des'=>$frame_des]);
                }else{
                    return view('frontend.page.tim-kiem',['status'=>1,'search_frames'=>$search_frames]);
                }
        }
        else{
            return view('errors.404');
        }
    }

    public function AjaxPaginationSearch(Request $req){
        $search = $req['search'];
        $search_frames = trim($search);
        $frames = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->where(function ($query) use ($search_frames) {
                $query->where('name','like',"%$search_frames%")->orwhere('code_frame','like',"%$search_frames%");
        })->where('status',1)->groupby('product_id')->paginate(12);
        $html = view('frontend.ajax.ajax-phan-trang-search',['frames'=>$frames,'search_frames'=>$search_frames]);
        $ul = view('frontend.ajax.ajax-ul-search',['frames'=>$frames,'search_frames'=>$search_frames]);
        return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
    }

    public function SubmitTracuu(Request $req){
       $phone = preg_replace('/[^\dxX]/', '', $req->phone);
        $x84 = substr($phone,0,2);
        if($x84 == 84){
            $phone = substr($phone,2);
        }
        $x0 = substr($phone,0,1);
        if($x0 != 0){
            $phone = "0".$phone;
        }
        if ($phone == ""){
            return json_encode(array('status'=>false,'message'=>'Số điện thoại không đúng . Vui lòng kiểm tra lại'));
        }
        $order = Order::where('phone',$phone)->get();
        if(sizeof($order)){
            $last_order = $order[count($order)-1];
            $orItem = OrderItem::where('order_id',$last_order->id)->get();
            $html = view('frontend.ajax.ajax-tracuu',['orItem'=>$orItem,'last_order'=>$last_order]);
            return json_encode(array('status'=>true,'html'=>$html."",'last_order'=>$last_order));
        }else{
            return json_encode(array('status'=>false,'message'=>'Số điện thoại không đúng . Vui lòng kiểm tra lại'));
        }
    }

    public function getProDetail($slug = null,$id,Request $req){

        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2 || $pieces[0] == 'localhost'){
            $str = $slug."-".$id;
            $arr = explode('-',$str);
            if(sizeof($arr)){
                $id = $arr[sizeof($arr)-1];
                $slug =  substr($str,0,strlen($str) - strlen($id)-1);
                $frame = Frame::where('id',$id)->where('slug',$slug)->where('status',1)->first();
                // check frame exist
                if($frame){
                    $list_frame = Frame::where('product_id',$frame->product_id)->where('status',1)->get();
                    return view('frontend.page.prodetail',['list_frame'=>$list_frame,'frame'=>$frame]);
                }else{

                    return view('errors.404');
                }
            }else{
                return redirect('/'); 
            }
        }else{
            return view('errors.404');
        }
    }

    public function GetPopupDowload(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $infoCus = null;
            if (Session::has('download.info')) {
                $infoCus = Session::get('download.info');
            }
            $html = view('frontend.ajax.popup-dowload',['frame'=>$frame, 'infoCus' => $infoCus]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function SubmitPopupDowload(Request $req){
        $id = $req->frame_id;
        $username = $req->username;
        $job = $req->job;
        $email = $req->email;
        $phone = preg_replace('/[^\dxX]/', '', $req->phone);
            $x84 = substr($phone,0,2);
            if($x84 == 84){
                $phone = substr($phone,2);
            }
            $x0 = substr($phone,0,1);
            if($x0 != 0){
                $phone = "0".$phone;
            }
        $content = $req->content;
        $frame = Frame::find($id);
        if($frame){
            $dowload = new Form;
            $dowload->text_1 = $frame->name;
            $dowload->text_2 = $username;
            $dowload->text_3 = $job;
            $dowload->text_4 = $email;
            $dowload->text_5 = $phone;
            $dowload->text_6 = $content;
            $dowload->type = "Dowload";
            $dowload->status = 1;
            Session::set('download.info', $dowload);
            if (Session::has('download.info')) {
                $dowload->save();
                return json_encode(array('status'=>true,'frame'=>$frame));
            }
            // return json_encode(array('status'=>Session::has('downdoad.info')));
        } 
        
    }

    public function SubmitPopupDowload2(Request $req){
        $filename = $_GET["filename"];
        $file = fopen(public_path().'/assets/file/'.$filename,"rb");
        header('Content-Type: application/octet-stream'); 
        header("Content-Disposition: attachment; filename=".$filename);
        fpassthru($file); 
        fclose($file);
    }

    public function ArtToCart(Request $req){
        $id = $req->id;
        $num = $req->num;
        $frame = Frame::find($id);
        if($frame == null){
            return json_encode(array('status'=>false,'frame'=>null));
        }else{
            $frame->like_frame = $frame->like_frame + 1;
            $frame->save();
            $arr = ['frame'=>$frame,'num'=>$num];
            $list_session = Session::get('frame');
            $d = 0 ;
            if($list_session != null){
                foreach ($list_session as $key => $value) {
                    if($frame->id == $value['frame']->id){
                        $d++;
                        $list_session[$key]['num']=$num;
                    }
                }
            }
            if($d == 0){
                $list_session = Session::push('frame',$arr);
            }else{
                $list_session = Session::set('frame',$list_session);
            }
            $list_session = Session::get('frame');
            if($list_session){
                $total = 0;
                foreach ($list_session as $key => $value2) {
                    if($value2['frame']->price_sale){
                        $price = $value2['frame']->price_sale;
                    }else{
                        $price = $value2['frame']->price;
                    }
                }
                $price = $price;
                $total = $price * $num;
            }
            $html = view('frontend.ajax.Add-Cart',['num'=>$num,'list_session'=>$list_session]);
            return json_encode(array('status'=>true,'session'=>$list_session,'html'=>$html."",'frame'=>$frame));
        }
    }
    // CM_C_1
    public function SelectToCart(Request $req){
        $id = $req->id;
        $num = $req->num;
        $list_session = Session::get('frame'); 
        if($list_session != null){
            foreach ($list_session as $key => $item){
                if($id == $item['frame']->id){
                    $list_session[$key]['num'] = $num;
                }
            }
        }
        Session::set('frame',$list_session);
        $total = 0;
        foreach ($list_session as $key => $item2) {
            if($item2['frame']->price_sale){
                $price = $item2['frame']->price_sale;
            }else{
                $price = $item2['frame']->price;
            }
            $price = $price;
            $total += $price * $item2['num'];
        }
        $total = $total;
        $share = Session::get('share');
        $pieces = explode('.', $req->getHost());
        $discount_ = 0;
        $discount_type = "";
        if(sizeof($pieces)>2){
                // Kiểm tra Đại lý có event khuyến mại không
                $domain = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
                if(sizeof($domain)){
                     $event_active = $domain->event_active;
                     $EventSale = EventSale::find($event_active);
                     if($EventSale){
                        $curdate = date("d-m-Y");
                        $startdate = $EventSale->start_day;
                        $end_day = $EventSale->end_day;
                        $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                        $timestamp_c = $dtime1->getTimestamp();
                        $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                        $timestamp_s = $dtime2->getTimestamp();
                        $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                        $timestamp_e = $dtime3->getTimestamp();
                        if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                           // Nếu trong thời gian event
                           // => tính discount
                           // Kiểu event Giảm % hoặc trừ tiền
                            $discount_type = "Chưa đủ điều kiện";
                           if($EventSale->type == 0 ){
                                // Giảm theo phần trăm
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                    $discount_type = $EventSale->percent."%";
                                }
                                if($EventSale->share == 0){
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;   
                                    $discount_type = $EventSale->percent."%"; 
                                }
                                // $order->percent = $percent;
                                
                           }else{
                                // Giảm theo hóa đơn
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    if( $total>=  $EventSale->money_min){
                                       $discount_ = $EventSale->money_sale;
                                       $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                    }
                                }
                                if($EventSale->share == 0){
                                    if($total >=  $EventSale->money_min){
                                       $discount_ = $EventSale->money_sale;
                                       $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                    }
                                }
                           }
                           
                        }else{
                           // nếu không trong thời gian event thì không làm gì cả
                        }
                     }
                     // Kiểm tra ngày tháng hiện tại với event
                     // Kiểm tra event discount phù hợp
                }
        }else{
             if(sizeof($pieces) == 2){
                $EventSale = EventSale::where('vivandi',1)->first();
                    if($EventSale){

                        $curdate = date("d-m-Y");
                        $startdate = $EventSale->start_day;
                        $end_day = $EventSale->end_day;
                        $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                        $timestamp_c = $dtime1->getTimestamp();
                        $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                        $timestamp_s = $dtime2->getTimestamp();
                        $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                        $timestamp_e = $dtime3->getTimestamp();
                        if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                           // Nếu trong thời gian event
                           // => tính discount
                           // Kiểu event Giảm % hoặc trừ tiền
                            $discount_type = "Chưa đủ điều kiện";
                           if($EventSale->type == 0 ){
                                // Giảm theo phần trăm
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                    $discount_type = $EventSale->percent."%";
                                }
                                if($EventSale->share == 0){
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                    $discount_type = $EventSale->percent."%";
                                }
                                // $order->percent = $percent;
                                
                           }else{
                                // Giảm theo hóa đơn
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    if($total >=  $EventSale->money_min){
                                       $discount_ = $EventSale->money_sale;
                                       $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                    }
                                }
                                if($EventSale->share == 0){
                                    if($total >=  $EventSale->money_min){
                                        $discount_ = $EventSale->money_sale;
                                        $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                    }
                                }
                           }
                           
                        }else{
                           // nếu không trong thời gian event thì không làm gì cả
                        }
                    }
             }
        }
        $all_total = $total - $discount_;
        return json_encode(array('status'=>true,'total'=>$total,'num'=>$num,'all_total'=>$all_total,'discount'=>$discount_,'discount_type'=>$discount_type));
    }
    // CM_C_2
    public function RemoveToCart(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $frame->like_frame = $frame->like_frame - 1;
            $frame->save();
            $list_session = Session::get('frame');
            if($list_session != null){
                foreach ($list_session as $key => $item) {
                    if($id == $item['frame']->id){
                        unset($list_session[$key]);
                    }
                }
                Session::set('frame',$list_session);
                $list_session = Session::get('frame');
                $total = 0;
                foreach ($list_session as $key => $item2) {
                    if($item2['frame']->price_sale){
                        $price = $item2['frame']->price_sale;
                    }else{
                        $price = $item2['frame']->price;
                    }
                    $price = $price;
                    $total +=$price * $item2['num'];
                }
                $total = $total;
                $share = Session::get('share');
                // $Configure_discounts = Configure_discounts::where('value','config_tichdiem')->first();
                // if($share[0] == 1){
                //     if($Configure_discounts){
                //         $all_total_ = ((float)$total*(float)$Configure_discounts->percent)/100;
                //         $all_total = (int)$total - (int)$all_total_;
                //     }else{
                //         $all_total = $total;
                //     }
                // }else{
                //     $all_total = $total;
                // }
                // $share = Session::get('share');
                $pieces = explode('.', $req->getHost());
                $discount_ = 0;
                $discount_type = "";
                if(sizeof($pieces)>2){
                        // Kiểm tra Đại lý có event khuyến mại không
                        $domain = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
                        if(sizeof($domain)){
                             $event_active = $domain->event_active;
                             $EventSale = EventSale::find($event_active);
                             if($EventSale){
                                $curdate = date("d-m-Y");
                                $startdate = $EventSale->start_day;
                                $end_day = $EventSale->end_day;
                                $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                                $timestamp_c = $dtime1->getTimestamp();
                                $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                                $timestamp_s = $dtime2->getTimestamp();
                                $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                                $timestamp_e = $dtime3->getTimestamp();
                                if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                                   // Nếu trong thời gian event
                                   // => tính discount
                                   // Kiểu event Giảm % hoặc trừ tiền
                                    $discount_type = "Chưa đủ điều kiện";
                                   if($EventSale->type == 0 ){
                                        // Giảm theo phần trăm
                                        if($EventSale->share && $share[0]){
                                            // Kiểm tra điều kiện share
                                            $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                            $discount_type = $EventSale->percent."%";
                                        }
                                        if($EventSale->share == 0){
                                            $discount_ = ((float)$total*(float)$EventSale->percent)/100;   
                                            $discount_type = $EventSale->percent."%"; 
                                        }
                                        // $order->percent = $percent;
                                        
                                   }else{
                                        // Giảm theo hóa đơn
                                        if($EventSale->share && $share[0]){
                                            // Kiểm tra điều kiện share
                                            if( $total>=  $EventSale->money_min){
                                               $discount_ = $EventSale->money_sale;
                                               $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                            }
                                        }
                                        if($EventSale->share == 0){
                                            if($total >=  $EventSale->money_min){
                                               $discount_ = $EventSale->money_sale;
                                               $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                            }
                                        }
                                   }
                                   
                                }else{
                                   // nếu không trong thời gian event thì không làm gì cả
                                }
                             }
                             // Kiểm tra ngày tháng hiện tại với event
                             // Kiểm tra event discount phù hợp
                        }
                }else{
                     if(sizeof($pieces) == 2){
                        $EventSale = EventSale::where('vivandi',1)->first();
                            if($EventSale){

                                $curdate = date("d-m-Y");
                                $startdate = $EventSale->start_day;
                                $end_day = $EventSale->end_day;
                                $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                                $timestamp_c = $dtime1->getTimestamp();
                                $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                                $timestamp_s = $dtime2->getTimestamp();
                                $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                                $timestamp_e = $dtime3->getTimestamp();
                                if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                                   // Nếu trong thời gian event
                                   // => tính discount
                                   // Kiểu event Giảm % hoặc trừ tiền
                                    $discount_type = "Chưa đủ điều kiện";
                                   if($EventSale->type == 0 ){
                                        // Giảm theo phần trăm
                                        if($EventSale->share && $share[0]){
                                            // Kiểm tra điều kiện share
                                            $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                            $discount_type = $EventSale->percent."%";
                                        }
                                        if($EventSale->share == 0){
                                            $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                            $discount_type = $EventSale->percent."%";
                                        }
                                        // $order->percent = $percent;
                                        
                                   }else{
                                        // Giảm theo hóa đơn
                                        if($EventSale->share && $share[0]){
                                            // Kiểm tra điều kiện share
                                            if($total >=  $EventSale->money_min){
                                               $discount_ = $EventSale->money_sale;
                                               $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                            }
                                        }
                                        if($EventSale->share == 0){
                                            if($total >=  $EventSale->money_min){
                                                $discount_ = $EventSale->money_sale;
                                                $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.')."đ";
                                            }
                                        }
                                   }
                                   
                                }else{
                                   // nếu không trong thời gian event thì không làm gì cả
                                }
                            }
                     }
                }
                $all_total = $total - $discount_;
                return json_encode(array('status'=>true,'total'=>$total,'session'=>$list_session,'frame'=>$frame,'all_total'=>$all_total,'discount'=>$discount_,'discount_type'=>$discount_type));
            }
        }else{
            return json_encode(array('status'=>false));
        }
    }
    // Đơn hàng của khách hàng được khởi tạo tại đây
    public function SubmitOrder(Request $req){
        $pieces = explode('.', $req->getHost());
        $username = $req->username;
        $email = $req->email;
        $addresses = $req->addresses;
        $note = $req->note;
        $phone = preg_replace('/[^\dxX]/', '', $req->phone);
            $x84 = substr($phone,0,2);
            if($x84 == 84){
                $phone = substr($phone,2);
            }
            $x0 = substr($phone,0,1);
            if($x0 != 0){
                $phone = "0".$phone;
            }
        $list_session = Session::get('frame');
        if($list_session == null){
            return json_encode(array('status'=>false));
        }else{
            $total = 0;
            foreach ($list_session as $key => $item) {
                if($item['frame']->price_sale){
                    $price = $item['frame']->price_sale;
                }else{
                    $price = $item['frame']->price;
                }
                $price = $price;
                $total += $price*$item['num']; 
            }
        } 
        $share = Session::get('share');
        $percent_ = 0;
        $percent = 0;

        $Configure_discounts = Configure_discounts::where('value','config_tichdiem')->first();
        if($share[0] == 1){
            if($Configure_discounts){
                $all_total_ = ((float)$total*(float)$Configure_discounts->percent)/100;
                $all_total = (int)$total - (int)$all_total_;
                $percent = $Configure_discounts->percent;
            }else{
                $all_total = $total;
                $percent = $percent_;
            }
        }else{
            $all_total = $total;
            $percent = $percent_;
        }

        $percent = $percent; 
        $phone = $phone;
        $order = new Order;
        $order->fullname = $username;
        $order->email = $email;
        $order->phone = $phone;
        $order->total = $total;
        $order->status = 1;
        $order->note = $note;
        $order->address = $addresses;
        // $order->percent = $percent;
        if(sizeof($pieces)>2){
                // Kiểm tra Đại lý có event khuyến mại không
                $domain = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
                if(sizeof($domain)){
                     $event_active = $domain->event_active;
                     $EventSale = EventSale::find($event_active);
                     if($EventSale){
                        $curdate = date("d-m-Y");
                        $startdate = $EventSale->start_day;
                        $end_day = $EventSale->end_day;
                        $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                        $timestamp_c = $dtime1->getTimestamp();
                        $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                        $timestamp_s = $dtime2->getTimestamp();
                        $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                        $timestamp_e = $dtime3->getTimestamp();
                        if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                           // Nếu trong thời gian event
                           // => tính discount
                           // Kiểu event Giảm % hoặc trừ tiền
                           if($EventSale->type == 0 ){
                                // Giảm theo phần trăm
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    $order->percent = $EventSale->percent;
                                    $order->event = $EventSale->id;
                                    $order->event_type = "PERCENT";
                                }
                                if($EventSale->share == 0){
                                    $order->percent = $EventSale->percent;
                                    $order->event = $EventSale->id;
                                    $order->event_type = "PERCENT";
                                }
                                // $order->percent = $percent;
                                
                           }else{
                                // Giảm theo hóa đơn
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    if($order->total >=  $EventSale->money_min){
                                       $order->discount = $EventSale->money_sale;
                                       $order->event = $EventSale->id;
                                       $order->event_type = "DISCOUNT";
                                    }
                                }
                                if($EventSale->share == 0){
                                    if($order->total >=  $EventSale->money_min){
                                       $order->discount = $EventSale->money_sale;
                                       $order->event = $EventSale->id;
                                       $order->event_type = "DISCOUNT";
                                    }
                                }
                           }
                           
                        }else{
                           // nếu không trong thời gian event thì không làm gì cả
                        }
                     }
                     // Kiểm tra ngày tháng hiện tại với event
                     // Kiểm tra event discount phù hợp
                }
        }else{
             if(sizeof($pieces) == 2){
                $EventSale = EventSale::where('vivandi',1)->first();
                    if($EventSale){

                        $curdate = date("d-m-Y");
                        $startdate = $EventSale->start_day;
                        $end_day = $EventSale->end_day;
                        $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                        $timestamp_c = $dtime1->getTimestamp();
                        $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                        $timestamp_s = $dtime2->getTimestamp();
                        $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                        $timestamp_e = $dtime3->getTimestamp();
                        if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                           // Nếu trong thời gian event
                           // => tính discount
                           // Kiểu event Giảm % hoặc trừ tiền

                           if($EventSale->type == 0 ){
                                // Giảm theo phần trăm
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    $order->percent = $EventSale->percent;
                                    $order->event = $EventSale->id;
                                    $order->event_type = "PERCENT";
                                }
                                if($EventSale->share == 0){
                                    $order->percent = $EventSale->percent;
                                    $order->event = $EventSale->id;
                                    $order->event_type = "PERCENT";
                                }
                                // $order->percent = $percent;
                                
                           }else{
                                // Giảm theo hóa đơn
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    if($order->total >=  $EventSale->money_min){
                                       $order->discount = $EventSale->money_sale;
                                       $order->event = $EventSale->id;
                                       $order->event_type = "DISCOUNT";
                                    }
                                }
                                if($EventSale->share == 0){
                                    if($order->total >=  $EventSale->money_min){
                                       $order->discount = $EventSale->money_sale;
                                       $order->event = $EventSale->id;
                                       $order->event_type = "DISCOUNT";
                                    }
                                }
                           }
                           
                        }else{
                           // nếu không trong thời gian event thì không làm gì cả
                        }
                    }
             }
        }
        // dd($order);
        if($order->save()){
            foreach ($list_session as $key2 => $item2) {
                $orderItem = new OrderItem;
                $orderItem->quantity = $item2['num'];
                $orderItem->order_id = $order->id;
                $orderItem->product_id = $item2['frame']->product_id;
                $orderItem->price = $item2['frame']->price;
                $orderItem->price_sale = $item2['frame']->price_sale;
                $orderItem->frame_id = $item2['frame']->id;
                $orderItem->save();
            }

            //order_agency
            $pieces = explode('.', $req->getHost());
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
            if(sizeof($pieces)>2){
                $domain = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
                if(sizeof($domain)){
                   

                    $order_agency = new Order_agency;
                    $order_agency->agency_id = $domain->id;
                    $order_agency->order_id = $order->id;
                    $order_agency->save();
                        $mail = System::select('email_send','email_password')->first();
                         if (  $domain ) {
                            config(['mail.username' => $mail->email_send]);
                            config(['mail.password' => $mail->email_password]);
                            config(['mail.port' => "587"]);
                            config(['mail.host' => "smtp.gmail.com"]);
                            config(['mail.encryption' => "tls"]);
                            $orderItem = OrderItem::where('order_id',$order->id)->leftjoin('frames','order_items.frame_id','=','frames.id')->get(); 
                            $data = array('order'=>$order,'orderItem'=>$orderItem);
                            if($domain->email){
                                    $data['status'] = "Admin";
                                    Mail::send('backend.email.email-new-order',$data, function($message) use ($mail,$domain,$order){
                                    $message->from($mail->email_send);
                                    $message->to($domain->email, 'Quản trị')->subject("[".url('')."] Có đơn hàng mới "."#".$order->id);
                                });
                            }
                            if($order->email){
                                    $data['status'] = "Khách hàng";
                                    Mail::send('backend.email.email-new-order',$data, function($message) use ($mail,$domain,$order){
                                    $message->from($mail->email_send);
                                    $message->to($order->email, 'Hệ Thống')->subject("[".url('')."] Xác nhận đơn hàng "."#".$order->id);
                                });
                            }
                        }  
                                      
                }
            }else{
                $email_rev = Email_General::where('name','Email Nhận đơn hàng')->first();
                $mail = System::select('email_send','email_password')->first();
                 if (  $email_rev ) {
                    config(['mail.username' => $mail->email_send]);
                    config(['mail.password' => $mail->email_password]);
                    config(['mail.port' => "587"]);
                    config(['mail.host' => "smtp.gmail.com"]);
                    config(['mail.encryption' => "tls"]);
                    $orderItem = OrderItem::where('order_id',$order->id)->leftjoin('frames','order_items.frame_id','=','frames.id')->get(); 
                    $data = array('order'=>$order,'orderItem'=>$orderItem);
                    if($email_rev->email){
                            $data['status'] = "Admin";
                            Mail::send('backend.email.email-new-order',$data, function($message) use ($mail,$email_rev,$order){
                            $message->from($mail->email_send);
                            $message->to($email_rev->email, 'Quản trị')->subject("[".url('')."] Có đơn hàng mới "."#".$order->id);
                        });
                    }
                    if($order->email){
                            $data['status'] = "Khách hàng";
                            Mail::send('backend.email.email-new-order',$data, function($message) use ($mail,$email_rev,$order){
                            $message->from($mail->email_send);
                            $message->to($order->email, 'Hệ Thống')->subject("[".url('')."] Xác nhận đơn hàng "."#".$order->id);
                        });
                    }
                } 
            
            }
        Session::forget('frame');
        Session::forget('share');
        }
    }

    public function PopupBinhluan(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $arr = ['l_frame'=>$frame];
            $list_look = Session::get('l_frame');
            $x = 0;
            if($list_look != null){
                foreach ($list_look as $key => $value) {
                    if($frame->id == $value['l_frame']->id){
                        $x++;
                    }
                }
            }
            if($x == 0){
                $list_look = Session::push('l_frame',$arr);
            }else{
                $list_look = Session::set('l_frame',$list_look);
            }
            $list_look = Session::get('l_frame');
                
            $comment = CommentFrame::where('frame_id',$frame->id)->where('status',1)->get();
            $order = OrderItem::leftjoin('orders','order_items.order_id','=','orders.id')->select('order_items.*')->where('orders.status','>',4)->where('order_items.frame_id',$frame->id)->get();
            $agency_frame = Agency_frame::where('frame_id',$frame->id)->get();
            $feature0 = FrameFeature::leftjoin('features','frame_features.feature_id','=','features.id')->where('frame_features.frame_id',$frame->id)->groupby('features.name')->get();
            $html = view('frontend.ajax.popup-binhluan',['frame'=>$frame,'comment'=>$comment,'order'=>$order,'feature0'=>$feature0,'agency_frame'=>$agency_frame]);
            $html_list_xem = view('frontend.ajax.ajax-list-xem',['frame'=>$frame,'list_look'=>$list_look]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame,'html_list_xem'=>$html_list_xem."",'list_look'=>$list_look));  
        }else{
            return view('errors.404');
        }
    }    

    public function AjaxBinhluan(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $comment = CommentFrame::where('frame_id',$frame->id)->where('status',1)->get();
            $html = view('frontend.ajax.ajax-binhluan',['frame'=>$frame,'comment'=>$comment]);
            $view = view('frontend.ajax.ajax-images-all',['frame'=>$frame]);
            return json_encode(array('status'=>true,'html'=>$html."",'view'=>$view."",'frame'=>$frame));
        }else{
            return view('errors.404');
        }
    }

    public function PopupLuotMua(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $arr = ['l_frame'=>$frame];
            $list_look = Session::get('l_frame');
            $x = 0;
            if($list_look != null){
                foreach ($list_look as $key => $value) {
                    if($frame->id == $value['l_frame']->id){
                        $x++;
                    }
                }
            }
                if($x == 0){
                    $list_look = Session::push('l_frame',$arr);
                }else{
                    $list_look = Session::set('l_frame',$list_look);
                }
                $list_look = Session::get('l_frame');
                
            $comment = CommentFrame::where('frame_id',$frame->id)->where('status',1)->get();
            $order = OrderItem::leftjoin('orders','order_items.order_id','=','orders.id')->select('order_items.*')->where('orders.status','>',4)->where('order_items.frame_id',$frame->id)->get();
            $frame_contruct = Frame_Contruct::where('frame_contruct.frame_id',$frame->id)->leftjoin('contructs','frame_contruct.contruct_id','=','contructs.id')->select('contructs.*')->groupby('frame_contruct.contruct_id')->get();
            $agency_frame = Agency_frame::where('frame_id',$frame->id)->get();
            $feature0 = FrameFeature::leftjoin('features','frame_features.feature_id','=','features.id')->where('frame_features.frame_id',$frame->id)->groupby('features.name')->get();
            $html = view('frontend.ajax.popup-luotmua',['frame'=>$frame,'comment'=>$comment,'order'=>$order,'feature0'=>$feature0,'agency_frame'=>$agency_frame,'frame_contruct'=>$frame_contruct]);
            $html_list_xem = view('frontend.ajax.ajax-list-xem',['frame'=>$frame,'list_look'=>$list_look]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame,'html_list_xem'=>$html_list_xem."",'list_look'=>$list_look));
        }else{
            return view('errors.404');
        }
    } 

    public function AjaxActive (Request $req){
        $id = $req->id;
        $contructs = Contruct::find($id);
        $list_image = $contructs->imageContruct()->get();
        $html = view('frontend.ajax.ajax-active-luotmua',['list_image'=>$list_image]);
        return json_encode(array('status'=>true,'html'=>$html.""));
    }   

    public function AjaxLuotMua(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
           $frame_contruct = Frame_Contruct::where('frame_contruct.frame_id',$frame->id)->leftjoin('contructs','frame_contruct.contruct_id','=','contructs.id')->select('contructs.*')->groupby('frame_contruct.contruct_id')->get();
            $html = view('frontend.ajax.ajax-luotmua',['frame'=>$frame,'frame_contruct'=>$frame_contruct]);
            $view = view('frontend.ajax.ajax-images-all',['frame'=>$frame]);
            return json_encode(array('status'=>true,'html'=>$html."",'view'=>$view."",'frame'=>$frame));
        }else{
            return view('errors.404');
        }
    }

    public function PopupDacTinh(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $arr = ['l_frame'=>$frame];
            $list_look = Session::get('l_frame');
            $x = 0;
            if($list_look != null){
                foreach ($list_look as $key => $value) {
                    if($frame->id == $value['l_frame']->id){
                        $x++;
                    }
                }
            }
                if($x == 0){
                    $list_look = Session::push('l_frame',$arr);
                }else{
                    $list_look = Session::set('l_frame',$list_look);
                }
                $list_look = Session::get('l_frame');
                
            $comment = CommentFrame::where('frame_id',$frame->id)->where('status',1)->get();
            $order = OrderItem::leftjoin('orders','order_items.order_id','=','orders.id')->select('order_items.*')->where('orders.status','>',4)->where('order_items.frame_id',$frame->id)->get();
            $agency_frame = Agency_frame::where('frame_id',$frame->id)->get();
            $feature0 = FrameFeature::leftjoin('features','frame_features.feature_id','=','features.id')->where('frame_features.frame_id',$frame->id)->groupby('features.name')->get();
            $feature1 = FrameFeature::leftjoin('features','frame_features.feature_id','=','features.id')->where('frame_features.frame_id',$frame->id)->get();
            $html = view('frontend.ajax.popup-dactinh',['frame'=>$frame,'comment'=>$comment,'order'=>$order,'feature0'=>$feature0,'feature1'=>$feature1,'agency_frame'=>$agency_frame]);
            $html_list_xem = view('frontend.ajax.ajax-list-xem',['frame'=>$frame,'list_look'=>$list_look]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame,'html_list_xem'=>$html_list_xem."",'list_look'=>$list_look));
        }else{
            return view('errors.404');
        }
    }    

    public function AjaxDacTinh(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $feature1 = FrameFeature::leftjoin('features','frame_features.feature_id','=','features.id')->where('frame_features.frame_id',$frame->id)->get();
            $html = view('frontend.ajax.ajax-dactinh',['frame'=>$frame,'feature1'=>$feature1]);
            $view = view('frontend.ajax.ajax-images-all',['frame'=>$frame]);
            return json_encode(array('status'=>true,'html'=>$html."",'view'=>$view."",'frame'=>$frame));
        }else{
            return view('errors.404');
        }
    }

    public function PopupDaily(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $arr = ['l_frame'=>$frame];
            $list_look = Session::get('l_frame');
            $x = 0;
            if($list_look != null){
                foreach ($list_look as $key => $value) {
                    if($frame->id == $value['l_frame']->id){
                        $x++;
                    }
                }
            }
                if($x == 0){
                    $list_look = Session::push('l_frame',$arr);
                }else{
                    $list_look = Session::set('l_frame',$list_look);
                }
                $list_look = Session::get('l_frame');
                
            $comment = CommentFrame::where('frame_id',$frame->id)->where('status',1)->get();
            $order = OrderItem::leftjoin('orders','order_items.order_id','=','orders.id')->select('order_items.*')->where('orders.status','>',4)->where('order_items.frame_id',$frame->id)->get();
            $agency_frame = Agency_frame::where('frame_id',$frame->id)->get();
            $feature0 = FrameFeature::leftjoin('features','frame_features.feature_id','=','features.id')->where('frame_features.frame_id',$frame->id)->groupby('features.name')->get();
            $html = view('frontend.ajax.popup-daily',['frame'=>$frame,'comment'=>$comment,'order'=>$order,'feature0'=>$feature0,'agency_frame'=>$agency_frame]);
            $html_list_xem = view('frontend.ajax.ajax-list-xem',['frame'=>$frame,'list_look'=>$list_look]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame,'html_list_xem'=>$html_list_xem."",'list_look'=>$list_look));
        }else{
            return view('errors.404');
        }
    }


    public function AjaxDaiLy(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $agency_frame = Agency_frame::where('frame_id',$frame->id)->get();
            $html = view('frontend.ajax.ajax-daily',['frame'=>$frame,'agency_frame'=>$agency_frame]);
            $view = view('frontend.ajax.ajax-images-all',['frame'=>$frame]);
            return json_encode(array('status'=>true,'html'=>$html."",'view'=>$view."",'frame'=>$frame));
        }else{
            return view('errors.404');
        }
    }

    public function SMPopupBinhluan(Request $req){
        $name = $req->name;
        $content = $req->content;
        $id = $req->frame_id;
        $acount = Account::where('username',$name)->first();
        if($acount){
            $comment = new CommentFrame;
            $comment->account_id = $acount->id;
            $comment->frame_id = $id;
            $comment->comment = $content;
            $comment->status = 0;
            $comment->save();
            return json_encode(array('status'=>true));
        }else{
            $acc = new Account;
            $acc->username = $name;
            $acc->status = 1;
            if($acc->save()){
                $comment = new CommentFrame;
                $comment->account_id = $acc->id;
                $comment->frame_id = $id;
                $comment->comment = $content;
                $comment->status = 0;
                $comment->save();
                return json_encode(array('status'=>true));
            }
        }
        
    }

    //phong
    public function ajaxTagPro(Request $req){
        $id = $req->id;
        $html = view('frontend.ajax.ajax-tag-pro',['id'=>$id]);
        return json_encode(array('status'=>true,'html'=>$html.""));
    }

    public function ajaxYoutubeid(Request $req){
        $id = $req->id;
        $frame = Frame::find($id);
        if($frame){
            $link_youtube = $frame->youtube_link;
            $html = view('frontend.ajax.ajax-youtube-pro',['link_youtube'=>$link_youtube,'id'=>$id]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }
    }

    public function ajaxvideoid(Request $req){
        $id = $req->id;
        $vid = $req->vid;
        $frame = Frame::find($id);
        $link_youtube = $frame->youtube_link;
        $html = view('frontend.ajax.ajax-video-pro',['vid'=>$vid,'link_youtube'=>$link_youtube,'id'=>$id]);
        return json_encode(array('status'=>true,'html'=>$html.""));
    }
    //blog
    public function blog(Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2 || $pieces[0] == 'localhost'){
            $post = Post::where('status',1)->orderby('id','desc')->paginate(10);
            return view('frontend.page.blog',compact('post'));
        }else{
            return view('errors.404');
        }
    }

    public function blogcate($slug = null,$id,Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2){
            $str = $slug."-".$id;
            $arr = explode("-",$str);
            $id  = $arr[sizeof($arr)-1];
            $id_dm = $id;
            $slug = substr($str,0,strlen($str) - strlen($id)-1);
            $post_cate = Post_category::where('category_id',$id)->get();
            if(sizeof($post_cate)){
                $in = array();

                foreach ($post_cate as $key => $pc) {
                    array_push($in, $pc->post_id);
                }
                $post =Post::whereIn('id',$in)->where('status',1)->orderby('id','desc')->paginate(10);
                return view('frontend.page.blog_cate',['post'=>$post,'id_dm'=>$id_dm,'status'=>0]);
            }else{
                return view('frontend.page.blog_cate',['status'=>1,'id_dm'=>$id_dm]);
            }
        }else{
            return view('errors.404');
        }
    }

    public function blogtag($slug = null,$id,Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2){
            $str = $slug."-".$id;
            $arr = explode("-",$str);
            $id  = $arr[sizeof($arr)-1];
            $id_dm = $id;
            $post_tag = Tag_post::where('tag_id',$id)->get();
            if(sizeof($post_tag)){
                $in = array();
                foreach ($post_tag as $key => $pc) {
                    array_push($in, $pc->post_id);
                }
                $post =Post::whereIn('id',$in)->where('status',1)->orderby('id','desc')->paginate(10);
                return view('frontend.page.blog_tag',['post'=>$post,'id_dm'=>$id_dm,'status'=>0]);
            }
            else{
                return view('frontend.page.blog_tag',['status'=>1,'id_dm'=>$id_dm]);
            }
        }else{
            return view('errors.404');
        } 
    }

    public function blogpagi(Request $req){
        $post = Post::where('status',1)->orderby('id','desc')->paginate(10);
        $html = view('frontend.ajax.ajax-phan-trang-blog',['post'=>$post]);
        $ul = view('frontend.ajax.ajax-ul-blog',['post'=>$post]);
        return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
    }

    public function blogcatepagi(Request $req){
        $id_dm = $req->id;
        $post_cate = Post_category::where('category_id',$id_dm)->get();
        $in = array();

        foreach ($post_cate as $key => $pc) {
            array_push($in, $pc->post_id);
        }
        $post =Post::whereIn('id',$in)->where('status',1)->orderby('id','desc')->paginate(10);
        $html = view('frontend.ajax.ajax-phan-trang-blog',['post'=>$post]);
        $ul = view('frontend.ajax.ajax-ul-blogcate',['post'=>$post,'id_dm'=>$id_dm]);
        return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
    }
    public function blogtagpagi(Request $req){
        $id_dm = $req->id;
        $post_tag = Tag_post::where('tag_id',$id_dm)->get();
        $in = array();
        foreach ($post_tag as $key => $pc) {
            array_push($in, $pc->post_id);
        }
        $post =Post::whereIn('id',$in)->where('status',1)->orderby('id','desc')->paginate(10);
        $html = view('frontend.ajax.ajax-phan-trang-blog',['post'=>$post]);
        $ul = view('frontend.ajax.ajax-ul-blogcate',['post'=>$post,'id_dm'=>$id_dm]);
        return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
    }

    //pro
    public function ajaxproid(Request $req){
        $id = $req->id;
        $gr = $req->gr;
        $pro =$req->pro;
        $fra_cate = FramCate::where('cate_pro_id',$gr)->get();
        $in = array();
        foreach($fra_cate as $fc){
            $frame = Frame::where('id',$fc->frame_id)->where('product_id',$pro)->first();
            if (sizeof($frame)>0){
                array_push($in, $frame->id);
            }
        }
        
        $pr = Product::where('id',$pro)->first();
        if (sizeof($in)){
            $frame_show = Frame::whereIn('id',$in)->where('status',1)->get();
            if (sizeof($frame_show[$id])){
                $html = view('frontend.ajax.ajax-pro',['frame_show'=>$frame_show,'id'=>$id,'pr'=>$pr,'gr'=>$gr]);
                return json_encode(array('status'=>true,'html'=>$html.""));
            }
        }
                            
    }

    //search 
    public function AjaxProSearch(Request $req){
        $search = $req['search'];
        $id = $req->id;
        $pro = $req->pro;
        $pr = Product::where('id',$pro)->first();
        $frames = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->where(function ($query) use ($search) {
                $query->where('name','like',"%$search%")->orwhere('code_frame','like',"%$search%");
        })->where('status',1)->where('product_id',$pro)->get();
        foreach ($frames as $key => $item) {
            $id_product = $item->product_id;
            $frame_str =  $item->frame_str;
            $list_frame = explode(",",$frame_str);
              $in = array();
              foreach ($list_frame as $key => $id_frame) {
                  if($id_frame){
                    array_push($in, $id_frame);
                  }
              }
        }
        $frame_show = Frame::whereIn('id',$in)->where('status',1)->get();
        if (sizeof($frame_show[$id])){
            $html = view('frontend.ajax.ajax-search',['frame_show'=>$frame_show,'id'=>$id,'pr'=>$pr,'search_frames'=>$search]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }
    }


    public function AjaxShareFacebook(Request $req){
        $share = Session::get('share');
        if(!$share){
            Session::push('share',1);
        }else{
            Session::set('share',array(1));
        }

        $list_session = Session::get('frame');
        $total = 0;
        foreach ($list_session as $key => $item2) {
            if($item2['frame']->price_sale){
                $price = $item2['frame']->price_sale;
            }else{
                $price = $item2['frame']->price;
            }
            $price = $price;
            $total +=$price * $item2['num'];
        }
        $total = $total;
        $share = Session::get('share');

        $pieces = explode('.', $req->getHost());
        $discount_ = 0;
        $discount_type = "";
        if(sizeof($pieces)>2){
                // Kiểm tra Đại lý có event khuyến mại không
                $domain = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
                if(sizeof($domain)){
                     $event_active = $domain->event_active;
                     $EventSale = EventSale::find($event_active);
                     if($EventSale){
                        $curdate = date("d-m-Y");
                        $startdate = $EventSale->start_day;
                        $end_day = $EventSale->end_day;
                        $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                        $timestamp_c = $dtime1->getTimestamp();
                        $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                        $timestamp_s = $dtime2->getTimestamp();
                        $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                        $timestamp_e = $dtime3->getTimestamp();
                        if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                           // Nếu trong thời gian event
                           // => tính discount
                           // Kiểu event Giảm % hoặc trừ tiền  
                            $discount_type = "Chưa đủ điều kiện";
                           if($EventSale->type == 0 ){
                                // Giảm theo phần trăm
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                    $discount_type = $EventSale->percent."%";
                                }
                                if($EventSale->share == 0){
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;   
                                    $discount_type = $EventSale->percent."%"; 
                                }
                                // $order->percent = $percent;
                                
                           }else{
                                // Giảm theo hóa đơn
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    if( $total>=  $EventSale->money_min){
                                       $discount_ = $EventSale->money_sale;
                                       $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.');
                                    }
                                }
                                if($EventSale->share == 0){
                                    if($total >=  $EventSale->money_min){
                                       $discount_ = $EventSale->money_sale;
                                       $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.');
                                    }
                                }
                           }
                           
                        }else{
                           // nếu không trong thời gian event thì không làm gì cả
                        }
                     }
                     // Kiểm tra ngày tháng hiện tại với event
                     // Kiểm tra event discount phù hợp
                }
        }else{
             if(sizeof($pieces) == 2){
                $EventSale = EventSale::where('vivandi',1)->first();
                    if($EventSale){

                        $curdate = date("d-m-Y");
                        $startdate = $EventSale->start_day;
                        $end_day = $EventSale->end_day;
                        $dtime1 = DateTime::createFromFormat("d-m-Y", $curdate);
                        $timestamp_c = $dtime1->getTimestamp();
                        $dtime2 = DateTime::createFromFormat("d-m-Y", $startdate);
                        $timestamp_s = $dtime2->getTimestamp();
                        $dtime3 = DateTime::createFromFormat("d-m-Y", $end_day);
                        $timestamp_e = $dtime3->getTimestamp();
                        if($timestamp_c >= $timestamp_s && $timestamp_c <= $timestamp_e){
                           // Nếu trong thời gian event
                           // => tính discount
                           // Kiểu event Giảm % hoặc trừ tiền
                            $discount_type = "Chưa đủ điều kiện";
                           if($EventSale->type == 0 ){
                                // Giảm theo phần trăm
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                    $discount_type = $EventSale->percent."%";
                                }
                                if($EventSale->share == 0){
                                    $discount_ = ((float)$total*(float)$EventSale->percent)/100;
                                    $discount_type = $EventSale->percent."%";
                                }
                                // $order->percent = $percent;
                                
                           }else{
                                // Giảm theo hóa đơn
                                if($EventSale->share && $share[0]){
                                    // Kiểm tra điều kiện share
                                    if($total >=  $EventSale->money_min){
                                       $discount_ = $EventSale->money_sale;
                                       $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.');
                                    }
                                }
                                if($EventSale->share == 0){
                                    if($total >=  $EventSale->money_min){
                                        $discount_ = $EventSale->money_sale;
                                        $discount_type = "Giảm ".number_format((int)$EventSale->money_sale,0,'','.');
                                    }
                                }
                           }
                           
                        }else{
                           // nếu không trong thời gian event thì không làm gì cả
                        }
                    }
             }
        }
        $Configure_discounts = Configure_discounts::where('value','config_tichdiem')->first();
        if($share[0] == 1){
            // if($Configure_discounts){
            //     $all_total_ = ((float)$total*(float)$Configure_discounts->percent)/100;
            //     $all_total = (int)$total - (int)$all_total_;
            // }else{
            //     $all_total = $total;
            // }
            $all_total = $total - $discount_;
        }else{
            $all_total = $total;
        }
        return json_encode(array('status'=>true,'Configure_discounts'=>$Configure_discounts,'all_total'=>$all_total,'discount'=>$discount_,'discount_type'=>$discount_type));
    }

    public function AjaxTraCuuBaoHanh(Request $req){
        $phone = preg_replace('/[^\dxX]/', '', $req->phone);
            $x84 = substr($phone,0,2);
            if($x84 == 84){
                $phone = substr($phone,2);
            }
            $x0 = substr($phone,0,1);
            if($x0 != 0){
                $phone = "0".$phone;
            }
        $order  =  Order::where('phone',$phone)->where('status','>',4)->get();
        if(sizeof($order)){
            $html = view('frontend.ajax.ajax-tracuu-baohanh',['order'=>$order]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }else{
            return json_encode(array('status'=>false,'message'=>'Số điện thoại không đúng hoặc đơn hàng chưa được thanh toán'));
        }
    }

    public function SmBaoCaoDaiLy (Request $req){
        $tenkhachhang = $req->tenkhachhang;
        $phone = preg_replace('/[^\dxX]/', '', $req->phone);
            $x84 = substr($phone,0,2);
            if($x84 == 84){
                $phone = substr($phone,2);
            }
            $x0 = substr($phone,0,1);
            if($x0 != 0){
                $phone = "0".$phone;
            }
        $diachi = $req->diachi;
        $email = $req->email;
        $comment = $req->comment;
        $d_agency_check = $req->d_agency_check;
        if($d_agency_check != 0){
            $agency = Agency::find($d_agency_check); 
            $feedback = new Feedback;
            $feedback->name = $tenkhachhang;
            $feedback->phone = $phone;
            $feedback->address = $diachi;
            $feedback->email = $email;
            $feedback->content = $comment;
            $feedback->name_agency = $agency->name_agency;
            $feedback->address_agency = $agency->address_agency;
            $feedback->phone_agency = $agency->phone;
            $feedback->status = 0;
            if($feedback->save()){
                $img = $req->img_product;
                $list_img = explode(',,,',$img);
                foreach ($list_img as $key => $item) {
                    if($item){
                        $img = new Feedback_Image;
                        $img->feedback_id = $feedback->id;
                        $img->img = $item;
                        $img->save();
                    }
                }
                return json_encode(array('status'=>true));
            }
        }else{
            return json_encode(array('status'=>false,'message'=>"Bạn chưa chọn đại lý khiếu nại"));
        }
    }

    public function UploadImgCongtrinh(Request $req){
        if (!empty($_FILES)) {
              $file = Input::file('file');
              $nameimg  =  uniqid().'-'.date('d-m-Y').'-'.str_slug($file->getClientOriginalName()).".".$file->getClientOriginalExtension(); 
              $file->move(public_path().'/assets/upload/', $nameimg); 
              return '/assets/upload/'.$nameimg;
               
          }
          return '';
    }
    public function AjaxCheckAgency(Request $req){
        $value = $req->value;
        $agency = Agency::find($value);
        if($agency != null){
            return json_encode(array('status'=>true,'agency'=>$agency));
        }else{
            return json_encode(array('status'=>false));
        }
    }
    public function AjaxHetHang (Request $req){
        $emails = $req->email;
        $name = $req->name;
        $id_frame = $req->id_fr;
        $frame = Frame::find($id_frame);
        if($frame){
            $email = Email_out_of_stocks::where('email',$emails)->where('add_1',$frame->id)->first();
            if($email){
                return json_encode(array('status'=>false,'message'=>"Email này đã được đăng kí"));
            }else{
                $email_ = new Email_out_of_stocks;
                $email_->username = $name;
                $email_->email = $emails;
                $email_->name_product = $frame->name;
                $email_->code_product = $frame->code_frame;
                $email_->add_1 = $frame->id;
                $email_->status = 0;
                $email_->save();
                return json_encode(array('status'=>true));
            }
        }else{
            echo "false";
        }
    }
    public function AjaxDangKiDaiLi (Request $req){
        $name = $req->name;
        $address = $req->address;
        $email = $req->email;
        $comment = $req->comment;
        $phone = preg_replace('/[^\dxX]/', '', $req->phone);
            $x84 = substr($phone,0,2);
            if($x84 == 84){
                $phone = substr($phone,2);
            }
            $x0 = substr($phone,0,1);
            if($x0 != 0){
                $phone = "0".$phone;
            }
        $register = new Form;
        $register->text_1 = $name;
        $register->text_2 = $phone;
        $register->text_3 = $email;
        $register->text_4 = $address;
        $register->text_5 = $comment;
        $register->type = "Đăng ký đại lí";
        $register->status = 1;
        $register->save();
        return json_encode(array('status'=>true));

    }
}
