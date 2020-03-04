import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 14.0, //18
  color: Colors.white,
);

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 30.0, //50
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0, //15
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
