import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final cardChild;

  ReusableCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
//        color: Color(0xFF212234),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
//            color: Color(0xFF212234),
          color: colour,
          borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}
