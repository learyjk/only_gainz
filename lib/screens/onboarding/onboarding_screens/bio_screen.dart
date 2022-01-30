import 'package:flutter/material.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Bio extends StatelessWidget {
  final TabController tabController;

  const Bio({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(text: 'Shoot your shot'),
              CustomTextField(
                text: 'Write your best jokes here',
                controller: controller,
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextHeader(text: 'WYD?'),
              Row(
                children: [
                  CustomTextContainer(
                    text: '💪 Gym',
                  ),
                  CustomTextContainer(
                    text: '👙 Tan',
                  ),
                  CustomTextContainer(
                    text: '🧺 Laundry',
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 6,
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
          ),
        ],
      ),
    );
  }
}
