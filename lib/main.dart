import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_gainz/blocs/swipe/swipe_bloc.dart';
import 'package:only_gainz/config/app_router.dart';
import 'package:only_gainz/config/theme.dart';
import 'package:only_gainz/models/models.dart';
import 'screens/screens.dart';
import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SwipeBloc()..add(LoadUsersEvent(users: User.users)))
      ],
      child: MaterialApp(
        title: 'Only Gainz',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MatchesScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
