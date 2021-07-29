import 'package:flutter/material.dart';
import 'package:crud_laravel/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      home: HomePage(),
    );
  }
}