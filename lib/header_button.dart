import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final icon;
  Function onPress;
  final toggleHandler;

  HeaderButton({
    this.icon,
    this.onPress,
    this.toggleHandler,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        curve: Curves.easeInOut,
        height: 40,
        width: 40,
        child: icon,
        decoration: toggleHandler == false
            ? BoxDecoration(
                color: themeData.canvasColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffA5A8AB),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Color(0xffffffff),
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffEEF2F4),
                      themeData.canvasColor,
                      Color(0xffD4D8DB),
                      Color(0xffBDC0C3),
                    ],
                    stops: [
                      0.1,
                      0.3,
                      0.8,
                      1
                    ]),
              )
            : BoxDecoration(
                color: themeData.canvasColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffffffff),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Color(0xffA5A8AB),
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff8E9093),
                    Color(0xffA5A8AB),
                    Color(0xffBDC0C3),
                    Color(0xffEEF2F4),
                  ],
                  stops: [0, 0.1, 0.3, 1],
                ),
              ),
      ),
    );
  }
}
