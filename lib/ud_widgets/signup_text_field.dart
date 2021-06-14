import 'package:flutter/material.dart';

class SignUpInputField extends StatelessWidget {

  SignUpInputField(
      {@required this.text , this.obscureText , this.validator , this.onSaved , this.controller});

  final String text;
  final bool obscureText;
  final Function validator;
  final Function onSaved;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: '$text',
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),

        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}