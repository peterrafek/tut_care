import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/core/router/route_names.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_cubit.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_state.dart';
 import 'package:tut_care/utils/loaders/loaders.dart';

import 'police_clearance_upload_section.dart';
import 'document_source_bottom_sheet.dart';
import 'document_upload_info_banner.dart';
import 'national_id_upload_section.dart';
import 'professional_license_upload_section.dart';
import 'submit_documents_button.dart';
import 'verification_intro.dart';

class VerifyIdentityBody extends StatelessWidget {
  const VerifyIdentityBody({super.key});

  String _getDocumentDescription(
    PlatformFile? document,
    String defaultDescription,
  ) {
    if (document == null) return defaultDescription;

    final sizeInMb = (document.size / (1024 * 1024)).toStringAsFixed(1);

    return '${document.name} · $sizeInMb MB';
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AssistantOnboardingCubit>(context);

    return SingleChildScrollView(
      child: RPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<AssistantOnboardingCubit, AssistantOnboardingState>(
          listener: (context, state) {

            if (state.effect == OnboardingEffect.documentTooLarge) {
              Loaders.showWarningMessage(
                context: context,
                message: AppText.fileSizeMustNotExceed10MB.tr(),
              );

              cubit.resetEffect();
            }
            if (state.effect == OnboardingEffect.navigateToVerificationStatus) {
              cubit.resetEffect();

              Navigator.pushNamed(context, RouteNames.verificationStatusView);
            }
          },
          builder: (context, state) {
            final nationalId = state.nationalIdDocument;
            final policeClearance = state.policeClearanceDocument;
            final professionalLicense = state.professionalLicenseDocument;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VerificationIntro(),

                NationalIdUploadSection(
                  description: _getDocumentDescription(
                    nationalId,
                    AppText.uploadAClearPhotoOfYourNationalID.tr(),
                  ),
                  hasError: state.nationalIdHasError,
                  isUploaded: nationalId != null,
                  onUploadTap: () {
                    DocumentSourceBottomSheet.show(
                      context: context,
                      cubit: cubit,
                      documentType: OnboardingDocumentType.nationalId,
                    );
                  },
                ),

                PoliceClearanceUploadSection(
                  description: _getDocumentDescription(
                    policeClearance,
                    AppText.pdfOrDocUpTo10Mb.tr(),
                  ),
                  hasError: state.policeClearanceHasError,
                  isUploaded: policeClearance != null,
                  onUploadTap: () {
                    DocumentSourceBottomSheet.show(
                      context: context,
                      cubit: cubit,
                      documentType: OnboardingDocumentType.policeClearance,
                    );
                  },
                ),

                ProfessionalLicenseUploadSection(
                  description: _getDocumentDescription(
                    professionalLicense,
                    AppText.photoOrPdfOfAValidLicence.tr(),
                  ),
                  isUploaded: professionalLicense != null,
                  onUploadTap: () {
                    DocumentSourceBottomSheet.show(
                      context: context,
                      cubit: cubit,
                      documentType: OnboardingDocumentType.professionalLicense,
                    );
                  },
                ),

                const DocumentUploadInfoBanner(),

                SizedBox(height: 24.h),

                SubmitDocumentsButton(cubit: cubit),
              ],
            );
          },
        ),
      ),
    );
  }
}
