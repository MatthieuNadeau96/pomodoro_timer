import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  bool completed;

  Counters({this.completed});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      height: 10,
      width: 10,
      decoration: completed
          // COMPLETED
          ? BoxDecoration(
              color: Color(0xffDAE1EB),
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
                  Color(0xff1F44BE), // 700
                  Color(0xff2450CC), // 600
                  Color(0xff295BDB), // 500
                  Color(0xff3372F7), // 200
                ],
                stops: [0, 0.1, 0.3, 1],
              ),
            )
          // NOT COMPLETED
          : BoxDecoration(
              color: themeData.canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffA5A8AB),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Color(0xffffffff),
                  offset: Offset(-2.0, -2.0),
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
                stops: [0.1, 0.3, 0.8, 1],
              ),
            ),
    );
  }
}
