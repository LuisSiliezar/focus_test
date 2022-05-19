import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/models/movie_model.dart';
import 'package:test_app/services/movie_api.dart';
import 'package:test_app/views/movie_widget.dart';
import 'package:test_app/views/search_result.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchbox = TextEditingController();
  // final _pageController = PageController();
  // late Future<List<Movie>> futureMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white70,
          title: TextFormField(
            controller: searchbox,
            onFieldSubmitted: (value) {
              // print(value);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchResult(searchQuery: searchbox.text),
                  ));
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Type here to search",
            ),
          ),
          actions: [
            IconButton(
              color: Colors.blue,
              icon: const Icon(Icons.search),
              onPressed: () {
                // print(searchbox.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchResult(searchQuery: searchbox.text),
                    ));
              },
            ),
          ],
        ),
        body: Center(
          child: IconButton(
              icon: const Icon(Icons.add),
              splashColor: Colors.red,
              onPressed: () {}),
        ));
  }
}
