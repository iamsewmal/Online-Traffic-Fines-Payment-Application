import 'package:flutter/material.dart';


class ReusableButton extends StatelessWidget {
  ReusableButton({@required this.colour, this.buttonChild});

  final Color colour;
  final Widget buttonChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buttonChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      // height: 150.0,
      //width: 150.0,
    );
  }
}