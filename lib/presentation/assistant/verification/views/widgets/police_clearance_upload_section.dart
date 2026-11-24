
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/utils/common_widgets/custom_document_upload_card.dart';

class PoliceClearanceUploadSection extends StatelessWidget {
  final String description;
  final bool isUploaded;
  final bool hasError;
  final VoidCallback onUploadTap;

  const PoliceClearanceUploadSection({
    super.key,
    required this.description,
    required this.isUploaded,
    required this.hasError,
    required this.onUploadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDocumentUploadCard(
          title: AppText.policeClearanceCertificate.tr(),
          description: description,
          hasError: hasError,
          isUploaded: isUploaded,
          onUploadTap: onUploadTap,
        ),
        RSizedBox(height: 16),
      ],
    );
  }
}
