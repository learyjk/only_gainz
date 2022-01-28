import 'package:flutter/material.dart';
import 'package:only_gainz/models/models.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => UsersScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: NetworkImage(User.users[0].imageUrls[0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
