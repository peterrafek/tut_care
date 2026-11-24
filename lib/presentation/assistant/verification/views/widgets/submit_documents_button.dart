
import 'package:flutter/material.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_cubit.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_intent.dart';
import 'package:tut_care/utils/common_widgets/custom_elevated_button.dart';

class SubmitDocumentsButton extends StatelessWidget {
  final AssistantOnboardingCubit cubit;

  const SubmitDocumentsButton({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 3),
        const SizedBox(height: 16),
        CustomElevatedButton(
          onPressed: () {
            cubit.doIntent(
              intent: SubmitDocumentsIntent(),
            );
          },
          buttonTitle: AppText.submitForReview,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
