import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final double size;

  const CircularIconButton(
      {Key? key,
      required this.icon,
      this.margin = const EdgeInsets.all(0),
      this.size = 48.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor,
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: () {},
        color: Colors.white,
      ),
    );
  }
}
