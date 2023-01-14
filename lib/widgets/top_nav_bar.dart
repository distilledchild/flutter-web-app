import 'package:flutter/material.dart';
import 'package:flutter_web/helpers/responsiveness.dart';
import '../constants/style.dart';
import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
  AppBar( // top navigation bar
    leading: !ResponsiveWidget.isSmallScreen(context)?
    Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 14),
          child: Image.asset("assets/icons/supp.png", width: 28,),
        )],
    ):
    IconButton(
      icon: Icon(Icons.menu),
      onPressed: (){
        key.currentState?.openDrawer(); // changed
      },
    ),

    elevation: 2,

    title: Row(
      children: [
        Visibility(child: CustomText(
          text: "Distilled Child",
          color: themecol_lgreen3,
          size: 20,
          weight: FontWeight.bold,)
        ),
        Expanded(child: Container()),
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings, color: themecol_lred.withOpacity(0.7),),
        ),
        Stack(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.notifications, color: themecol_lred.withOpacity(.7),),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: themecol_lgreen3, // active
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: themecol_lyellow, width: 2),
                  ),
                ),
              )
            ]
        ),

        Container(
          width: 1,
          height: 2,
        ),
        
        SizedBox(
          width: 24,
        ),

        CustomText(
            text: "Distilled Child",
            size: 12,
            color: themecol_lgreen3,
            weight: FontWeight.bold,
        ),

        SizedBox(
          width: 16,
        ),

        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.person_outline,
                color: Colors.blueGrey,
              ),
            ),
          ),

        ),
      ],
    ),
    iconTheme: IconThemeData(color: Colors.black26),
    backgroundColor: Colors.black,
  );