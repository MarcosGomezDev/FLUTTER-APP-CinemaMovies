// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.red[200],
      // child: Swiper(
      //   itemCount: 10,
      //   layout: SwiperLayout.STACK,
      //   itemWidth: size.width * 0.6,
      //   itemHeight: size.width * 0.9,
      // ),
    );
  }
}