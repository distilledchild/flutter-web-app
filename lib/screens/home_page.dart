import 'package:flutter_web/widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/carousel.dart';
import 'package:flutter_web/widgets/featured_heading.dart';
import 'package:flutter_web/widgets/featured_tiles.dart';
import 'package:flutter_web/widgets/floating_quick_access_bar.dart';
import 'package:flutter_web/widgets/main_heading.dart';
import 'package:flutter_web/widgets/menu_drawer.dart';
import 'package:flutter_web/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  // save pixel positions into the variable of setState
  // every scroller has listeners
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
      debugPrint(_opacity.toString());
    return Scaffold(
      extendBodyBehindAppBar: true, // overlap center image and app bar, so extend body image up to screen top
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContents(_opacity),
      ),
      body: SingleChildScrollView( // making scrollable page
        // SingleChiScrollView has controller
        controller: _scrollController, // This must be added
        child: Column( // right click, then wrap up with SingleChildScrollView
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.65,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                      FeaturedHeading(screenSize: screenSize),
                      FeaturedTiles(screenSize: screenSize),
                      MainHeading(screenSize: screenSize),
                      MainCarousel(),
                      //in order to get padding b/w mainCarousel and bottomBar, USE SizedBox
                      SizedBox(height: screenSize.height/10),
                      BottomBar(),
                    ],
                  )
                ],
              ),

            ],
          ),
      ),

    );
  }
}
