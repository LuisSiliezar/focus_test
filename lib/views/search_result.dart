import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert' as convert;

import 'package:test_app/models/movie_model.dart';
import 'package:test_app/views/movie_widget.dart';

class SearchResult extends StatefulWidget {
  final String searchQuery;
  SearchResult({required this.searchQuery});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Results> searchResults = [];
  bool _isLoading = true;
  bool _isEmpty = false;
  //SEARCH MOVIES
  searchMovies() async {
    var query = widget.searchQuery.toString();

    var url = Uri.https('api.themoviedb.org', '/3/search/movie',
        {'api_key': 'cf3294eb2b7b05f700015c864710cecc', 'query': '$query'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      var movie = Movie.fromJson(jsonResponse);
      for (var i in movie.results) {
        // moviesList.add(i);
        setState(() {
          searchResults.add(i);
          _isLoading = false;
        });
      }

      print(response.body);
      if (searchResults.isEmpty) {
        setState(() {
          _isEmpty = true;
          _isLoading = false;
        });
      }
      return searchResults;
    } else {
      // print('Request failed with status: ${response.statusCode}.');
      setState(() {
        _isEmpty = true;
      });
      throw Exception("NO DATA");
    }
  }

  @override
  void initState() {
    searchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.searchQuery,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      body: _isLoading == true
          ? Center(
              child: Container(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/dog_loader.json'),
              ),
            )
          : _isEmpty == true
              ? Center(
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Lottie.asset('assets/empty_state.json'),
                  ),
                )
              : ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return movieWidget(
                        movie: searchResults[index],
                        id: searchResults[index].id,
                        context: context,
                        title: searchResults[index].originalTitle,
                        imageURL:
                            "https://image.tmdb.org/t/p/w500/${searchResults[index].posterPath}",
                        releaseDate: searchResults[index].releaseDate,
                        overview: searchResults[index].overview,
                        vote: searchResults[index].voteAverage.toString());
                  }),
    );
  }
}
