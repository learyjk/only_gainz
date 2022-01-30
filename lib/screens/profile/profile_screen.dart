import 'package:flutter/material.dart';
import 'package:only_gainz/models/models.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:only_gainz/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];

    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(user.imageUrls[0]),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
                TitleWithIcon(
                  title: 'Biography',
                  icon: Icons.edit,
                ),
                Text(
                  user.bio,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(height: 1.5),
                ),
                TitleWithIcon(
                  title: 'Pictures',
                  icon: Icons.edit,
                ),
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 125,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                user.imageUrls[index],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                TitleWithIcon(
                  title: 'Location',
                  icon: Icons.edit,
                ),
                Text('Washington, DC'),
                TitleWithIcon(
                  title: 'Interests',
                  icon: Icons.edit,
                ),
                Row(
                  children: [
                    CustomTextContainer(text: 'Gym'),
                    CustomTextContainer(text: 'Tan'),
                    CustomTextContainer(text: 'Laundry'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const TitleWithIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          IconButton(onPressed: () {}, icon: Icon(icon))
        ],
      ),
    );
  }
}
