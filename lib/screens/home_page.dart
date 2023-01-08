import 'package:flutter_web/widgets/bottom_bar.dart';
import 'package:flutter_web/widgets/carousel.dart';
import 'package:flutter_web/widgets/featured_heading.dart';
import 'package:flutter_web/widgets/featured_tiles.dart';
import 'package:flutter_web/widgets/floating_quick_access_bar.dart';
import 'package:flutter_web/widgets/main_heading.dart';
import 'package:flutter_web/widgets/menu_drawer.dart';
import 'package:flutter_web/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

// layout.dart

// scrollController -> Stateful
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ////////////////////////////////////////////////////////
  // using scrollController for SPA
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
  //////////////////////////////////////////////////////
  // Theses are almost set
  //////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
      debugPrint(_opacity.toString());

      // a scaffold is a visual structure that consists of a top app bar, a bottom navigation bar, and a body.
    return Scaffold(
      extendBodyBehindAppBar: true, // overlap center image and app bar, so extend body image up to screen top
      // property for scaffold: appbar
      // 800 px is for typical mobile device
        appBar: screenSize.width < 800 ?
        AppBar(
          // iconThem is only for hamburger menu
          iconTheme: IconThemeData(color: Color(0xFFF6921E)),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(_opacity),
          centerTitle: true,
          title: Text(
            'Distilled Child',
            style: TextStyle(
              color: Color(0xFF115740),
              fontSize: 26,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
            ),
          ),
        ): PreferredSize(preferredSize: Size(screenSize.width, 150,),
        // TopBarContents size setting using preferredSize
          child: TopBarContents(_opacity),
        ),
      // drawer is for showing menu in mobile device, and it is hidden in desktop
      drawer: MenuDrawer(),

      body: SingleChildScrollView( // making scrollable page
        // SingleChiScrollView has controller
        controller: _scrollController, // This must be added
        child: Column( // right click, then wrap up with SingleChildScrollView
            children: [
              Stack(
                children: [
                  // in stack widget, A container for image, and a column for multiple widgets
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.65,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/images/home_page_upload_scaled.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // inside of stack, they should be overlapping, but not due to padding
                  Column(
                    // inside of column, children are NOT overlapping by stack!. working like independent in column from stack despite stack.
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
