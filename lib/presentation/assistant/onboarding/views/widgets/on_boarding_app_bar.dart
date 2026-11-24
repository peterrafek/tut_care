import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/utils/common_widgets/custom_app_bar.dart';
import 'package:tut_care/utils/common_widgets/custom_back_arrow.dart';

class OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomAppBar(

      leading: const CustomBackArrow(),
      centerTitle: true,
      isTitleWidget: true,
      titleWidget: RPadding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Text(
          AppText.whatHelpCanYouOffer.tr(),
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
