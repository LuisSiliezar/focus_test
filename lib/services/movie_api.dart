import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:test_app/models/movie_model.dart';

class MovieService {
  Future<List<Results>> getPopularMovies() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular',
        {'api_key': 'cf3294eb2b7b05f700015c864710cecc'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var movie = Movie.fromJson(jsonResponse);
      List<Results> moviesList = [];
      for (var i in movie.results) {
        moviesList.add(i);
        // print(i.originalTitle);
        // print(i.voteAverage);
        // print(i.id);
      }
      // print(moviesList);
      return moviesList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception("NO DATA");
    }
  }
}
