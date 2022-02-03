import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_gainz/cubit/signup/signup_cubit.dart';
import 'package:only_gainz/repositories/auth/auth_repository.dart';
import 'package:only_gainz/widgets/custom_appbar.dart';
import 'onboarding_screens/screens.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => BlocProvider(
        create: (_) => SignupCubit(
          authRepository: context.read<AuthRepository>(),
        ),
        child: OnboardingScreen(),
      ),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(
      text: 'Start',
    ),
    Tab(
      text: 'Email',
    ),
    Tab(
      text: 'Email Verification',
    ),
    Tab(
      text: 'Demo',
    ),
    Tab(
      text: 'Pictures',
    ),
    Tab(
      text: 'Bio',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (
          BuildContext context,
        ) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });

          return Scaffold(
            appBar: CustomAppBar(
              title: '🚩',
              hasActions: false,
            ),
            body: TabBarView(
              children: [
                Start(tabController: tabController),
                Email(tabController: tabController),
                EmailVerification(tabController: tabController),
                Demo(tabController: tabController),
                Pictures(tabController: tabController),
                Bio(tabController: tabController),
              ],
            ),
          );
        },
      ),
    );
  }
}
