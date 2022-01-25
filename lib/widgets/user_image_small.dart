import 'package:flutter/material.dart';

class UserimageSmall extends StatelessWidget {
  const UserimageSmall({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
