import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffDAE1EB),
            offset: Offset(2.0, 2.0),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Color(0xffffffff),
            offset: Offset(-2.0, -2.0),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
    );
  }
}
