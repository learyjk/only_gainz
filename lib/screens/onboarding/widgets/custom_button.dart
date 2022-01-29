import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomButton(
      {Key? key, required this.tabController, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ])),
        child: ElevatedButton(
          onPressed: () {
            tabController.animateTo(tabController.index + 1);
          },
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0, primary: Colors.transparent),
        ));
  }
}
