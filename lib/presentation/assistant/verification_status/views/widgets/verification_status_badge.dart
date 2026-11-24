import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut_care/core/constants/app_colors.dart';
import 'package:tut_care/core/constants/app_icons.dart';
import 'package:tut_care/core/constants/app_text.dart';

import '../../views_model/verification_status_state.dart';

class VerificationStatusBadge extends StatelessWidget {
  final VerificationStatus status;

  const VerificationStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    late final String label;
    late final Widget icon;
    late final Color color;
    late final Color backgroundColor;

    switch (status) {
      case VerificationStatus.pending:
        label = AppText.pending.tr();
        icon = SvgPicture.asset(
          AppIcons.clock,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
        );
        color = theme.colorScheme.onSurfaceVariant;
        backgroundColor = AppColors.surfaceSunkenLight;

      case VerificationStatus.confirmed:
        label = AppText.confirmed.tr();
        icon = SvgPicture.asset(
          AppIcons.check,
          colorFilter: ColorFilter.mode(
            AppColors.textSuccessLight,
            BlendMode.srcIn,
          ),
        );
        color = AppColors.textSuccessLight;
        backgroundColor = AppColors.successSubtleLight;

      case VerificationStatus.rejected:
        label = AppText.rejected.tr();
        icon = SvgPicture.asset(
          AppIcons.rejected,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.error,
            BlendMode.srcIn,
          ),
        );
        color = theme.colorScheme.error;
        backgroundColor = theme.colorScheme.errorContainer;
    }

    return Container(
      width: 120.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: RPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RSizedBox(width: 18, height: 18, child: icon),
            RSizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
