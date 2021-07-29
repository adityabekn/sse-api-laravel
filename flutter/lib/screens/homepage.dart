import 'dart:convert';

import 'package:crud_laravel/screens/book_detail.dart';
import 'package:crud_laravel/screens/add_book.dart';
import 'package:crud_laravel/screens/edit_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'http://10.0.2.2/laravel/public/api/books';
  // final String url = 'http://192.168.1.3/laravel/public/api/books';

  Future getBooks() async {
    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteBooks(String bookId) async {
    var response = await http.delete(
        Uri.parse(url + '/' + bookId));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddBook(url: url,)));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Book Library'),
        ),
        body: FutureBuilder(
          future: getBooks(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    // return Text(snapshot.data['data'][index]['title']);
                    return Container(
                      height: 70,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetail(
                                      book: snapshot.data['data'][index])));
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(snapshot.data['data'][index]['title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(snapshot.data['data'][index]['author'])
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(snapshot.data['data'][index]
                                        ['publication']),
                                    Text(snapshot.data['data'][index]['year'])
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EditBook(
                                                    book: snapshot.data['data']
                                                        [index], url: url,)));
                                      },
                                      child: Icon(Icons.edit),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        deleteBooks(snapshot.data['data'][index]
                                                    ['id']
                                                .toString())
                                            .then((value) {
                                          print(value);
                                          setState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text('Book Deleted')));
                                        });
                                      },
                                      child: Icon(Icons.delete),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
