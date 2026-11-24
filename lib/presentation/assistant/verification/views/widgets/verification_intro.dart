
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';

class VerificationIntro extends StatelessWidget {
  const VerificationIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        RSizedBox(height: 16),
        Text(
          AppText
              .weReviewDocumentsUsuallyWithin24HoursClientsNeverSeeYourDocumentsOnlyThatTheyWereReviewed
              .tr(),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyLarge,
        ),
        RSizedBox(height: 14),
      ],
    );
  }
}
