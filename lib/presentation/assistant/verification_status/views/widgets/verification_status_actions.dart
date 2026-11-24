import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/utils/common_widgets/custom_elevated_button.dart';

class VerificationStatusActions extends StatelessWidget {
  const VerificationStatusActions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Divider(thickness: 2),
        RSizedBox(height: 16),

        CustomElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   RouteNames.profileView,
            // );
          },
          buttonTitle:AppText.completeMyProfile.tr(),
        ),
        RSizedBox(height: 12),

        CustomElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   RouteNames.tutCareBottomNavigation,
            // );
          },
          buttonTitle:AppText.previewTheApp.tr() ,
          backgroundColor: theme.colorScheme.onPrimary,
          borderColor: theme.colorScheme.primary,
          titleStyle: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        RSizedBox(height: 20),
      ],
    );
  }
}
