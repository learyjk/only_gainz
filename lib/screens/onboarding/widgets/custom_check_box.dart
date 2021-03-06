import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final String text;

  const CustomCheckBox({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(value: false, onChanged: (bool? newValue) {}),
      Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(fontWeight: FontWeight.normal),
      )
    ]);
  }
}
