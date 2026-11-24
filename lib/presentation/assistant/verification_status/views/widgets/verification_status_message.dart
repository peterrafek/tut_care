
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';

import '../../views_model/verification_status_state.dart';


class VerificationStatusMessage extends StatelessWidget {
  final VerificationStatus status;

  const VerificationStatusMessage({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    late final String title;
    late final String description;

    switch (status) {
      case VerificationStatus.pending:
        title = AppText.thanksWereReviewingYourDocuments.tr();
        description =AppText.thisUsuallyTakesLessThan24Hours.tr();

      case VerificationStatus.confirmed:
        title = AppText.yourIdentityIsVerified.tr();
        description =AppText.yourDocumentsHaveBeenApproved.tr();


      case VerificationStatus.rejected:
        title = AppText.verificationWasUnsuccessful.tr();
        description =AppText.couldNotVerifyYourDocuments.tr();

    }

    return Column(
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
           ),
        ),
      ],
    );
  }
}
