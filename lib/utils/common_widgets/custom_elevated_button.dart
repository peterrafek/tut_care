import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.height,
    this.width,
    this.titleStyle,
    this.borderColor,
    this.isText = true,
    this.child,
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final Color? backgroundColor;
  final double? height, width;
  final TextStyle? titleStyle;
  final Color? borderColor;
  final bool isText;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),
        minimumSize: Size.fromHeight(height ?? 56.h),

        padding: EdgeInsets.symmetric(horizontal: 20.w),
        side: borderColor != null
            ? BorderSide(color: borderColor!, width: 2)
            : null,
      ),
      onPressed: onPressed,
      child: isText
          ? Text(
              buttonTitle.tr(),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
               style:
                  titleStyle ??
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            )
          : child,
    );
  }
}
