// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';

class MovieSlider extends StatefulWidget {
  // const MovieSlider({ Key? key }) : super(key: key);

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    Key? key, 
    required this.movies,
    required this.onNextPage,
    this.title, 
    }
  ) : super(key: key); 

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // Se ejecuta una sola vez cuando el widget es creado
    super.initState();

    scrollController.addListener(() {
      if ( scrollController.position.pixels >=  scrollController.position.maxScrollExtent - 500) {
        // Llamar al provider cuando este cerca de (scrollController.position.maxScrollExtent)
        // Por eso le restamos 500
        widget.onNextPage();
      }
    });

  }

  @override
  void dispose() {
    // Se ejecuta cuando el widget va a ser destruido
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
        [
          if ( widget.title != null )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!, 
                style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
            ),

          const SizedBox(height: 7),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context, int index) => _MoviePoster( widget.movies[index] ),
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
              context, 
              'details', 
              arguments: movie
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