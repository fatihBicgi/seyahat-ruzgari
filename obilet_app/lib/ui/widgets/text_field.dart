import 'package:flutter/material.dart';

class BasicTextForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;

  BasicTextForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
        label: Text(
          labelText,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
