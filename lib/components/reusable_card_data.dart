import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCardData extends StatelessWidget {
  ReusableCardData(this.iconData, this.textData);
  final iconData;
  final textData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          textData,
          style: ktextStyle,
        )
      ],
    );
  }
}
