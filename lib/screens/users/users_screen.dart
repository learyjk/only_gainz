import 'package:flutter/material.dart';
import 'package:only_gainz/models/models.dart';
import 'package:only_gainz/widgets/widgets.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  final User user;

  const UsersScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Hero(
                    tag: 'user_image',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceButton(
                            color: Theme.of(context).accentColor,
                            icon: Icons.clear_rounded),
                        ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 35,
                            color: Colors.white,
                            hasGradient: true,
                            icon: Icons.favorite),
                        ChoiceButton(
                            color: Theme.of(context).accentColor,
                            icon: Icons.watch_later)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${user.jobTitle}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Bio',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  '${user.bio}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(height: 2),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Interests',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Row(
                  children: user.interests
                      .map(
                        (interest) => Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor
                              ],
                            ),
                          ),
                          child: Text(
                            interest,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
