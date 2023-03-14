import 'package:flutter/material.dart';
import 'package:peliculas_23/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cine'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)
          )
        ],
      ),
      body: Column(
        children: [
          CardSwiper()
        ],
      )
    );
  }
}
