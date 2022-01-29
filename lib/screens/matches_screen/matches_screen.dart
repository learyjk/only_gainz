import 'package:flutter/material.dart';
import 'package:only_gainz/models/models.dart';
import 'package:only_gainz/widgets/widgets.dart';

class MatchesScreen extends StatelessWidget {
  static const String routeName = '/matches';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MatchesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: 'Matches'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Your Likes',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: inactiveMatches.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserImageSmall(
                              imageUrl: inactiveMatches[index]
                                  .matchedUser
                                  .imageUrls[0]),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            inactiveMatches[index].matchedUser.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Chats',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: activeMatches.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        UserImageSmall(
                            imageUrl:
                                activeMatches[index].matchedUser.imageUrls[0]),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activeMatches[index].matchedUser.name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(activeMatches[index]
                                  .chat![0]
                                  .messages[0]
                                  .message),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
