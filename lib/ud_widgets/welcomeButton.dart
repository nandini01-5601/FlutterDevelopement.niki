import 'package:flutter/material.dart';
import 'package:pblcanteen/constants.dart';

class WelcomeButton extends StatelessWidget {

  WelcomeButton({@required this.text , @required this.onPressed , @required this.buttonColor , @required this.width , @required this.height});

  final String text;
  final Function onPressed;
  final Color buttonColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: buttonColor,
        ),
        child: Text(
          '$text',
          style: kWelcomeButtonTextStyle,
        ),
      ),
    );
  }
}