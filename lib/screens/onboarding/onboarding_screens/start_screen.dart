import 'package:flutter/material.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/girlvsboy.jpg'),
              Text(
                'Welcome to Only Pain',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'The dating app for The Gainz meme lovers.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 1,
                selectedColor: Theme.of(context).primaryColor,
                unselectedColor: Theme.of(context).backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Start',
                tabController: tabController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
