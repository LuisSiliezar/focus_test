import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/models/movie_model.dart';
import 'package:test_app/views/details.dart';

Widget movieWidget({
  required BuildContext context,
  required String title,
  required String imageURL,
  required String releaseDate,
  required String overview,
  required String vote,
  required int id,
  required Results movie,
}) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  movie: movie,
                ),
              ));
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.network(
                    imageURL,
                    height: 500,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue),
                        ),
                        Text(
                          releaseDate,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                          child: Text(
                            overview,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1,
                                fontSize: 15,
                                color: Colors.black87),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.deepOrange,
                                ),
                                Text(
                                  vote,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 15,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(movie: movie),
                                    ));
                              },
                              child: Text(
                                "Details",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ));
}
