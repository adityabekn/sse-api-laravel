<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

//use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\StreamedResponse;

class SseController extends Controller
{
//    public function send()
//    {
//        $response = new StreamedResponse(function () {
//            $n = 0;
//            while(true) {
//                echo 'event: message',"\n";
//                echo 'data: Hello ' . $n . "\n\n";
//                $n = $n + 1;
//                ob_flush();
//                flush();
//                usleep(10000000);
//            }
//        });
//
//        $response->headers->set('Content-Type', 'text/event-stream');
//        $response->headers->set('X-Accel-Buffering', 'no');
//        $response->headers->set('Cach-Control', 'no-cache');
//        return $response;
//    }
}
