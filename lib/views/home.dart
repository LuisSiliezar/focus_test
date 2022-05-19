import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/models/movie_model.dart';
import 'package:test_app/views/movie_widget.dart';
import 'package:test_app/views/search_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchbox = TextEditingController();
  List<Results> movies = [];
  List<String> posters = [];
  bool _isLoading = true;
  //GET MOVIES
  getPopularMovies() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular',
        {'api_key': 'cf3294eb2b7b05f700015c864710cecc'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var movie = Movie.fromJson(jsonResponse);
      // List<Results> moviesList = [];
      for (var i in movie.results) {
        // moviesList.add(i);
        setState(() {
          movies.add(i);
          _isLoading = false;
        });
      }
      // print(moviesList);
      return movies;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception("NO DATA");
    }
  }

//  GET MOVIE POSTERS
//   getMoviePosters() async {}
  @override
  void initState() {
    getPopularMovies();
    super.initState();
  }

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
      body: _isLoading == true
          ? Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/dog_loader.json'),
              ),
            )
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return movieWidget(
                    movie: movies[index],
                    id: movies[index].id,
                    context: context,
                    title: movies[index].originalTitle,
                    imageURL:
                        "https://images.pexels.com/photos/9887601/pexels-photo-9887601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    releaseDate: movies[index].releaseDate,
                    overview: movies[index].overview,
                    vote: movies[index].voteAverage.toString());
              }),
    );
  }
}
