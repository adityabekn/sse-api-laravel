<?php

use Illuminate\Support\Facades\Route;

Route::get('/books', [\App\Http\Controllers\BookController::class, 'index']);

Route::get('/books/add', [\App\Http\Controllers\BookController::class, 'create']);

Route::post('/books', [\App\Http\Controllers\BookController::class, 'store']);

Route::get('/books/{id}', [\App\Http\Controllers\BookController::class, 'show']);

Route::get('/books/edit/{id}', [\App\Http\Controllers\BookController::class, 'edit']);

Route::put('/books/{id}', [\App\Http\Controllers\BookController::class, 'update']);

Route::delete('/books/{id}', [\App\Http\Controllers\BookController::class, 'destroy']);
