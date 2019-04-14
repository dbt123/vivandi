<?php

namespace App\Http\Controllers\backend_center;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Agency;
use Session;
use Redirect;
use App\System;
use Mail;

class loginCController extends Controller
{
    //
   public function getLogin(Request $req){
        $pieces = explode('.', $req->getHost());
        if (sizeof($pieces)==2){
          if(session('center')){
              return Redirect::to(route('build.center'));
          }else{
              return view('backend_center.login');
          }
        }else{
          return view('errors.404');
        }
      
    }

     public function postLogin(Request $req){
         if(session('center')){
            return Redirect::to('/quan-tri/dai-ly');
        }else{
            $email= $req->email;
            $password = $req->password;
            $center = Agency::where('email',$email)->where('password',md5($password))->where('status',1)->first();
            if($center){
                Session::put('center', $center);
                return Redirect::to(route('build.center'));
            }
            return Redirect::to(route('login.center'))->with(['error'=>'Đăng nhập thất bại']);
        }
    }
    

   

    public function getLogout(){
        Session::forget('center');
        return Redirect::to(route('login.center'))->with(['info'=>'Bạn vừa đăng xuất, để sử dụng lại hệ thống vui lòng đăng nhập lại']);
    }

    function rand_string( $length ) {
       $chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
       $size = strlen( $chars );
       $str = "";
       for( $i = 0; $i < $length; $i++ ) {
       $str .= $chars[ rand( 0, $size - 1 ) ];
       }
       $str = substr( str_shuffle( $chars ), 0, $length );
       return $str;
   }


    public function forgetpass(){
        return view('backend_center.forgetpass');
    }

    public function forgetpasspost(Request $req){
        if(!$req->email){
         return Redirect::to(route('login.center.forget'))->with(['error','Bạn chưa nhập email']);
        }
       
        $center = Agency::where('email',$req->email)->first();
        if (sizeof($center)==0){
            return redirect()->route('login.center.forget')->with('error',"Tài khoản này không tồn tại");
        }
        else{
             $center->key= $this->rand_string(20);
             $center->save();
             try {
              $mail = System::select('email_send','email_password')->first();
                   if ( !empty($mail->email_send) && !empty($mail->email_password) ) {
                       config(['mail.username' => $mail->email_send]);
                       config(['mail.password' => $mail->email_password]);
                       config(['mail.port' => "587"]);
                       config(['mail.host' => "smtp.gmail.com"]);
                       config(['mail.encryption' => "tls"]);
                       
                       $data = array('link'=>route('login.center.repass',['id'=>$center->id,'key'=>$center->key]),'name'=>$center->name); 
                       if($req->email){
                               Mail::send('backend_center.page.mailmatkhau',$data, function($message) use ($mail,$req){
                               $message->from($mail->email_send); 
                               $message->to($req->email, 'Admin')->subject('Vivandi-Thay đổi mật khẩu');
                               
                           });
                          return Redirect::to(route('login.center'))->with(['info'=>'Bạn hãy vào mail để kiểm tra']);
                       }
                   }
               }catch (Exception $e) {       
               }
            }

       
    }

    public function repass($id,$key){
          $acc = Agency::where('id',$id)->first();
          if ($acc->key == $key){
             return view('backend_center.repass');
          }
          else return view('errors.404');
    }

    public function postrepass($id,$key,Request $req){
      $acc = Agency::where('id',$id)->first();
      // kiem tra acc ton tai
      if (sizeof($acc)!=0){
      // kiem tra key post == key trong acc thi update
         if ($acc->key != $key){
            // return dang ky
            return Redirect::to(route('login.center'))->with(['error'=>'Hành động của bạn gây nguy hiểm cho hệ thống']);
         }
         else  {
            if (!$req->password){
               return redirect()->route('login.center.repass',['id'=>$id,'key'=>$key])->with('error',"Bạn chưa nhập mật khẩu");  
            }
            if (!$req->repassword){
               return redirect()->route('login.center.repass',['id'=>$id,'key'=>$key])->with('error',"Bạn chưa nhập lại mật khẩu");  
            }
            if ($req->repassword!=$req->password){
               return redirect()->route('login.center.repass',['id'=>$id,'key'=>$key])->with('error',"Xác nhận mật khẩu không đúng");  
            }
            else{
               $acc =Agency::where('id',$id)->first();
               $acc->password = md5($req->password);
               $acc->key = $this->rand_string(20);
               $acc->save();
               return Redirect::to(route('login.center'))->with(['info'=>'Bạn đã thay đổi mật khẩu thành công']);
            }
         }
      }
    }
}
