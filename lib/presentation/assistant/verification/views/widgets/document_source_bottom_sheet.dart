
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_cubit.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_intent.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_state.dart';

class DocumentSourceBottomSheet {
  static void show({
    required BuildContext context,
    required AssistantOnboardingCubit cubit,
    required OnboardingDocumentType documentType,
  }) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: Text(AppText.camera.tr()),
                onTap: () {
                  Navigator.pop(sheetContext);

                  cubit.doIntent(
                    intent: CaptureDocumentIntent(
                      documentType: documentType,
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder_outlined),
                title:   Text(AppText.chooseFromFiles.tr()),
                onTap: () {
                  Navigator.pop(sheetContext);

                  cubit.doIntent(
                    intent: SelectDocumentIntent(
                      documentType: documentType,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
