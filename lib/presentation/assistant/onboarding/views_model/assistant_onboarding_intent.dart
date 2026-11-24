import 'assistant_onboarding_state.dart';

sealed class AssistantOnboardingIntent {}


final class AssistantOnboardingInit extends AssistantOnboardingIntent {}

final class ToggleCarIntent extends AssistantOnboardingIntent {}

final class ToggleServiceIntent extends AssistantOnboardingIntent {
  final AssistantServiceType service;

  ToggleServiceIntent({required this.service});
}

final class NextButtonPressedIntent extends AssistantOnboardingIntent {}

// verification screen

final class SelectDocumentIntent extends AssistantOnboardingIntent {
  final OnboardingDocumentType documentType;

  SelectDocumentIntent({
    required this.documentType,
  });
}

final class CaptureDocumentIntent extends AssistantOnboardingIntent {
  final OnboardingDocumentType documentType;

  CaptureDocumentIntent({
    required this.documentType,
  });
}

final class RemoveDocumentIntent extends AssistantOnboardingIntent {
  final OnboardingDocumentType documentType;

  RemoveDocumentIntent({
    required this.documentType,
  });

}
final class SubmitDocumentsIntent extends AssistantOnboardingIntent {}
