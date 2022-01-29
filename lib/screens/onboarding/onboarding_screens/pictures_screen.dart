import 'package:flutter/material.dart';
import 'package:only_gainz/screens/onboarding/widgets/custom_image_container.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({Key? key, required this.tabController}) : super(key: key);

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
              CustomTextHeader(text: 'Add 2 or more pictures'),
              SizedBox(height: 12),
              Row(
                children: [
                  CustomImageContainer(),
                  CustomImageContainer(),
                  CustomImageContainer(),
                ],
              ),
              Row(
                children: [
                  CustomImageContainer(),
                  CustomImageContainer(),
                  CustomImageContainer(),
                ],
              ),
            ],
          ),
          StepProgressIndicator(
            totalSteps: 6,
            currentStep: 5,
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
