// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';

class MovieSlider extends StatelessWidget {
  // const MovieSlider({ Key? key }) : super(key: key);

  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    Key? key, 
    required this.movies,
    this.title}
  ) : super(key: key); 

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          if ( title != null )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!, 
                style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
            ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) => _MoviePoster( movies[index] ),
            ),
          ),

          const SizedBox(height: 5),
          
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget{

  final Movie movie;

  const _MoviePoster( this.movie );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [

          GestureDetector(
            onTap: (() => Navigator.pushNamed(
            context, 'details', 
            arguments: 'movie-instance'
            )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading_icon.gif'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox( height: 5 ),

          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}