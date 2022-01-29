import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({Key? key, required this.title, this.hasActions = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.black)),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: hasActions
          ? [
              IconButton(icon: Icon(Icons.message), onPressed: () {}),
              IconButton(icon: Icon(Icons.person), onPressed: () {}),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
