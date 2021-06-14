import 'package:flutter/material.dart';
import 'package:pblcanteen/constants.dart';

class InputField extends StatelessWidget {
  InputField(
      {@required this.text, this.icon, this.iconColor , this.obscureText , this.controller , this.validator});

  final String text;
  final IconData icon;
  final Color iconColor;
  final bool obscureText;
  final Function validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: '$text',
        prefixIcon: Icon(
          icon,
          color: iconColor,
        ),
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}