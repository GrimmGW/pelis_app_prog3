import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String? get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: Icon(Icons.clear_rounded)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context), 
      icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_creation_outlined, color: Colors.white54, size: 130),
          Text('Busca una peli', style: TextStyle(fontSize: 16, fontFamily: 'Outfit', color: Colors.white54),)
        ],
      ),
    );
  }

}