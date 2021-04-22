import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  MyContainer({@required this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}
