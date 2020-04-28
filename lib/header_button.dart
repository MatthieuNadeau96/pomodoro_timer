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
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        curve: Curves.easeInOut,
        height: 40,
        width: 40,
        child: icon,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: toggleHandler == true
              ? [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 1.0,
                    spreadRadius: 0,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Color(0xffDAE1EB),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Color(0xffffffff),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
        ),
      ),
    );
  }
}
