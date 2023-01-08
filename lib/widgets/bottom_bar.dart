import 'dart:ui';

import 'package:flutter_web/widgets/bottom_bar_column.dart';
import 'package:flutter_web/widgets/info_text.dart';
import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// no dynamic, so statelessWidget
class BottomBar extends StatelessWidget {

  const BottomBar({
    Key? key,
  }) : super(key: key);

  static const Color gradientStartColor = Color(0xFF00965E);
  // static const Color gradientMiddleColor = Color(0xFF00965E);
  static const Color gradientEndColor = Color(0xFFF6921E);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        gradient: LinearGradient(
              colors: [
                gradientStartColor,
                // gradientMiddleColor,
                gradientEndColor
              ],
              begin: const FractionalOffset(0.1, 0.1),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          // chose decorating botomBar or just use color below
          // color: Colors.orange
      ),
      padding: EdgeInsets.all(30), // due to this padding, divider is NOT completely stretched.
      // padding: EdgeInsets.all(0),
      //color: Colors.blueGrey[900],
      child:
      // how to get screen size
      MediaQuery.of(context).size.width < 800 ?
      Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround, // evenly
            children: [
              BottomBarColumn( // Constructor for BottomBarColumn in BottomBarColumn.dart
                heading: 'ABOUT',
                s1: 'Contact Us',
                s2: 'About Us',
                s3: 'Careers',
              ),
              BottomBarColumn( // Constructor for BottomBarColumn in BottomBarColumn.dart
                heading: 'HELP',
                s1: 'Payment',
                s2: 'Cancellation',
                s3: 'FAQ',
              ),
              BottomBarColumn( // Constructor for BottomBarColumn in BottomBarColumn.dart
                heading: 'SOCIAL',
                s1: 'Twitter',
                s2: 'Facebook',
                s3: 'Instagram',
              ),
            ]
          ),
          SizedBox(height: 5,),
          Divider(
            color: Colors.white60,
          ),
          SizedBox(height: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                type: 'Email',
                text: 'pkim11@uthsc.edu',
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
              ),
              SizedBox(height: 5),

              InfoText( // widget provided by Dart
                type: 'Address',
                text: '910 Madison Ave, Memphis, TN 38163',
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
              ),
            ],
          ),

          SizedBox(height: 5,),
          Divider(
            color: Colors.white60,
          ),
          SizedBox(height: 20,),

          Text(
            'Copyright © 2021 | DBestech',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Poppins'
              // fontWeight: FontWeight.normal
            ),
          ),
        ],
      ):
          // if screenSize is bigger than 800 px
      Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn( // Constructor for BottomBarColumn in BottomBarColumn.dart
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn( // Constructor for BottomBarColumn in BottomBarColumn.dart
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn( // Constructor for BottomBarColumn in BottomBarColumn.dart
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'Instagram',
                    ),

                    // container is used for vertical line
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        InfoText(
                          type: 'Email',
                          text: 'pkim11@uthsc.edu',
                          style: TextStyle(
                            fontFamily: 'Poppins'
                          ),
                        ),

                        SizedBox(height: 5),

                        InfoText( // widget provided by Dart
                          type: 'Address',
                          text: '910 Madison Ave, Memphis, TN 38163',
                          style: TextStyle(
                            fontFamily: 'Poppins'
                          ),
                        )

                      ],
                    ),
                  ],
                ),



                Divider(
                  color: Colors.white,
                ),
                // to give padding to bottom text and divider USING SizedBox
                // padding gives space to ALL edges, but sizedboxe gives padding in column
                SizedBox(height: 30),


                Text(
                  'Copyright © 2021 | DBestech',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    // fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
    );
  }
}
