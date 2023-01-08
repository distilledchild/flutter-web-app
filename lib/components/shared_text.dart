import 'package:flutter/cupertino.dart';

class sharedText extends StatelessWidget {
  const sharedText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontFamily,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily
      ),
    );
  }
}