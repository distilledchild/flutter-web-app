import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  InfoText({required this.type, required this.text, required TextStyle style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text( // vs. SelectableText
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
