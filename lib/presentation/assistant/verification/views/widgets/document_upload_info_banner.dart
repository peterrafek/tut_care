
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tut_care/core/constants/app_icons.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/utils/common_widgets/custom_message_banner.dart';

class DocumentUploadInfoBanner extends StatelessWidget {
  const DocumentUploadInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomMessageBanner(
      icon: AppIcons.info,
      title:AppText.useYourCameraPhone.tr(),
      message:AppText.tapUploadToTakeAPhotoWellCheckItsReadableBeforeSending.tr()
      ,
      backgroundColor: theme.colorScheme.secondaryContainer,
      leftBarIndicatorColor: theme.colorScheme.primary,
    );
  }
}
