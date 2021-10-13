import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text, @required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Center(
          child: Text(
            '$text',
            style: ktextStyleButton,
          ),
        ),
        color: kbuttonContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomContainerHeight,
      ),
    );
  }
}
