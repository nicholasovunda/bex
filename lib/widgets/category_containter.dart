import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class CategoryContainer extends StatelessWidget {
  final String text;
  const CategoryContainer({super.key, required this.text});
// For main products

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(
                -3.1415926535897932 / 4,
              ),
              child: const Image(
                height: 200.0,
                width: 200.0,
                image: AssetImage(
                  'assets/images/testimage.jpeg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
