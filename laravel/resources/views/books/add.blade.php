@extends('layouts.app')

@section('title')
    Add Book
@endsection

@section('content')
    <div style="margin-top: 20px; margin-bottom: 20px">
        <h3> Please fill the book detail </h3>
        <div>
            <form method="post" action="{{ url("/books") }}">
                {{ csrf_field() }}
                <div>
                    <label>
                        Title
                        <input name="title"/>
                    </label>
                </div>

                <div>
                    <label>
                        Publication
                        <input name="publication"/>
                    </label>
                </div>

                <div>
                    <label>
                        Author
                        <input name="author"/>
                    </label>
                </div>

                <div>
                    <label>
                        Year
                        <input name="year" type="date"/>
                    </label>
                </div>

                <button type="submit"> Add</button>
            </form>
        </div>
    </div>
@endsection
