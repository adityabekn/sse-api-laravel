<html>
    <head>
        <title>@yield('title')</title>
    </head>

    <body>
        @include('layouts.header')

        <div style="margin-top: 20px; margin-bottom: 20px">
            @yield('content')
        </div>

        @include("layouts.footer")
    </body>
</html>
