import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/responsiveness.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
  AppBar( // top navigation bar
    leading: !ResponsiveWidget.isSmallScreen(context)?
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 14),
            child: Image.asset("assets/icons/supp.png", width: 28,),
          )
        ],
      ): IconButton(
        icon: Icon(Icons.menu),
        onPressed: (){
          key.currentState?.openDrawer(); // changed
    },),
    elevation: 0,
    backgroundColor: Colors.orange,
  );