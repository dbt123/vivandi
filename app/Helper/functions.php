<?php
function cate_parent ($data, $parent=0, $str='', $select=0){
	foreach($data as $val){
	   $name =$val["name"];
	   $id   =$val["id"];
	   if($val["parent_id"] ==$parent){

	    if($select !=0 && $id == $select){
	      echo "<option value='$id' selected='selected'> $str $name</option>";
	    }
	     else{
	      echo "<option value='$id'> $str $name</option>";
          }
	    cate_parent($data,$id,$str.'--',$select);
 	   }
	  
	}
	
}
function choose_menu_link ($data, $type, $parent=0, $str='', $select='')
{   //dd($data);
	//dd($select);
	foreach($data as $item){
		  
		  $name = $item->name;
		  if($type == "danh-muc-bai-viet"){
		  	$slug = $type.'/'.$item->prefix.'-'.$item->id;
		  	if($item->parent_id ==$parent){
				if($select !='' && $slug == $select){

					 echo "<option value='$slug' selected='selected'> $str $name</option>";
				}
				else{
	                echo "<option value='$slug'> $str $name</option>";
				}
				choose_menu_link($data,$type, $item->id,$str.'--', $select );
			}
		  }else{
		  	$slug = $type.'/'.str_slug($item->name).'-'.$item->id;
		  	if($item->group_id ==$parent){
				if($select !='' && $slug == $select){

					 echo "<option value='$slug' selected='selected'> $str $name</option>";
				}
				else{
	                echo "<option value='$slug'> $str $name</option>";
				}
				choose_menu_link($data,$type, $item->id,$str.'--', $select );
			}
		  }
		
	}
}
function check_status_order($status){
	switch ($status) {
		case '1':
			echo 'đang đợi';
			break;
		case '2':
			echo 'bị hủy';
			break;
		case '3':
			echo 'đang xử lý';
			break;
		case '4':
			echo 'đang giao hàng';
			break;	
		case '5':
			echo 'đã thanh toán';
			break;
		case '6':
			echo 'đã nhận hàng';
			break;
		default:
			echo 'bị xóa';
			break;
	}
}



function mutiselect ($data, $parent=0, $str='', $selects){
	foreach($data as $k=> $val){
	   $name =$val->name;
	   $id   =$val->id;
	   if($val->parent_id ==$parent){
	  
	   if(in_array($id, $selects)){

	      echo "<option value='$id' selected=''> $str $name</option>";
	    }
	    else{
	      echo "<option value='$id'> $str $name</option>";
          }
	    mutiselect($data,$id,$str.'--',$selects);    	  
	   	
	  }
	  
 }
}

function subMenu($data, $id){
    foreach ($data as $value) {
        if($value['parent_id'] == $id){
        $link = route('view.category.products',['id'=>$value->id,'slug'=>$value->prefix]);
        echo "<li><a href='".$link."''>".$value['name']."</a>";
        subMenu($data, $value['id']);        }
        echo "</li>";
    }
}

function vn_str_filter ($str){
       $unicode = array(
           'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
           'd'=>'đ',
           'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
           'i'=>'í|ì|ỉ|ĩ|ị',
           'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
           'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
           'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
           'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
           'D'=>'Đ',
           'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
           'I'=>'Í|Ì|Ỉ|Ĩ|Ị',
           'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
           'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
           'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
       );
      foreach($unicode as $nonUnicode=>$uni){
           $str = preg_replace("/($uni)/i", $nonUnicode, $str);
      }
       return $str;
   }
?>