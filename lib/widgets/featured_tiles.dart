import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/test1.jpeg',
    'assets/images/test2.jpeg',
    'assets/images/test3.jpeg',
  ];

  final List<String> title = ['Sci-fi', 'Photography', 'Romance'];

  @override
  // whenever change screen, build() is fired
  Widget build(BuildContext context) {
    return screenSize.width < 800?
    Padding(
      padding: EdgeInsets.only(
        top: screenSize.height/50,
        left: screenSize.width/15 //Both are fine either here or line33
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // SizedBox(width: screenSize.width/15,), // only once
            ...Iterable<int>.generate(assets.length).map(
              (int pageIndex) => Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width/2.5,
                        width: screenSize.width/1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            assets[pageIndex],
                            fit: BoxFit.cover, //making image as big as it is
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                        top: screenSize.height/70
                        ),
                        child: Text(
                          title[pageIndex],
                          style: TextStyle(
                            color: Color(0xFF115740),
                            fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: screenSize.width/15,),
                ],
              )
            )
          ],
        ),
      ),
    ):
    Padding(
            padding: EdgeInsets.only(
              // whenever change screen, build() is fired
              // responsive padding setting
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // dynamic widget generate: Iterable.generate
                // ... means all elements of list for Iterable
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [

                      SizedBox(
                        // dynamic
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.8,

                        child: Container(
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  // image list on top
                                  assets[pageIndex],
                             // fit: BoxFit.cover,
                                   ),
                                ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                  color:Colors.grey.withOpacity(0.3),
                                )
                              ]
                          ),
                        ),
                      ),


                    //   screenSize.width < 800? Padding(
                    //     padding: EdgeInsets.only(
                    //       top: screenSize.height/50
                    //     ),
                    //     child: SingleChildScrollView(
                    //       scrollDirection: Axis.horizontal,
                    //       child: Row(
                    //         children: [
                    //           SizedBox(width: screenSize.width/25,), //left padding is needed only ONCE
                    //           ...Iterable<int>.generate(assets.length).map(
                    //             (int pageIndex) => Row(
                    //               children: [
                    //                 Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     SizedBox(
                    //                       height: screenSize.width/2.5,
                    //                       width: screenSize.width/1.5,
                    //                       child: ClipRRect(
                    //                         borderRadius: BorderRadius.circular(5.0),
                    //                         child: Image.asset(
                    //                           assets[pageIndex],
                    //                           fit: BoxFit.cover,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     Padding(
                    //                       padding: EdgeInsets.only(
                    //                         top:screenSize.height/70,
                    //                       ),
                    //                       child: Text(
                    //                         title[pageIndex],
                    //                         style: TextStyle(
                    //                           fontSize: 16,
                    //                           fontFamily: "Montserrat",
                    //                           fontWeight: FontWeight.w500
                    //                         ),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 ),
                    //                 SizedBox(width: screenSize.width/15,),
                    //               ],
                    //
                    //             )
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ):
                    //   // padding between image and text
                    //   Padding(
                    //     padding: EdgeInsets.only(
                    //       top: screenSize.height / 70,
                    //     ),
                    //     child: Text(
                    //       title[pageIndex],
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontFamily: 'Montserrat',
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
