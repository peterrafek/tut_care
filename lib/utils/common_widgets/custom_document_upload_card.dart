import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_care/core/constants/app_colors.dart';
import 'package:tut_care/core/constants/app_icons.dart';
import 'package:tut_care/utils/common_widgets/custom_elevated_button.dart';

class CustomDocumentUploadCard extends StatelessWidget {
  const CustomDocumentUploadCard({
    super.key,
    required this.title,
    required this.description,
    this.hasError = false,
    required this.isUploaded,
    required this.onUploadTap,
  });

  final String title;
  final String description;
  final bool hasError;
  final bool isUploaded;
  final VoidCallback onUploadTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(
          color: hasError?  theme.colorScheme.error
            :  isUploaded ? AppColors.textSuccessLight : colorScheme.outline,
          width:  hasError || isUploaded ? 2.w : 1.5.w,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: isUploaded
                  ? AppColors.successSubtleLight
                  : colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(14.r),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              isUploaded ? AppIcons.uploaded : AppIcons.file,
              width: 24.w,
              height: 24.h,
              colorFilter: isUploaded
                  ? null
                  : ColorFilter.mode(
                colorScheme.primary,
                BlendMode.srcIn,
              ),

            ),
          ),

          RSizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),

                RSizedBox(height: 4),

                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          RSizedBox(width: 12),

          RSizedBox(
            width: 110,
            height: 56,
            child: CustomElevatedButton(
              backgroundColor: isUploaded
                  ? colorScheme.surface
                  : colorScheme.primary,
              borderColor: colorScheme.primary,
              isText: true,


              onPressed: onUploadTap,
              buttonTitle: isUploaded ? 'Replace' : 'Upload',
              titleStyle: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: isUploaded ? colorScheme.primary : colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
