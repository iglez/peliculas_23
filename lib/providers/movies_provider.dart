import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('movie provider inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() {
    print('getOnDisplayMovies');
  }
}
