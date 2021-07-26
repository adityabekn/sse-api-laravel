<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookController;

Route::get('/books', [BookController::class, 'index']);

Route::get('/books/add', [BookController::class, 'create']);

Route::post('/books', [BookController::class, 'store']);

Route::get('/books/{id}', [BookController::class, 'show']);

Route::get('/books/edit/{id}', [BookController::class, 'edit']);

Route::put('/books/{id}', [BookController::class, 'update']);

Route::delete('/books/{id}', [BookController::class, 'destroy']);
