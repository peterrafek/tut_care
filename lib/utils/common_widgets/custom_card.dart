import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: double.infinity,
        height: 154.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.secondaryContainer
              : colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline,
            width: isSelected ? 2.w : 1.5.w,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: RPadding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: isSelected ? colorScheme.primary : colorScheme.surface,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  icon,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    isSelected ? colorScheme.onPrimary : colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),

              RSizedBox(width: 16),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),

                    RSizedBox(height: 4),

                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              RSizedBox(width: 6),

              isSelected
                  ? RSizedBox(
                      width: 28,
                      height: 28,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 28.sp,
                            color: colorScheme.primary,
                          ),
                          Icon(
                            Icons.check,
                            size: 18.sp,
                            color: colorScheme.onPrimary,
                          ),
                        ],
                      ),
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      size: 28.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
