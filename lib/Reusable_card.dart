import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour , this.cardChild , this.onPress});

  final Color colour;
  final Widget cardChild;
  //to pass a function as a parameter , we use Function key word to declare a function
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
