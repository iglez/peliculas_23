import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_23/models/cast.dart';
import 'package:peliculas_23/models/credits_response.dart';
import 'package:peliculas_23/models/movie.dart';
import 'package:peliculas_23/models/now_playing_response.dart';
import 'package:peliculas_23/models/popular_response.dart';
import 'package:peliculas_23/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '99568c3e97fec3b5e291a3ab8ab92f64';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('movie provider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    print(popularMovies[0].title);

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    // Revisar el mapa
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    // obteniendo info del servidor
    print('Obteniendo info del servidor...');
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
      // 'page': '$page',
    });

    final response = await http.get(url);
    final searchReponse = SearchResponse.fromJson(response.body);

    return searchReponse.results;
  }
}
