import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_gainz/cubit/signup/signup_cubit.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Email extends StatelessWidget {
  final TabController tabController;

  const Email({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextHeader(text: 'What\'s your email address?'),
                  CustomTextField(
                    text: 'arslan@thegainz.net',
                    onChanged: (value) {
                      context.read<SignupCubit>().emailChanged(value);
                      print(state.email);
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomTextHeader(text: 'Choose a password'),
                  CustomTextField(
                    text: 'patrick',
                    onChanged: (value) {
                      context.read<SignupCubit>().passwordChanged(value);
                      print(state.password);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 2,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: 'Next Step',
                    tabController: tabController,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
