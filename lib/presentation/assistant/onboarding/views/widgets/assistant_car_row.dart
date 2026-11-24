
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tut_care/core/constants/app_icons.dart';
import 'package:tut_care/core/constants/app_text.dart';

class CarOptionWidget extends StatelessWidget {
  const CarOptionWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: theme.colorScheme.secondaryContainer,
            child: SvgPicture.asset(AppIcons.navigation),
          ),

          RSizedBox(width: 16),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.iHaveACar.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),

                RSizedBox(height: 2),

                Text(
                  AppText.shownOnYourProfile.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          RSizedBox(width: 16),

          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              isSelected
                  ? AppIcons.toggleOn
                  : AppIcons.toggle,
            ),
          ),
        ],
      ),
    );
  }
}
