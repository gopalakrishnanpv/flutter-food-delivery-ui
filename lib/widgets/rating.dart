import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;
  final double size;

  const Rating({Key? key, required this.rating, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String stars = "";
    for (int i = 0; i < rating; i++) {
      stars += "⭐";
    }
    stars = stars.trim();
    return Text(
      stars,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.amber),
    );
  }
}
