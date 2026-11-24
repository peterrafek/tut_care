import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tut_care/core/constants/app_colors.dart';
import 'package:tut_care/core/constants/app_icons.dart';

import '../../views_model/verification_status_state.dart';

class VerificationStatusIllustration extends StatelessWidget {
  final VerificationStatus status;

  const VerificationStatusIllustration({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    late final Widget icon;
     late final Color backgroundColor;

    switch (status) {
      case VerificationStatus.pending:
        icon = SvgPicture.asset(
          AppIcons.shieldCheck,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.primary,
            BlendMode.srcIn,
          ),
        );
         backgroundColor = theme.colorScheme.secondaryContainer;

      case VerificationStatus.confirmed:
        icon = SvgPicture.asset(
          AppIcons.check,
          colorFilter: ColorFilter.mode(
            AppColors.textSuccessLight,
            BlendMode.srcIn,
          ),
        );
         backgroundColor = AppColors.successSubtleLight;
      case VerificationStatus.rejected:
        icon = SvgPicture.asset(
          AppIcons.rejected,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.error,
            BlendMode.srcIn,
          ),
        );
         backgroundColor = theme.colorScheme.errorContainer;
    }

    return Container(
      width: 96.w,
      height: 96.w,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Center(
        child: SizedBox(
          width: 44.w,
          height: 44.w,
          child: icon,
        ),
      ),
    );
  }
}
