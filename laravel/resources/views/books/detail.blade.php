@extends('layouts.app')

@section('title')
    Book Detail
@endsection

@section('content')
    <div style="margin-top: 20px; margin-bottom: 20px">
        <a href="/books"> Book list </a>

        <p> Here is the book detail </p>
        <p> Title <b> {{ $book->title }} </b></p>
        <p> Publication <b> {{ $book->publication }} </b></p>
        <p> Author <b> {{ $book->author }} </b></p>
        <p> Year <b> {{ $book->year }} </b></p>
    </div>
@endsection
