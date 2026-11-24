import 'package:flutter/material.dart';
import 'package:tut_care/presentation/assistant/verification/views/widgets/verify_identity_app_bar.dart';
import 'package:tut_care/presentation/assistant/verification/views/widgets/verify_identity_body.dart';

class VerifyIdentityView extends StatelessWidget {
  const VerifyIdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VerifyIdentityAppBar(),
      body: const VerifyIdentityBody(),
    );
  }
}
