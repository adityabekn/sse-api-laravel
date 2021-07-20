@extends('layouts.app')

@section('title')
    Edit Book
@endsection

@section('content')
    <div style="margin-top: 20px; margin-bottom: 20px">
        <a href="/books"> Book list </a>

        <h3> Please change the data you want yo update </h3>
        <div>
            <form method="post" action="{{ url("/books", $book->id) }}">
                {{ method_field('PUT') }}
                {{ csrf_field() }}
                <div>
                    <label>
                        Title
                        <input name="title" value="{{ $book->title }}"/>
                    </label>
                </div>

                <div>
                    <label>
                        Publication
                        <input name="publication" value="{{ $book->publication }}"/>
                    </label>
                </div>

                <div>
                    <label>
                        Author
                        <input name="author" value="{{ $book->author }}"/>
                    </label>
                </div>

                <div>
                    <label>
                        Year
                        <input name="year" type="date" value="{{ $book->year }}"/>
                    </label>
                </div>

                <button type="submit"> Update</button>
            </form>
        </div>
    </div>
@endsection
