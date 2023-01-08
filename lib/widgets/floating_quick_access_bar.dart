import 'package:flutter_web/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['HiC Analysis', 'Genome Assembly', 'SV Calling', 'Programming'];
  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowElements() {
    // empty list
    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          items[i],
          style: TextStyle(
            color: _isHovering[i] ? Color(0xFFF6921E) : Color(0xFF115740),
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'Poppins'
          ),
        ),
      );
      Widget spacer = SizedBox( // vertical line
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 2,
        ),
      );
      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          // screenSize comes from home_page.dart
          top: widget.screenSize.height * 0.60,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),


        // responsive for mobile device
        child: widget.screenSize.width < 800 ? Column(
          children: [
            for (int i = 0; i < items.length; i++)
              Padding(
                padding: EdgeInsets.only(
                  bottom: widget.screenSize.height/40,
                ),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top:widget.screenSize.height/45,
                      bottom: widget.screenSize.height/45,
                      left: widget.screenSize.width/30,
                    ),
                    child: Row(
                      children: [
                        Icon(icons[i],
                        color: Color(0xFF115740),),
                        SizedBox(width: widget.screenSize.width/50,), // responsive sizedbox
                        InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onHover: (value) {
                            setState(() {
                              value ? _isHovering[i] = true : _isHovering[i] = false;
                            });
                            },
                          onTap: () {},
                          child: Text(
                            items[i],
                            // style: TextStyle(
                            //   color: _isHovering[i]? Colors.blueGrey[90]: Colors.blueGrey,
                            //   fontFamily: 'Poppins',
                            //   fontSize: _isHovering[i]? 12: 14,
                            // )
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              color: _isHovering[i]? Color(0xFFF6921E): Color(0xFF115740),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ): Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top:this.widget.screenSize.height/50,
              bottom: this.widget.screenSize.height/50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // Row takes children
              children: generateRowElements(),
            )
          ),
        ),
      ),
    );
  }
}
