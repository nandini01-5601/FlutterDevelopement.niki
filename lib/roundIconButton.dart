import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {

  RoundedIconButton({@required this.icon , @required this.onClick});

  final IconData icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xff4c4f5e),
    );
  }
}