// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:movies/providers/movies_provider.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cine'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
          ),
        ],
      ),
      // SingleChildScrollView: nos permite hacer scroll
      body: SingleChildScrollView(
        child: Column(
          children: 
          [
            // Targetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
      
            // Listado de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () {
                moviesProvider.getPopularmovies();
              },
            ),
          ],
        ),
      ),
    );
  }
}