import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            top: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            left: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            right: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: IconButton(
            iconSize: 56,
            onPressed: () {},
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
