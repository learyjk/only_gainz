import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key, required this.text, this.controller, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          contentPadding: EdgeInsets.only(bottom: 5, top: 12.5)),
      onChanged: onChanged,
    );
  }
}
