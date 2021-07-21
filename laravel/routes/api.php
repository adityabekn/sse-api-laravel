<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

//Route::get('/', [\App\Http\Controllers\Api\BookController::class, 'index']);
//
//Route::get('/{book}', [\App\Http\Controllers\Api\BookController::class, 'show']);

//Route::post('/books', [\App\Http\Controllers\BookController::class, 'store']);

Route::resource('/books', \App\Http\Controllers\Api\BookController::class)->except('create', 'edit');
