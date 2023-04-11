import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar películas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // implement buildSuggestions

    if (query.isEmpty) {
      return const Center(
        child: Icon(
          Icons.movie_creation_outlined, 
          color: Colors.black38,
          size: 130),
      );
    }

    return Container();
  }
}
