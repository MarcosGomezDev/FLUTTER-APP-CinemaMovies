// ignore_for_file: use_key_in_widget_constructorsmovie

import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: 
        [
          _CustomAppBar(movie:movie,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
              _PosterAndTitle(movie:movie,),
              _Overview(movie:movie,),
              CastingCards(movie.id),
              ]
            ), 
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({ required this.movie });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: const TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage( movie.fullBackdropPath ),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row( 
        
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),

          const SizedBox( width: 20, ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(
              width: size.width * 0.5,
              // height: size.height,
               child: Text(
                 movie.title, 
                 style:textTheme.headline5,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 4,
               ),
             ),
             SizedBox(
              width: size.width * 0.5,
               child: Text(
                 movie.originalTitle, 
                 style:textTheme.subtitle1,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,
               ),
             ),
             Row(
              children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                const SizedBox(width: 5),
                Text('${movie.voteAverage}', style: textTheme.caption,)
              ],
             )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({ required this.movie });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}










