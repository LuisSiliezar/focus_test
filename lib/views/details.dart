import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:test_app/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailsScreen extends StatefulWidget {
  final Results movie;
  DetailsScreen({required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Results> relatedMovies = [];
  bool _isLoading = true;
  bool _isEmpty = false;

  getRelatedMovies() async {
    var url = Uri.https(
        'api.themoviedb.org',
        '/3/movie/${widget.movie.id}/similar',
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
          relatedMovies.add(i);
          _isLoading = false;
        });
      }
      if (relatedMovies.isEmpty) {
        setState(() {
          _isEmpty = true;
          _isLoading = false;
        });
      }

      return relatedMovies;
    } else {
      // print('Request failed with status: ${response.statusCode}.');
      throw Exception("NO DATA");
    }
  }

  @override
  void initState() {
    getRelatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  IMAGE
                  Image.network(
                    "https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}",
                    errorBuilder: ((context, error, stackTrace) =>
                        Image.network(
                          "https://www.fabricocina.com/wp-content/uploads/2018/06/image_large.png",
                          height: 500,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          alignment: Alignment.center,
                        )),
                    height: 500,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  //  MOVIE DETAILS
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            widget.movie.originalTitle,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          widget.movie.releaseDate,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            widget.movie.overview,
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ),
                        Text(
                          "Average vote: ${widget.movie.voteAverage.toString()}",
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        //  RELATED MOVIES
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Related Movies",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //RELATED MOVIES
              _isLoading == true
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset('assets/dog_loader.json'),
                        ),
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
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  height: 125,
                                  width: 800,
                                  child: ListView.builder(
                                    itemCount: relatedMovies.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsScreen(
                                                        movie: relatedMovies[
                                                            index]),
                                              ));
                                        },
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          width: 400,
                                          child: Card(
                                            elevation: 2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      "https://image.tmdb.org/t/p/w500/${relatedMovies[index].posterPath}",
                                                      errorBuilder: ((context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.network(
                                                            "http://atrilco.com/wp-content/uploads/2017/11/ef3-placeholder-image.jpg",
                                                            height: 100,
                                                            width: 100,
                                                            fit: BoxFit.contain,
                                                            alignment: Alignment
                                                                .center,
                                                          )),
                                                      height: 100,
                                                      width: 100,
                                                      fit: BoxFit.contain,
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 250,
                                                      child: Text(
                                                        relatedMovies[index]
                                                            .originalTitle,
                                                        style: const TextStyle(
                                                            color: Colors.blue,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Text(
                                                      relatedMovies[index]
                                                          .releaseDate,
                                                      style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
