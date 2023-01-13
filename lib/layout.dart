import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import 'package:flutter_web/widgets/large_screen.dart';
import 'package:flutter_web/widgets/small_screen.dart';
import 'package:flutter_web/widgets/top_nav.dar.dart';

class SiteLayout extends StatelessWidget{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: topNavigationBar(context, scaffoldKey),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      )
    );
  }
}