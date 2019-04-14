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
use DB;
use App\Agency;


class DomainController extends Controller
{
    //
    public function index($account,Request $request){
        // dd($account);
        // $pieces = explode('.', $request->getHost());
        // dd($pieces);
        $center = Agency::where('subdomain',$account)->where('status',1)->first();
       
        if (sizeof($center)){
            $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
            $in =array();
            foreach ($agency_frame as $key => $af) {
                array_push($in, $af->frame_id);
            }
            $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();
            $group = CategoryProduct::get();
            return view('frontend_center.page.home',compact('group','frame_domain','center'));
        }
        else{
            return view('errors.404');
        }

    }

    public function getCategory($slug = null,$id,Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==3){
            $center = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
            if (sizeof($center)){
                $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
                $in =array();
                foreach ($agency_frame as $key => $af) {
                    array_push($in, $af->frame_id);
                }
                $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();
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
                        return view('frontend_center.page.category',['frames'=>$frames,'group_attr'=>$group_attr,'frame_domain'=>$frame_domain]);
                    }
                }else{
                    return view('errors.404');
                }
            }else{
                    return view('errors.404');
                }
        }
        else{
                return view('errors.404');
            }

    }

    public function AjaxPaginationCate(Request $req){
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }
        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();

        $id = $req->id_group;
        $page = $req->page;
        $group_attr = GroupAttribute::find($id);
        if($group_attr){
            $frames = RelationFrame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(frame_id) ,',')  as frame_str") )->where('relation_frame.group_id',$group_attr->id)->groupby('product_id')->where('status',1)->orderby('frame_id','desc')->paginate(12);
            $html = view('frontend_center.ajax.ajax-phan-trang-cate',['frames'=>$frames,'group_attr'=>$group_attr,'frame_domain'=>$frame_domain]);
            $ul = view('frontend_center.ajax.ajax-ul-cate',['frames'=>$frames,'group_attr'=>$group_attr]);
            return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function ajaxproiddomain(Request $req){
        // dd("1");
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }
        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();

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
                $html = view('frontend_center.ajax.ajax-pro',['frame_show'=>$frame_show,'id'=>$id,'pr'=>$pr,'gr'=>$gr,'frame_domain'=>$frame_domain]);
                return json_encode(array('status'=>true,'html'=>$html.""));
            }
        }
                            
    }

    public function ajaxproidcate(Request $req){
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }
        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();

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
            $html = view('frontend_center.ajax.ajax-pro',['frame_show'=>$frame_show,'id'=>$id,'pr'=>$pr,'gr'=>$gr,'frame_domain'=>$frame_domain]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }
                            
    }

    public function getProDetail($slug = null,$id,Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==3){
            $center = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
            if (sizeof($center)){
                $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
                $in =array();
                foreach ($agency_frame as $key => $af) {
                    array_push($in, $af->frame_id);
                }
                $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();

                $str = $slug."-".$id;
                $arr = explode('-',$str);
                if(sizeof($arr)){
                    $id = $arr[sizeof($arr)-1];
                    $slug =  substr($str,0,strlen($str) - strlen($id)-1);
                    $frame = Frame::where('id',$id)->where('slug',$slug)->where('status',1)->first();
                    // check frame exist
                    if($frame){
                        $list_frame = Frame::whereIn('id',$in)->where('product_id',$frame->product_id)->where('status',1)->get();
                        return view('frontend_center.page.prodetail',['list_frame'=>$list_frame,'frame'=>$frame,'frame_domain'=>$frame_domain]);
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
        else{
                return view('errors.404');
            }
    }

    //tim kiem
    public function getSearch(Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==3){
            $center = Agency::where('subdomain',$pieces[0])->where('status',1)->first();
            if (sizeof($center)){
                $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
                $in =array();
                foreach ($agency_frame as $key => $af) {
                    array_push($in, $af->frame_id);
                }
                $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();

                $search = $req['search'];
                $search_frames = trim($search);
                    $frame_des = Frame::where(function($query) use ($search_frames){
                    $query->where('name','like',"%$search_frames%")->orwhere('code_frame','like',"%$search_frames%");
                })->where('status',1)->get();
                    
                    if(sizeof($frame_des) > 0 && $search_frames != ''){
                        $frames = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->where(function ($query) use ($search_frames) {
                                $query->where('name','like',"%$search_frames%")->orwhere('code_frame','like',"%$search_frames%");
                        })->where('status',1)->groupby('product_id')->paginate(12);
                    return view('frontend_center.page.tim-kiem',['status'=>0,'frames'=>$frames,'search_frames'=>$search_frames,'frame_des'=>$frame_des,'frame_domain'=>$frame_domain]);
                    }else{
                        return view('frontend_center.page.tim-kiem',['status'=>1,'search_frames'=>$search_frames]);
                    }
            }else{
                return view('errors.404');
            }
        }
        else{
                return view('errors.404');
            }
    }

    public function AjaxProSearch(Request $req){
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }

        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();
        $search = $req->search;
        $id = $req->id;
        $pro = $req->pro;
        $pr = Product::where('id',$pro)->first();
        $frames = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->where(function ($query) use ($search) {
                $query->where('name','like',"%$search%")->orwhere('code_frame','like',"%$search%");
        })->where('product_id',$pro)->where('status',1)->get();
        foreach ($frames as $key => $item) {
            
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
            $html = view('frontend_center.ajax.ajax-search',['frame_show'=>$frame_show,'id'=>$id,'pr'=>$pr,'search_frames'=>$search,'frame_domain'=>$frame_domain]);
            return json_encode(array('status'=>true,'html'=>$html.""));
        }
    }

    public function AjaxPaginationSearch(Request $req){
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }
        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();

        $search = $req['search'];
        $search_frames = trim($search);
        $frames = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->where(function ($query) use ($search_frames) {
                $query->where('name','like',"%$search_frames%")->orwhere('code_frame','like',"%$search_frames%");
        })->where('status',1)->groupby('product_id')->paginate(12);
        $html = view('frontend_center.ajax.ajax-phan-trang-search',['frames'=>$frames,'search_frames'=>$search_frames,'frame_domain'=>$frame_domain]);
        $ul = view('frontend_center.ajax.ajax-ul-search',['frames'=>$frames,'search_frames'=>$search_frames]);
        return json_encode(array('status'=>true,'html'=>$html."",'ul'=>$ul.""));
    }
    

    
}
