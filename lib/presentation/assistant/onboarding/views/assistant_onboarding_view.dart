import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/di/di.dart';
import 'package:tut_care/presentation/assistant/onboarding/views/widgets/on_boarding_app_bar.dart';
import 'package:tut_care/presentation/assistant/onboarding/views/widgets/on_boarding_body.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_cubit.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_intent.dart';

class AssistantOnboardingView extends StatelessWidget {
  const AssistantOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<AssistantOnboardingCubit>()
            ..doIntent(intent: AssistantOnboardingInit()),
      child: Scaffold(appBar: OnBoardingAppBar(), body: OnBoardingBody()),
    );
  }
}
