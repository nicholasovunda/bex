import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/hero_images.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        children: const [],
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true, enlargeCenterPage: true, height: 200.0),
      items: [
        FittedBox(
          fit: BoxFit.cover,
          child: Image.network(urlImages[0]),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Image.network(urlImages[1]),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Image.network(urlImages[2]),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Image.network(urlImages[3]),
        ),
      ].map((e) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width,
              child: e,
            );
          },
        );
      }).toList(),
    );
  }
}
