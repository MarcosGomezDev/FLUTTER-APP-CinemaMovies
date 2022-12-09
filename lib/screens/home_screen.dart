// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cine'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}, 
          ),
        ],
      ),
      // SingleChildScrollView: nos permite hacer scroll
      body: SingleChildScrollView(
        child: Column(
          children: 
          [
            // Targetas principales
            CardSwiper(),
      
            // Listado de peliculas
            MovieSlider(),
      
          ],
        ),
      ),
    );
  }
}