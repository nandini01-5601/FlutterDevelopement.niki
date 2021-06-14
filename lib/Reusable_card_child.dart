import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCardChild extends StatelessWidget {

  ReusableCardChild({@required this.cardChildText , @required this.fontAwesomeIcon});

  final String cardChildText;
  final IconData fontAwesomeIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(
          fontAwesomeIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$cardChildText',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}