import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final dynamic fontweight;

  const AppText(
      {Key? key,
        this.size = 30,
        required this.text,
        this.color = Colors.black,
        this.fontweight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontweight,
      ),
    );
  }
}