import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    // make distance below, see in home.dart
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      // responsive for mobile
      child: screenSize.width < 800 ?
        // row is used for pushing text left
      Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured',
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color:Color(0xFF115740)
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'Clue of the wooden cottage',
                style: TextStyle(
                  color: Color(0xFFF6921E)
                ),
              ),
            ]


          ),
        ],
      ):  Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                'Featured',
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color:Color(0xFF115740)
                    ),
                ),
                Expanded(
                  child: Text(
                    'Top priorities',
                    style: TextStyle(
                      color: Color(0xFF115740),
                      fontFamily: 'Poppins',
                      fontSize: 12
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
    );
  }
}
