import 'package:flutter/material.dart';
import 'package:only_gainz/screens/onboarding/widgets/widgets.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;

  const EmailVerification({Key? key, required this.tabController})
      : super(key: key);

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
              CustomTextHeader(
                  text: 'Enter the verification code sent to your email.'),
              CustomTextField(text: 'ABCXYZ', controller: controller),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 3,
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
  }
}
