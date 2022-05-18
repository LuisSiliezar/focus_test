import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchbox = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: searchbox,
          onFieldSubmitted: (value) {
            print(value);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Type something to search",
          ),
        ),
        actions: [
          IconButton(
            color: Colors.blue,
            icon: Icon(Icons.search),
            onPressed: () {
              print(searchbox.text);
            },
          ),
        ],
      ),
    );
  }
}
