import 'package:flutter/material.dart';
import 'package:only_gainz/models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Only Gainz"),
      body: Column(
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    color: Colors.red,
                    hasGradient: false,
                    icon: Icons.clear_rounded),
                ChoiceButton(
                    width: 80,
                    height: 80,
                    size: 35,
                    hasGradient: true,
                    color: Colors.white,
                    icon: Icons.favorite),
                ChoiceButton(
                    width: 60,
                    height: 60,
                    size: 25,
                    hasGradient: false,
                    color: Colors.grey,
                    icon: Icons.watch_later),
              ],
            ),
          ),
        ],
      ),
      //bottomNavigationBar: CustomNavBar(),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.size,
      required this.color,
      required this.hasGradient,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ])
            : LinearGradient(colors: [Colors.white, Colors.white]),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withAlpha(50), spreadRadius: 4, blurRadius: 4),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
