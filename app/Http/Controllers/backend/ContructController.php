<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Contruct;
use App\Contruct_content;
use App\Contruct_image;
use App\Frame_Contruct;
use App\Frame;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class ContructController extends Controller
{
    //
    public function DelContruct(Request $req){
        $id = $req->id;
        $contruct = Contruct::find($id);
        $content = Contruct_content::where('contruct_id',$id)->delete();
        $image = Contruct_image::where('contruct_id',$id)->delete();
        $frame_contruct = Frame_Contruct::where('contruct_id',$id)->delete();
        $contruct->delete();
        echo "true";
    }

     public function getEditContruct($id){
        $contruct = Contruct::where('id',$id)->first();
        $content = Contruct_content::where('contruct_id',$id)->first();
        $image = Contruct_image::where('contruct_id',$id)->get();
        return view('backend.agency.edit-congtrinh',compact('contruct','content','image'));

    }

    public function postEditContruct(Request $req){
        $contruct = Contruct::find($req->contruct_id);
        if ($req->name){
            $contruct->name =$req->name;
        }
        if ($req->address){
            $contruct->address=$req->address;
        }
        if ($req->phone){
            $contruct->phone = $req->phone;
        }
        if ($req->customer){
            $contruct->customer = $req->customer;
        }

        $link_youtube = $req->youtube;
        if(!$link_youtube) $link_youtube = array();
        $arr_youtube = array();
        foreach ($link_youtube as $key => $value) {
          if(trim($value)) array_push($arr_youtube, $value);
        }
        $contruct->youtube_link = json_encode($arr_youtube);
        if($contruct->save()){
            $img_array = array();
              $img_text = $req->img_product;
              $list_images =  explode(",,,", $img_text);
              foreach ($list_images as $key => $value) {
                    if($value){
                        $img_contruct =  Contruct_image::where('img','=', $value)->first();
                        if(!$img_contruct){
                          $img_contruct = new Contruct_image;
                          $img_contruct->contruct_id = $req->contruct_id;
                          $img_contruct->img = $value;
                          $img_contruct->group_name  = "";
                          $img_contruct->type  = "";
                          $img_contruct->save();
                        }
                        array_push($img_array, $img_contruct->id);
                    }               
              }
              $imgs_delete = Contruct_image::where('contruct_id',$req->contruct_id)->whereNotIn('id', $img_array)->get();
              foreach ($imgs_delete as  $value) {
                File::delete($value);
                $value->delete();
              }

            $content = Contruct_content::where('contruct_id',$req->contruct_id)->first();
            $content->content = $req->post_content;
            $content->save();
            return redirect()->route('list.cong.trinh')->with('success','Sửa Công trình thành công');
        }

          

    }

    public function ListContruct(Request $req){
        $search = trim($req->search);
        $list_contruct = Contruct::orderby('id','desc')->paginate(5);
        return view('backend.agency.list-congtrinh',['list_contruct'=>$list_contruct,'search'=>$search]);
    }

    public function SearchContruct(Request $req){
        $search = trim($req->search);
        $list_contruct = Contruct::where('name','like',"%$search%")->orderby('id','desc')->paginate(5);
         return view('backend.agency.list-congtrinh',['list_contruct'=>$list_contruct,'search'=>$search]);
    }

    public function FrameContructList ($id){
        $contruct = Contruct::find($id);
        $search = '';
        
        $list = Frame_Contruct::where('contruct_id',$id)->get() ;
        $arr = array();
        foreach ($list as $key => $value) {
            array_push($arr, $value->frame_id);
        }
        $frame = Frame::whereIn('id',$arr)->where('status',1)->orderby('updated_at')->paginate(15);
        return view('backend.agency.frame-contruct-list',['contruct'=>$contruct,'frame'=>$frame,'search'=>$search]);
            
    }

    public function AjaxSearchFrameContruct(Request $req){
        $val = $req->val;
        $id = $req->id;
        $contruct = Contruct::find($id);
        $list = Frame_Contruct::where('contruct_id',$id)->get() ;
        $arr = array();
        foreach ($list as $key => $value) {
            array_push($arr, $value->frame_id);
        }
        $frame = Frame::whereNotIn('id',$arr)->where(function($query) use ($val){
            $query->where('name','like',"%$val%")->orwhere('code_frame','like','%$val%');
        })->where('status',1)->limit(10)->get();
        if($val != "" && sizeof($frame) > 0){
            $html = view('backend.agency.ajax-search-frame-contruct',['frame'=>$frame]);
            return json_encode(array('status'=>true,'html'=>$html."",'frame'=>$frame));
        }else{
            return json_encode(array('status'=>false));
        }
    }

    public function SubmitFrameContruct(Request $req){
        $id = $req->id;
        $frame_contruct = $req->frame_contruct;
        $contruct = Contruct::find($id);
        if($contruct){
            for ($i=0; $i < sizeof($frame_contruct) ; $i++) { 
                $contruct_frame = new Frame_Contruct;
                $contruct_frame->contruct_id = $contruct->id;
                $contruct_frame->frame_id = $frame_contruct[$i];
                $contruct_frame->save();
            }
                return json_encode(array('status'=>true));
        }else{
                return json_encode(array('status'=>false));
        }
    }

    public function DelFrameContruct(Request $req){
        $id = $req->id;
        $id_contruct = $req->contruct;
        $contruct = Contruct::find($id_contruct);
        $list_contruct = Frame_Contruct::where('contruct_id',$id_contruct)->get();
        foreach ($list_contruct as $key => $item){
            if($item->frame_id == $id){
                $item->delete();
            }
        }
        echo "true";
    }
}
