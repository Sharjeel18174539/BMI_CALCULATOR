import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  ReusableCard({  required this.colour,required this.childCard});

  final Color colour;
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: childCard,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

//Extract the widget -> it means that same widget is repeating more and more then we extract the widget and make it
// class and use again and again as we have seen in this app.

