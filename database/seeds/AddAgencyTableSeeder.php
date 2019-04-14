<?php

use Illuminate\Database\Seeder;
use App\Permission;

class AddAgencyTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $themdt = Permission::create([
              'name' => 'Thêm đặc tính',
              'key'  => str_slug('Thêm đặc tính', '_')
         ]);
        $suadt = Permission::create([
              'name' => 'Sửa đặc tính',
              'key'  => str_slug('Sửa đặc tính', '_')
        ]);
        $xoadt = Permission::create([
              'name' => 'Xóa đặc tính',
              'key'  => str_slug('Xóa đặc tính', '_')
        ]);
        $themdl = Permission::create([
              'name' => 'Thêm đại lý',
              'key'  => str_slug('Thêm đại lý', '_')
         ]);
        $suadl = Permission::create([
              'name' => 'Sửa đại lý',
              'key'  => str_slug('Sửa đại lý', '_')
        ]);
        $xoadl = Permission::create([
              'name' => 'Xóa đại lý',
              'key'  => str_slug('Xóa đại lý', '_')
        ]);
        $themspdl = Permission::create([
              'name' => 'Thêm sản phẩm đại lý',
              'key'  => str_slug('Thêm sản phẩm đại lý', '_')
         ]);
        $xoaspdt = Permission::create([
              'name' => 'Xóa sản phẩm đại lý',
              'key'  => str_slug('Xóa sản phẩm đại lý', '_')
        ]);
    }
}
