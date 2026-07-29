<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    try {
        DB::connection()->getPdo();

        $databaseStatus = [
            'connected' => true,
            'message' => 'Database berhasil terhubungg!',
            'database' => DB::connection()->getDatabaseName(),
        ];
    } catch (\Exception $e) {
        $databaseStatus = [
            'connected' => false,
            'message' => 'Database gagal terhubungg!',
            'error' => $e->getMessage(),
        ];
    }

    return view('welcome', compact('databaseStatus'));
});