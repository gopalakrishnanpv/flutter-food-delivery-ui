import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  final String text;
  final double padding;
  final double borderRadius;

  const RoundedTextButton({
    Key? key,
    required this.text,
    this.padding = 8.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
      ),
    );
  }
}
