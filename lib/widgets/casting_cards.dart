// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards( this.movieId );

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMoviesCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {

        if ( !snapshot.hasData ) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 300),
            height: 220,
            child: const CupertinoActivityIndicator(),

          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(top: 10, bottom: 30, left: 10),
          width: double.infinity,
          height: 220,
          // color: Colors.red,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => _CastCard(cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard( this.actor );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 110, // Cambiar por porcentajes para conservar la relacion de aspecto
      height: 100,
      // color: Colors.blue,
      child: Column(
        children: 
        [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading_icon.gif'),
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}