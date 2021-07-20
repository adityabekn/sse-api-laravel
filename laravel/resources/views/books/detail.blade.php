<html>
    <head>
        <title>Book Detail</title>
    </head>

    <body>
        <div style="background: #388BF2; font-size: 24px; color: white">
            Simple library app
        </div>

        <div style="margin-top: 20px; margin-bottom: 20px">
            <a href="/books"> Book list </a>

            <p> Here is the book detail </p>
            <p> Title <b> {{ $book->title }} </b></p>
            <p> Publication <b> {{ $book->publication }} </b></p>
            <p> Author <b> {{ $book->author }} </b></p>
            <p> Year <b> {{ $book->year }} </b></p>
        </div>

        <div style="background: #31B057; font-size: 20px; color: white">
            Created with love and willingness to learn
        </div>
    </body>
</html>
