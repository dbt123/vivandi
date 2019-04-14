<?php

use Illuminate\Database\Seeder;
use App\Permission;

class AddContructTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $ganspct = Permission::create([
              'name' => 'Gán sản phẩm công trình',
              'key'  => str_slug('Gán sản phẩm công trình', '_')
         ]);
        $xoaspct = Permission::create([
              'name' => 'Xóa sản phẩm công trình',
              'key'  => str_slug('Xóa sản phẩm công trình', '_')
        ]);
        $suact = Permission::create([
              'name' => 'Sửa công trình',
              'key'  => str_slug('Sửa công trình', '_')
        ]);
        $xoact = Permission::create([
              'name' => 'Xóa công trình',
              'key'  => str_slug('Xóa công trình', '_')
         ]);
        $listct = Permission::create([
              'name' => 'Danh sách công trình',
              'key'  => str_slug('Danh sách công trình', '_')
        ]);
        $listdl = Permission::create([
              'name' => 'Danh sách đại lý',
              'key'  => str_slug('Danh sách đại lý', '_')
        ]);
        $listfeedback = Permission::create([
              'name' => 'Danh sách khiếu nại',
              'key'  => str_slug('Danh sách khiếu nại', '_')
         ]);
        $listtk = Permission::create([
              'name' => 'Danh sách thống kê',
              'key'  => str_slug('Danh sách thống kê', '_')
         ]);
        $duyetkn = Permission::create([
              'name' => 'Duyệt khiếu nại',
              'key'  => str_slug('Duyệt khiếu nại', '_')
        ]);
        $xoakn = Permission::create([
              'name' => 'Xóa khiếu nại',
              'key'  => str_slug('Xóa khiếu nại', '_')
        ]);
    }
}
