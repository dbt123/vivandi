<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Session;
use App\CategoryProduct;
use App\ProductAttribute;
use App\FrameAttribute;
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
use App\GroupAttribute;
use App\Model\RelationFrame;
use App\Model\RelationProduct;
use App\Model\FolderAttribute;
use DB;
use App\Agency;
use App\Agency_frame;

class domainFilterController extends Controller
{   
     //load filter
   public function LoadFilter(Request $req){
        $id = $req->id;
        $cate = GroupAttribute::find($id);
        $group = GroupAttribute::find($id);
        if(!$cate) return redirect('/');
        //_________________ GET FILTER IN GROUP ATTRIBUTE __________________
        $c = 0;
        $arr = array();
        $group_name = array();
        if($group){
          if(!in_array($group->filter_id,$arr)) array_push($arr, $group->filter_id);
        }
        while ($group) {
            $filter = Filter::find($group->filter_id);
            // dd($filter);
            if($filter){
              array_push($group_name, $filter->name);
            }
            $group = $group->parent;
            $c++; if( $c > 20 ) break;
        }
       //_________________ END FILTER IN GROUP ATTRIBUTE __________________
        $frame_list = array();
        $arr_id_frame = array();
        $list_attribute = FolderAttribute::where('folder_attributes.group_id',$cate->id)->leftjoin('attributes','attributes.id','=','folder_attributes.attribute_id')->orderby('name','asc')->get();
        $danh_sach_dinh_tinh = array(); //danh sách định tính
        $danh_sach_dinh_luong = array(); // danh sách định lượng
        foreach ($list_attribute as $key => $value) {
            $root_attr = Attribute::where('name',$value->name)->where('type',1)->first();
            if($root_attr){
                if($root_attr->status == 1){
                    if($value->avaiable==0){
                        array_push($danh_sach_dinh_tinh,$value->id);
                    }else{
                        array_push($danh_sach_dinh_luong,$value);
                    }
                }
            }
        }
        $filter_0 = Filter::wherein('attribute_id',$danh_sach_dinh_tinh)->where('type',0)->orderby('name','desc')->get();
        $filter_1 = Filter::where('type',1)->orderby('name','desc')->get();
        $in_filter = array();
        foreach ($danh_sach_dinh_luong as $key1 => $value1) {
            foreach ($filter_1 as $key3 => $value3) {
                if($value1->name == $value3->name && $value1->value <= $value3->max && $value1->value >= $value3->min){
                    array_push($in_filter,$value3->id);
                    unset($filter_1[$key3]);
                }
            }
        }
        $filter_y = Filter::where('type',1)->whereIn('id',$in_filter)->orderby('name','desc')->orderby('min','asc')->get();
        $list_filter = array();
        $filter = array();
        $html = view('frontend_center.filter.load-filter-cate',['filter'=>$filter,'filter_0'=>$filter_0,'filter_y'=>$filter_y,'list_filter'=>$list_filter,'frame_list'=>$frame_list,'group_name'=>$group_name]);
        return json_encode(array('status'=>true,'html'=>$html.""));
    } 

    public function ClickFilter(Request $req){
        $id = $req->id;
        $list_filter = $req->list;
        if(!$list_filter) $list_filter = array();
        $group = GroupAttribute::find($id);
        $group_cate = GroupAttribute::find($id);   
        if(!$group) return json_encode(array('status'=>false));
         //_________________ GET FILTER IN GROUP ATTRIBUTE __________________
        $c = 0;
        $arr = array();
        $group_name = array();
        foreach ($list_filter as $key => $value) {
            if(!in_array($value,$arr)) array_push($arr, $value);
        }
        if($group){
          if(!in_array($group->filter_id,$arr)) array_push($arr, $group->filter_id);
        }
        while ($group) {
          $filter = Filter::find($group->filter_id);
          if($filter){
              array_push($group_name, $filter->name);
          }
          $group = $group->parent;
          if($group){
              if(!in_array($group->filter_id,$arr)) array_push($arr, $group->filter_id);
          }
          $c++; if( $c > 20 ) break;
        }
         //_________________ END FILTER IN GROUP ATTRIBUTE __________________
        $filter_0 = Filter::whereIn('id',$arr)->where('type',0)->get();
        $filter_1 = Filter::whereIn('id',$arr)->where('type',1)->get();
        $ATTR_IN = array();

        foreach ($filter_0  as $key => $value) {
          if(!in_array($value->attribute_id, $ATTR_IN))array_push($ATTR_IN, $value->attribute_id);
        }
        $query_1 = "";
        foreach ($ATTR_IN as $key => $value) {
            if( $key == sizeof($ATTR_IN) - 1){
              $query_1 .= " ( string_attr LIKE '%,".$value.",%' ) ";
            }else{
              $query_1 .= " ( string_attr LIKE '%,".$value.",%') AND ";
            }
        }
        $query_2 = "";
        $c_a = 0;
        foreach ($filter_1  as $key => $value) {
          $str  = "";
          $attr = Attribute::where('name',$value->name)->where('type',0)->get();
          $c = 0;
          foreach ($attr as $k => $v) {
            if(ctype_digit((string) $v->value)){
                if((int)$v->value >= (int)$value->min && (int)$v->value <= (int)$value->max){
                  if($c==0){
                    $str .="( string_attr LIKE '%,".$v->id.",%' ) ";
                  }else{
                    $str .=" or ( string_attr LIKE '%,".$v->id.",%' ) ";
                  }
                  $c++;
                }
            }else{
                if((float)$v->value >= (float)$value->min && (float)$v->value <= (float)$value->max){
                  if($c==0){
                    $str .="( string_attr LIKE '%,".$v->id.",%' ) ";
                  }else{
                    $str .=" or ( string_attr LIKE '%,".$v->id.",%' ) ";
                  }
                  $c++;
                }
            }
          }
          if($c){
            if($c_a==0){
              $query_2 .= " ( ".$str." ) ";
            }else{
              $query_2 .= " AND ( ".$str." ) ";
            }
            $c_a++;
          } 
        }
        ##
        if($query_1){
          if($query_2){
            $xyz = DB::select(DB::raw("select frame_id, product_id , CONCAT(',', GROUP_CONCAT(attribute_id) ,',')  as string_attr FROM frame_attributes  where status_frame = 1  GROUP BY frame_id HAVING ".$query_1." and ".$query_2));
          }else{
            $xyz = DB::select(DB::raw("select frame_id, product_id , CONCAT(',', GROUP_CONCAT(attribute_id) ,',')  as string_attr FROM frame_attributes where status_frame = 1  GROUP BY frame_id HAVING ".$query_1));
          }
        }else{
          if($query_2){
            $xyz = DB::select(DB::raw("select frame_id, product_id , CONCAT(',', GROUP_CONCAT(attribute_id) ,',')  as string_attr FROM frame_attributes  where status_frame = 1 GROUP BY frame_id HAVING ".$query_2));
          }else{
            $xyz = DB::select(DB::raw("select frame_id, product_id , CONCAT(',', GROUP_CONCAT(attribute_id) ,',')  as string_attr FROM frame_attributes  where status_frame = 1 GROUP BY frame_id "));
          }
        }
        ##
        $arr = array();
        foreach ($xyz as $key => $value) {
          array_push($arr, $value->frame_id);
        }
        $list_san_pham = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->whereIn('id',$arr)->where('status',1)->groupby('product_id')->orderby('id','desc')->paginate(12);
        $attribute_count = FrameAttribute::select('frame_attributes.attribute_id','attributes.value','attributes.name','attributes.avaiable','attributes.id',DB::raw('count(*) as num'))->whereIn('frame_attributes.frame_id',$arr)->where('status_frame',1)->groupby('frame_attributes.attribute_id')->leftjoin('attributes',"frame_attributes.attribute_id",'=','attributes.id')->orderby('attributes.name','asc')->get();
        $danh_sach_dinh_tinh = array(); //danh sách định tính
        $danh_sach_dinh_luong = array(); // danh sách định lượng
        foreach ($attribute_count as $key => $value) {
            $root_attr = Attribute::where('name',$value->name)->where('type',1)->first();
            if($root_attr){
                if($root_attr->status == 1){
                    if($value->avaiable==0){
                        array_push($danh_sach_dinh_tinh,$value->id);
                    }else{
                        array_push($danh_sach_dinh_luong,$value);
                    }
                }
            }
        }
        $filter_0 = Filter::wherein('attribute_id',$danh_sach_dinh_tinh)->where('type',0)->orderby('name','desc')->get();
        $filter_1 = Filter::where('type',1)->orderby('name','desc')->get();
        $filter_y = array();
        $in_filter = array();
        foreach ($danh_sach_dinh_luong as $key1 => $value1) {
            foreach ($filter_1 as $key3 => $value3) {
                if(ctype_digit((string) $value1->value)){
                  if($value1->name == $value3->name && ((int)$value1->value) <= ((int)$value3->max) && ((int)$value1->value) >= ((int)$value3->min) ){
                        array_push($in_filter,$value3->id);
                        unset($filter_1[$key3]);
                  }
                }else{
                 
                  if($value1->name == $value3->name && ((float)$value1->value) <= ((float)$value3->max) && ((float)$value1->value) >= ((float)$value3->min) ){
                        array_push($in_filter,$value3->id);
                        unset($filter_1[$key3]);
                  }
                }
                
            }
        }
        $filter_y = Filter::where('type',1)->whereIn('id',$in_filter)->orderby('name','desc')->orderby('min','asc')->get();
        $filter = array();
        $html = view('frontend_center.filter.load-filter-cate',['filter'=>$filter,'filter_0'=>$filter_0,'filter_y'=>$filter_y,'list_filter'=>$list_filter,'frame_list'=>array(),'group_name'=>$group_name]);
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }
        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();
        $product_view = view('frontend_center.filter.load-filter-list-frame',array('frames'=>$list_san_pham,'group_attr'=>$group_cate,'frame_domain'=>$frame_domain));
        $product_paginate = view('frontend_center.filter.load-filter-paginate-frame',['frames'=>$list_san_pham,'group_attr'=>$group_cate]);
        return json_encode(array('status'=>true,'view'=>$html.'','product_view'=>$product_view.'','product_paginate'=>$product_paginate.""));
    }
    // search
    public function LoadFilterSearch(Request $req){
      $search = $req['search'];
      $a = trim($search);
      $frame_list = array();
      $arr_id_frame = array();
      $attribute_count =  Frame::where(function ($query) use ($search) {
                                    $query->where('frames.name','like',"%$search%")->orwhere('frames.code_frame','like',"%$search%");
        })->where('frames.status',1)->select(DB::raw('count(frame_attributes.attribute_id) as num'),"frame_attributes.attribute_id",'frame_attributes.id as xyz','frame_attributes.product_id','frame_attributes.frame_id','frame_attributes.status_frame','attributes.*')->rightjoin('frame_attributes','frames.id','=','frame_attributes.frame_id')->groupby('frame_attributes.attribute_id','frame_attributes.status_frame')->leftjoin('attributes','attributes.id','=','frame_attributes.attribute_id')->orderby('attributes.name')->get();
      $danh_sach_dinh_tinh = array(); //danh sách định tính
      $danh_sach_dinh_luong = array(); // danh sách định lượng
        foreach ($attribute_count as $key => $value) {
            $root_attr = Attribute::where('name',$value->name)->where('type',1)->first();
            if($root_attr){
                if($root_attr->status == 1){
                    if($value->avaiable==0){
                        array_push($danh_sach_dinh_tinh,$value->id);
                    }else{
                        array_push($danh_sach_dinh_luong,$value);
                    }
                }
            }
        }
      $filter_0 = Filter::wherein('attribute_id',$danh_sach_dinh_tinh)->where('type',0)->orderby('name','desc')->get();
      $filter_1 = Filter::where('type',1)->orderby('name','desc')->get();
      $filter_y = array();
      $in_filter = array();
      foreach ($danh_sach_dinh_luong as $key1 => $value1) {
          foreach ($filter_1 as $key3 => $value3) {
              if($value1->name == $value3->name && $value1->value <= $value3->max && $value1->value >= $value3->min){
                  array_push($in_filter,$value3->id);
                  unset($filter_1[$key3]);
              }
          }
      }
      $filter_y = Filter::where('type',1)->whereIn('id',$in_filter)->orderby('name','desc')->orderby('min','asc')->get();
      $filter = array();
      $list_filter = array();
      $group_name = array();
      $html = view('frontend_center.filter.load-filter-cate',['filter_0'=>$filter_0,'filter_y'=>$filter_y,'list_filter'=>$list_filter,'group_name'=>$group_name]);
      return json_encode(array('status'=>true,'html'=>$html.""));
    }

    // load_filter_click search
    public function load_filter_click_search(Request $req){
        $id = $req->id;
        $search = $req['search'];
        $a = trim($search);
        $list_filter = $req->list;
        if(!$list_filter) $list_filter = array();
        $arr = array();
        $group_name = array();
        foreach ($list_filter as $key => $value) {
            if(!in_array($value,$arr)) array_push($arr, $value);
        }
        $filter_0 = Filter::whereIn('id',$arr)->where('type',0)->get();
        $filter_1 = Filter::whereIn('id',$arr)->where('type',1)->get();
        $ATTR_IN = array();
        foreach ($filter_0  as $key => $value) {
          if(!in_array($value->attribute_id, $ATTR_IN))array_push($ATTR_IN, $value->attribute_id);
        }
        $query_1 = "";
        foreach ($ATTR_IN as $key => $value) {
            if( $key == sizeof($ATTR_IN) - 1){
              $query_1 .= " ( string_attr LIKE '%,".$value.",%' ) ";
            }else{
              $query_1 .= " ( string_attr LIKE '%,".$value.",%') AND ";
            }
        }
        $query_2 = "";
        $c_a = 0;
        foreach ($filter_1  as $key => $value) {
          $str  = "";
          $attr = Attribute::where('name',$value->name)->where('type',0)->get();
          $c = 0;
          foreach ($attr as $k => $v) {
            if($v->value >= $value->min && $v->value <= $value->max){
              if($c==0){
                $str .="( string_attr LIKE '%,".$v->id.",%' ) ";
              }else{
                $str .=" or ( string_attr LIKE '%,".$v->id.",%' ) ";
              }
                $c++;
            }
          }
          if($c){
            if($c_a==0){
              $query_2 .= " ( ".$str." ) ";
            }else{
              $query_2 .= " AND ( ".$str." ) ";
            }
            $c_a++;
          } 
        }
        if($query_1){
          if($query_2){
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1  GROUP BY frame_attributes.frame_id HAVING ".$query_1." and ".$query_2." "));
          }else{
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1  GROUP BY frame_attributes.frame_id HAVING ".$query_1." "));
          }
        }else{
          if($query_2){
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1 GROUP BY frame_attributes.frame_id HAVING ".$query_2."  "));
          }else{
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1 GROUP BY frame_attributes.frame_id "));
          }
        }
        $arr = array();
        foreach ($xyz as $key => $value) {
          array_push($arr, $value->frame_id);
        }
        $list_san_pham = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->whereIn('id',$arr)->where('status',1)->groupby('product_id')->orderby('id','desc')->paginate(12);
        $attribute_count = FrameAttribute::select('frame_attributes.attribute_id','attributes.value','attributes.name','attributes.avaiable','attributes.id',DB::raw('count(*) as num'))->whereIn('frame_attributes.frame_id',$arr)->where('status_frame',1)->groupby('frame_attributes.attribute_id')->leftjoin('attributes',"frame_attributes.attribute_id",'=','attributes.id')->orderby('attributes.name','asc')->get();
        $danh_sach_dinh_tinh = array(); //danh sách định tính
        $danh_sach_dinh_luong = array(); // danh sách định lượng
        foreach ($attribute_count as $key => $value) {
            $root_attr = Attribute::where('name',$value->name)->where('type',1)->first();
            if($root_attr){
                if($root_attr->status == 1){
                    if($value->avaiable==0){
                        array_push($danh_sach_dinh_tinh,$value->id);
                    }else{
                        array_push($danh_sach_dinh_luong,$value);
                    }
                }
            }
        }
        $filter_0 = Filter::wherein('attribute_id',$danh_sach_dinh_tinh)->where('type',0)->orderby('name','desc')->get();
        $filter_1 = Filter::where('type',1)->orderby('name','desc')->get();
        $filter_y = array();
        $in_filter = array();
        foreach ($danh_sach_dinh_luong as $key1 => $value1) {
            foreach ($filter_1 as $key3 => $value3) {
                if(ctype_digit((string) $value1->value)){
                  if($value1->name == $value3->name && (int)$value1->value <= (int)$value3->max && (int)$value1->value >= (int)$value3->min){
                        array_push($in_filter,$value3->id);
                        unset($filter_1[$key3]);
                  }
                }else{
                  if($value1->name == $value3->name && (float)$value1->value <= (float)$value3->max && (float)$value1->value >= (float)$value3->min){
                        array_push($in_filter,$value3->id);
                        unset($filter_1[$key3]);
                  }
                }
            }
        }
        $filter_y = Filter::where('type',1)->whereIn('id',$in_filter)->orderby('name','desc')->orderby('min','asc')->get();
        $filter = array();
        $html = view('frontend_center.filter.load-filter-cate',['filter'=>$filter,'filter_0'=>$filter_0,'filter_y'=>$filter_y,'list_filter'=>$list_filter,'group_name'=>$group_name]);
        $pieces = explode('.', $req->getHost());
        $center = Agency::where('subdomain',$pieces[0])->first();
        $agency_frame = Agency_frame::where('agency_id',$center->id)->get();
        $in =array();
        foreach ($agency_frame as $key => $af) {
            array_push($in, $af->frame_id);
        }
        $frame_domain =Frame::whereIn('id',$in)->where('status',1)->get();
        $product_view = view('frontend_center.filter.load-filter-click-search',array('frames'=>$list_san_pham,'search_frames'=>$a,'frame_domain'=>$frame_domain));
        $product_paginate = view('frontend_center.filter.load-filter-click-paginate-search',['frames'=>$list_san_pham,'status'=>1,'search_frames'=>$a]);
        return json_encode(array('status'=>true,'view'=>$html.'','product_view'=>$product_view.'','product_paginate'=>$product_paginate.''));
    }

    // paginete search
    public function load_filter_click_search_paginate(Request $req){
        $id = $req->id;
        $search = $req['search'];
        $a = trim($search);
        $arr = array();
        $group_name = array();
        $filter_0 = Filter::whereIn('id',$arr)->where('type',0)->get();
        $filter_1 = Filter::whereIn('id',$arr)->where('type',1)->get();
        $ATTR_IN = array();
        foreach ($filter_0  as $key => $value) {
          if(!in_array($value->attribute_id, $ATTR_IN))array_push($ATTR_IN, $value->attribute_id);
        }
        $query_1 = "";
        foreach ($ATTR_IN as $key => $value) {
            if( $key == sizeof($ATTR_IN) - 1){
              $query_1 .= " ( string_attr LIKE '%,".$value.",%' ) ";
            }else{
              $query_1 .= " ( string_attr LIKE '%,".$value.",%') AND ";
            }
        }
        $query_2 = "";
        $c_a = 0;
        foreach ($filter_1  as $key => $value) {
          $str  = "";
          $attr = Attribute::where('name',$value->name)->where('type',0)->get();
          $c = 0;
          foreach ($attr as $k => $v) {
            if($v->value >= $value->min && $v->value <= $value->max){
              if($c==0){
                $str .="( string_attr LIKE '%,".$v->id.",%' ) ";
              }else{
                $str .=" or ( string_attr LIKE '%,".$v->id.",%' ) ";
              }
                $c++;
            }
          }
          if($c){
            if($c_a==0){
              $query_2 .= " ( ".$str." ) ";
            }else{
              $query_2 .= " AND ( ".$str." ) ";
            }
            $c_a++;
          } 
        }
        if($query_1){
          if($query_2){
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1  GROUP BY frame_attributes.frame_id HAVING ".$query_1." and ".$query_2." "));
          }else{
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1  GROUP BY frame_attributes.frame_id HAVING ".$query_1." "));
          }
        }else{
          if($query_2){
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1 GROUP BY frame_attributes.frame_id HAVING ".$query_2."  "));
          }else{
            $xyz = DB::select(DB::raw("select frame_attributes.frame_id, frame_attributes.product_id , CONCAT(',', GROUP_CONCAT(frame_attributes.attribute_id) ,',')  as string_attr FROM frame_attributes left join frames on frames.id = frame_attributes.frame_id where (frames.name LIKE '%".$search."%' or frames.code_frame LIKE '%".$search."%' ) and frame_attributes.status_frame = 1 GROUP BY frame_attributes.frame_id "));
          }
        }
        $arr = array();
        foreach ($xyz as $key => $value) {
          array_push($arr, $value->frame_id);
        }
        $list_san_pham = Frame::select("product_id",DB::raw("CONCAT(',', GROUP_CONCAT(id) ,',')  as frame_str") )->whereIn('id',$arr)->where('status',1)->groupby('product_id')->orderby('id','desc')->paginate(12);
        $attribute_count = FrameAttribute::select('frame_attributes.attribute_id','attributes.value','attributes.name','attributes.avaiable','attributes.id',DB::raw('count(*) as num'))->whereIn('frame_attributes.frame_id',$arr)->where('status_frame',1)->groupby('frame_attributes.attribute_id')->leftjoin('attributes',"frame_attributes.attribute_id",'=','attributes.id')->orderby('attributes.name','asc')->get();
        $danh_sach_dinh_tinh = array(); //danh sách định tính
        $danh_sach_dinh_luong = array(); // danh sách định lượng
        foreach ($attribute_count as $key => $value) {
            $root_attr = Attribute::where('name',$value->name)->where('type',1)->first();
            if($root_attr){
                if($root_attr->status == 1){
                    if($value->avaiable==0){
                        array_push($danh_sach_dinh_tinh,$value->id);
                    }else{
                        array_push($danh_sach_dinh_luong,$value);
                    }
                }
            }
        }
        $filter_0 = Filter::wherein('attribute_id',$danh_sach_dinh_tinh)->where('type',0)->orderby('name','desc')->get();
        $filter_1 = Filter::where('type',1)->orderby('name','desc')->get();
        $filter_y = array();
        $in_filter = array();
        foreach ($danh_sach_dinh_luong as $key1 => $value1) {
            foreach ($filter_1 as $key3 => $value3) {
                if(ctype_digit((string) $value1->value)){
                  if($value1->name == $value3->name && (int)$value1->value <= (int)$value3->max && (int)$value1->value >= (int)$value3->min){
                        array_push($in_filter,$value3->id);
                        unset($filter_1[$key3]);
                  }
                }else{
                  if($value1->name == $value3->name && (float)$value1->value <= (float)$value3->max && (float)$value1->value >= (float)$value3->min){
                        array_push($in_filter,$value3->id);
                        unset($filter_1[$key3]);
                  }
                }
            }
        }
        $filter_y = Filter::where('type',1)->whereIn('id',$in_filter)->orderby('name','desc')->orderby('min','asc')->get();
        $filter = array();
        $product_view = view('frontend_center.filter.load-filter-click-search',array('frames'=>$list_san_pham,'search_frames'=>$a));
        $product_paginate = view('frontend_center.filter.load-filter-click-paginate-search',['frames'=>$list_san_pham,'status'=>1,'search_frames'=>$a]);
        return json_encode(array('status'=>true,'product_view'=>$product_view.'','product_paginate'=>$product_paginate.''));
    }


}
