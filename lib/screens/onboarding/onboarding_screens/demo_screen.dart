import 'package:flutter/material.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(text: 'What\'s your gender?'),
              CustomCheckBox(
                text: '♔ King',
              ),
              CustomCheckBox(
                text: '♕ Queen',
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextHeader(text: 'How old are you?'),
              CustomTextField(text: '30'),
            ],
          ),
          StepProgressIndicator(
            totalSteps: 6,
            currentStep: 4,
            selectedColor: Theme.of(context).primaryColor,
            unselectedColor: Theme.of(context).backgroundColor,
          ),
          CustomButton(
            text: 'Next Step',
            tabController: tabController,
          ),
        ],
      ),
    );
  }
}
