import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final String searchQuery;

  SearchResult({required this.searchQuery});

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
          searchQuery,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
