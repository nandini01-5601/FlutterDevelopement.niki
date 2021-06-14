import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.buttonText , @required this.onTap});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomBarColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBoxContainerHeight,
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}