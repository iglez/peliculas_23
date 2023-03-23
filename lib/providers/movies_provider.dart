import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_23/models/movie.dart';
import 'package:peliculas_23/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '99568c3e97fec3b5e291a3ab8ab92f64';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('movie provider inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    // var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    // print(response.statusCode);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
