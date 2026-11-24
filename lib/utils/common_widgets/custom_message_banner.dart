import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomMessageBanner extends StatelessWidget {
  const CustomMessageBanner({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.backgroundColor,
    required this.leftBarIndicatorColor,
    this.titleColor,
    this.messageColor,
    this.borderRadius,
  });

  final String icon;
  final String title;
  final String message;

  final Color backgroundColor;
  final Color leftBarIndicatorColor;
  final Color? titleColor;
  final Color? messageColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(25.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 6.w,
                decoration: BoxDecoration(
                  color: leftBarIndicatorColor,
                  borderRadius: BorderRadiusDirectional.horizontal(
                    start: Radius.circular(25.r),
                  ),
                ),
              ),
            ),
            RPadding(
              padding: const EdgeInsets.only(top: 18,
              left: 8),
              child: SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.h,
                colorFilter :ColorFilter.mode(
                  theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),

              )

            ),
            RSizedBox(width: 6),
            Expanded(
              child: RPadding(
                padding: const EdgeInsets.only(right: 14,bottom: 14,
                top: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),

                    ),
                    RSizedBox(height: 2),

                    Text(
                      message ,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: titleColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
