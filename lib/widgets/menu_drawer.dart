import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {

  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFF6921E),
        child: Padding(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Text( // vs. SelectableText
                  'Home',
                  style: TextStyle(color: Color(0xFF00965E), fontSize: 22),
                ),
              ),
              Padding(
                // top and bottom only, right?
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                // padding used for divider
                child: Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text( // vs. SelectableText
                  'Sign Up',
                  style: TextStyle(color: Color(0xFF00965E), fontSize: 22),
                ),
              ),
              Padding(
                // top and bottom only, right?
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                // padding used for divider
                child: Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 2,
                ),
              ),
              // Inkwell for tapping event
              // without Inkwell, hover over effect cannot be used
              InkWell(
                onTap: () {},
                child: Text( // vs. SelectableText
                  'Read',
                  style: TextStyle(color: Color(0xFF00965E), fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.white.withOpacity(0.5),
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text( // vs. SelectableText
                  'Contact Us',
                  style: TextStyle(color: Color(0xFF00965E), fontSize: 22),
                ),
              ),
              Expanded(
                // default is top alignment
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text( // vs. SelectableText
                    'Copyright © 2021 | DBestech',
                    style: TextStyle(
                      color: Color(0xFF115740),
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
