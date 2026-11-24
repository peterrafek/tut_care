import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/router/route_names.dart';
import 'package:tut_care/presentation/assistant/onboarding/views/assistant_onboarding_view.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_cubit.dart';
import 'package:tut_care/presentation/assistant/verification/views/verify_identity_view.dart';
import 'package:tut_care/presentation/assistant/verification_status/views/verification_status_views.dart';
import 'package:tut_care/presentation/auth/login/views/login_view.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.assistantOnboardingView:
        return  MaterialPageRoute(builder: (_) => const AssistantOnboardingView());
      case RouteNames.verifyIdentityView:
        final cubit = settings.arguments as AssistantOnboardingCubit;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const VerifyIdentityView(),

          ),
        );
      case RouteNames.verificationStatusView:
        return MaterialPageRoute(
          builder: (_) => const VerificationStatusView(),
        );
      default:
        return null;
    }
  }
}