import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/presentation/assistant/verification_status/views_model/verification_status_cubit.dart';
import 'package:tut_care/presentation/assistant/verification_status/views_model/verification_status_state.dart';

import 'rejection_reason_card.dart';
import 'verification_status_actions.dart';
import 'verification_status_badge.dart';
import 'verification_status_illustration.dart';
import 'verification_status_message.dart';

class VerificationStatusBody extends StatelessWidget {
  const VerificationStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationStatusCubit, VerificationStatusState>(
      builder: (context, state) {
        return RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              RSizedBox(height: 120),

              VerificationStatusBadge(status: state.status),

              RSizedBox(height: 16),

              VerificationStatusIllustration(status: state.status),

              RSizedBox(height: 16),

              VerificationStatusMessage(status: state.status),

              if (state.status == VerificationStatus.rejected &&
                  state.rejectionReason != null &&
                  state.rejectionReason!.isNotEmpty) ...[
                SizedBox(height: 24.h),
                RejectionReasonCard(reason: state.rejectionReason!),
              ],


              Spacer(),
              VerificationStatusActions(),
            ],
          ),
        );
      },
    );
  }
}
