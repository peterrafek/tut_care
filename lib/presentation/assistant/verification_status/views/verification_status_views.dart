
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/di/di.dart';
import 'package:tut_care/presentation/assistant/verification_status/views/widgets/verification_status_app_bar.dart';
import 'package:tut_care/presentation/assistant/verification_status/views/widgets/verification_status_body.dart';
import 'package:tut_care/presentation/assistant/verification_status/views_model/verification_status_cubit.dart';


class VerificationStatusView extends StatelessWidget {
  const VerificationStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<VerificationStatusCubit>(),

      child: Scaffold(appBar: VerificationStatusAppBar(),
          body: const VerificationStatusBody()),
    );
  }
}
