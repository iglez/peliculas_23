import 'package:flutter/material.dart';
import 'package:peliculas_23/providers/movies_provider.dart';
import 'package:peliculas_23/search/search_delegate.dart';
import 'package:peliculas_23/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en cine'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(
                context: context, 
                delegate: MovieSearchDelegate()
              ), 
              icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              // MovieSlider(),
              // MovieSlider(),
              // MovieSlider(),
            ],
          ),
        ));
  }
}
