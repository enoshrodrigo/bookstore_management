import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: const Center(
        child: Text('Search results will be displayed here.'),
      ),
    );
  }
}
