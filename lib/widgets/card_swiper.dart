// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movies/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    Key? key, 
    required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if ( movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.red[200],
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.65,
        itemHeight: size.height * 0.45,
        itemBuilder: (BuildContext context,int index) {

          final movie = movies[index];

          // FadeInImage: para hacer una animación
          return GestureDetector(
            onTap: () => Navigator.pushNamed( context, 'details', arguments: movie ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading_icon.gif'), 
                image: NetworkImage( movie.fullPosterImg ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}