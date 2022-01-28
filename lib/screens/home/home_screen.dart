import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_gainz/blocs/swipe/swipe_bloc.dart';
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
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                Expanded(
                  child: InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/users',
                          arguments: state.users[0]);
                    },
                    child: Draggable(
                      child: UserCard(user: state.users[0]),
                      feedback: UserCard(user: state.users[0]),
                      childWhenDragging: UserCard(user: state.users[1]),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.users[0]));
                          print('Swiped Left');
                        } else {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(user: state.users[0]));
                          print('Swiped Right');
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 60, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeLeftEvent(user: state.users[0]));
                          print('Swiped Left');
                        },
                        child: ChoiceButton(
                            color: Colors.red, icon: Icons.clear_rounded),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>()
                            ..add(SwipeRightEvent(user: state.users[0]));
                          print('Swiped Right');
                        },
                        child: ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 35,
                            hasGradient: true,
                            color: Colors.white,
                            icon: Icons.favorite),
                      ),
                      ChoiceButton(color: Colors.grey, icon: Icons.watch_later),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text('Error. Something went wrong :(');
          }
        },
      ),
    );
  }
}
