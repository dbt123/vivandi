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
use App\Order_agency;
use App\Agency_frame;
use App\Frame;
use App\Slide_Agency;
use Redirect;
use DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class CenterController extends Controller
{
    //
    public function index(){
    	return view('backend_center.index');
    }

     public function listpro(Request $req){
        $search = trim($req->search);
        $pro_id = Agency_frame::where('agency_id',session('center')->id)->get();
        $in = array();
        foreach($pro_id as $pi){
            array_push($in,$pi->frame_id);
        }
        $frame = Frame::whereIn('id',$in)->paginate(5);
        
        return view('backend_center.page.listpro',compact('frame','search'));   
    }

    public function SearchProCenter(Request $req){
        $search = trim($req->search);
        $pro_id = Agency_frame::where('agency_id',session('center')->id)->get();
        $in = array();
        foreach($pro_id as $pi){
            array_push($in,$pi->frame_id);
        }
        $frame = Frame::whereIn('id',$in)->where(function ($query) use ($search) {
                $query->where('name','like',"%$search%")->orwhere('code_frame','like',"%$search%");
        })->paginate(5);
        
        return view('backend_center.page.listpro',compact('frame','search')); 
    }


    public function getInfo(){
    	$agency = Agency::where('id',session('center')->id)->first();
    	return view('backend_center.page.info',compact('agency'));	
    }

    public function postInfo(Request $req){
        $name_agency = $req->name_agency;
        $representative = $req->representative;
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
        $email = $req->email;
        $password = $req->password;
        $location = $req->location;
        $search_location = $req->address;
        $id = $req->agency_id;
        $agency = Agency::find($id);
        $email_a = Agency::where('email',$email)->first();
        if((sizeof($email_a) >0) && ($email != $agency->email ) ){
            return redirect()->back()->with('error','Email này đã tồn tại . Vui lòng chọn email khác ');
        }else{
            
            $agency->name_agency = $name_agency;
            $agency->add_1 = str_slug($name_agency);
            $agency->representative = $representative;
            $agency->phone = $phone;
            $agency->email = $email;
            $agency->address_agency = $search_location;
            $agency->location = $location;
            if($password != $agency->password){
                $agency->password = md5($password);
            }else{
                $agency->password = $password;
            }
            $agency->status = $agency->status;
            $agency->save();
            return redirect()->back()->with('success','Sửa thành công'); 
        }
    }

     public function getBuild(){
        return view('backend_center.page.build');   
    }

    public function postBuild(Request $req){
        $contruct = new Contruct;
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
        $contruct->agency_id = session('center')->id;
        $link_youtube = $req->youtube;
        if(!$link_youtube) $link_youtube = array();
        $arr_youtube = array();
        foreach ($link_youtube as $key => $value) {
          if(trim($value)) array_push($arr_youtube, $value);
        }
        $contruct->youtube_link = json_encode($arr_youtube);
        if($contruct->save()){
                $img_text = $req->img_product;
                  $list_img = explode(',,,',$img_text);
                  foreach($list_img as $item){
                    if($item){
                      $img_contruct = new Contruct_image;
                      $img_contruct->contruct_id = $contruct->id;
                      $img_contruct->img = $item;
                      $img_contruct->group_name  = "";
                      $img_contruct->type  = "";
                      $img_contruct->save();
                    }
              }

              
            $content = new Contruct_content;
            $content->contruct_id = $contruct->id;
            $content->content = $req->post_content;
            $content->save();
            return redirect()->route('build.center')->with('success','Gửi công trình Thành Công');
        }  
    }

    public function uploadImg(){
          if (!empty($_FILES)) {
                $file = Input::file('file');
                $nameimg  =  uniqid().'-'.date('d-m-Y').'-'.str_slug($file->getClientOriginalName()).".".$file->getClientOriginalExtension(); 
                $file->move(public_path().'/assets/upload/', $nameimg);
                return '/assets/upload/'.$nameimg;
          }
          return '';
        }

     //slide
    public function listslide(){
        $data = Slide_Agency::where('agency_id',session('center')->id)->get();
        return view('backend_center.page.listslide',compact('data'));
    }

    public function formAdd(Request $req){
        $agency_id =$req->agency_id;
        $s = new Slide_Agency;
        $s->agency_id = $agency_id;
        
        if($req->hasFile('img_1')){
            $file = array('image' => Input::file('img_1'));
            $rules = array('image' => 'mimes:jpeg,bmp,png');
            $validator = Validator::make($file, $rules);
            if ($validator->fails()) {
                
            }else{
                $file = Input::file('img_1');
                $nameimg  =  uniqid().'-'.date('d-m-Y').'.'.$file->getClientOriginalName(); 
                $file->move(public_path().'/assets/slide/', $nameimg); 
                $s->img  = '/assets/slide/'.$nameimg;
            }
        }
        
        $s->status = 0;
        $s->save();
         return Redirect::to(route('list.center.slide'));

        
    }

    public function formSave(Request $req){
        $agency_id =$req->agency_id;
        $img_id = $req->img_id;
        $s = Slide_Agency::Find($img_id);
        if($s){
            $s->agency_id = $agency_id;
            if($req->hasFile('img_1')){
                $file = array('image' => Input::file('img_1'));
                $rules = array('image' => 'mimes:jpeg,bmp,png');
                $validator = Validator::make($file, $rules);
                if ($validator->fails()) {
                    
                }else{
                    $file = Input::file('img_1');
                    $nameimg  =  uniqid().'-'.date('d-m-Y').'.'.$file->getClientOriginalName(); 
                    $file->move(public_path().'/assets/slide/', $nameimg); 
                    $s->img  = '/assets/slide/'.$nameimg;
                }
            }
            
            $s->save();
            return Redirect::to(route('list.center.slide'));


            // return Redirect::to(route('slide.edit',['slide_type_id'=>$s_id,'slide_id'=>$img_id]))->with('success','Chỉnh sửa thành công <a style="color:blue" href="'.route('slide.manage',['id'=>$s_id]).'">Quay lại danh sách</a>');
        }

         return redirect()->route('center.home');
        
    }

    public function delSlide(Request $req){
        $id = $req->id;
        DB::table('Slide_Agencys')->where('id',$id)->delete();
        return json_encode(array('status'=>true));
    }

    public function SlideCheck(Request $req){
        $id = $req->id;
        $slide = Slide_Agency::Find($id);
        
        if($slide){
            if($req->pin== true){
                    $slide->status  = 1;
            }else{
                    $slide->status = 0;
            }
            $slide->save();

            dd($slide);
        }
        return json_encode(array('status'=>true));
    }
    
}
