import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text('Only Gainz',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white)),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(icon: Icon(Icons.message), onPressed: () {}),
        IconButton(icon: Icon(Icons.person), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
