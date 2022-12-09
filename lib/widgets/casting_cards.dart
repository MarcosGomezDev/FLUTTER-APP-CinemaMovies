// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      // color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => _CastCard(),
      ),

    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: 110,
      height: 100,
      // color: Colors.blue,
      child: Column(
        children: 
        [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('http://via.placeholder.com/80x100.jpg'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'actor.name lastname secodnlasname',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}