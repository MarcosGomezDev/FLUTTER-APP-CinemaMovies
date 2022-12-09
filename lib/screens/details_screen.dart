// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar luego por una instancias de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              
              _Overview(),
              _Overview(),
              _Overview(),

              CastingCards(),

            ]), 
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amberAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize: 16 ),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('http://via.placeholder.com/100x150.jpg'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('http://via.placeholder.com/200x300.jpg'),
              height: 150,
            ),
          ),

          const SizedBox( width: 20, ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
               'movie.ttile', 
               style:textTheme.headline5,
               overflow: TextOverflow.ellipsis,
               maxLines: 2,
             ),
             Text(
               'movie.originalTitle', 
               style:textTheme.subtitle1,
               overflow: TextOverflow.ellipsis,
               maxLines: 1,
             ),
             Row(
              children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                const SizedBox(width: 5),
                Text('move.voteAverage', style: textTheme.caption,)
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Aute est aliqua mollit aliquip. Ullamco culpa ex nulla reprehenderit cillum est adipisicing fugiat laborum culpa cillum. Fugiat incididunt excepteur ea aliqua dolore quis nulla enim aliqua ut. Culpa pariatur duis eiusmod excepteur anim amet est laborum reprehenderit esse dolore quis quis.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
        
      ),
    );
  }
}










