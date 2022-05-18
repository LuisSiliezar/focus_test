import 'package:flutter/material.dart';
import 'package:test_app/views/movie_widget.dart';
import 'package:test_app/views/search_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchbox = TextEditingController();
  bool _isLoading = true;
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
            hintText: "Type something to search",
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
      body: _isLoading == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return movieWidget(
                    id: 90,
                    context: context,
                    title: "Avengers End Game",
                    imageURL:
                        "https://images.pexels.com/photos/9887601/pexels-photo-9887601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    releaseDate: "1900",
                    overview:
                        "Avengers End Game is one of the best movies of the year, It's really one of the greatest superhero movies of all time",
                    vote: 5);
              }),
    );
  }
}
