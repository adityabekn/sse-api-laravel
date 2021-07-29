// import 'package:sse_client/sse_client.dart';

import 'package:crud_laravel/screens/piechart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDetail extends StatefulWidget {
  // const BookDetail({Key? key}) : super(key: key);

  final Map book;

  BookDetail({required this.book});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  String data = '';

  // @override
  // void initState() {
  //   print('Init State');
  //   super.initState();
  //   sse();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  //SSE Function
  // sse() {
  //   var sseClient =
  //       SseClient.connect(Uri.parse('http://10.0.2.2/laravel/public/api/sse'));
  //   var stream = sseClient.stream;
  //   if (stream == null) {
  //     print('Stream not connected');
  //     return;
  //   }
  //   stream.listen((event) {
  //     setState(() {
  //       data = event;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              widget.book['title'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.book['author']),
            SizedBox(
              height: 10,
            ),
            Text(widget.book['publication']),
            SizedBox(
              height: 10,
            ),
            Text(widget.book['year']),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PieChartSample2()));
              },
              child: Text('Chart'),
            )
          ],
        ),
      ),
    );
  }
}
