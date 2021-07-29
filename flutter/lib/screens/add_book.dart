import 'dart:convert';

import 'package:crud_laravel/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBook extends StatelessWidget {
  // const AddProduct({Key? key}) : super(key: key);

  AddBook({required this.url});

  final String url;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _publicationController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  Future saveBook() async {
    final response = await http
        .post(Uri.parse(url), body: {
      'title': _titleController.text,
      'author': _authorController.text,
      'publication': _publicationController.text,
      'year': _yearController.text
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12),
                      labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _authorController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12),
                      labelText: 'Author'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter author";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _publicationController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12),
                      labelText: 'Publication'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter publication";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _yearController,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12),
                      labelText: 'Year'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter year";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveBook().then((value) {
                        // print(value);
                        if (value['message'] == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Something wrong!')),
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Book Added')));
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                      });
                    }
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
