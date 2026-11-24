import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tut_care/core/state_status/state_staus.dart';

enum AssistantServiceType {
  visualGuidance,
  mobilityAssistance,
  comprehensiveSupport,
}

enum OnboardingEffect {
  none,
  validationError,
  navigateToVerification,
  documentTooLarge,
  navigateToVerificationStatus,

}

enum OnboardingDocumentType { nationalId, policeClearance, professionalLicense }

enum VerificationStatus {
  pending,
  approved,
  rejected,
}
class AssistantOnboardingState extends Equatable {
  final StateStatus<void> status;
  final bool hasCar;
  final Set<AssistantServiceType> selectedServices;
  final OnboardingEffect effect;
  final bool nationalIdHasError;
  final bool policeClearanceHasError;

  // Identity Documents
  final PlatformFile? nationalIdDocument;
  final PlatformFile? policeClearanceDocument;
  final PlatformFile? professionalLicenseDocument;

  const AssistantOnboardingState({
    this.status = const StateStatus.initial(),
    this.hasCar = false,
    this.policeClearanceHasError = false,
    this.nationalIdHasError = false,
    this.selectedServices = const {},
    this.effect = OnboardingEffect.none,
    this.nationalIdDocument,
    this.policeClearanceDocument,
    this.professionalLicenseDocument,
  });

  AssistantOnboardingState copyWith({
    StateStatus<void>? status,
    bool? hasCar,
    bool? policeClearanceHasError,
    bool? nationalIdHasError,
    Set<AssistantServiceType>? selectedServices,
    OnboardingEffect? effect,
    PlatformFile? nationalIdDocument,
    PlatformFile? policeClearanceDocument,
    PlatformFile? professionalLicenseDocument,
    bool clearNationalIdDocument = false,
    bool clearCvDocument = false,
    bool clearProfessionalLicenseDocument = false,
  }) {
    return AssistantOnboardingState(
      status: status ?? this.status,
      hasCar: hasCar ?? this.hasCar,
      policeClearanceHasError: policeClearanceHasError ?? this.policeClearanceHasError,
      nationalIdHasError: nationalIdHasError ?? this.nationalIdHasError,
      selectedServices: selectedServices ?? this.selectedServices,
      effect: effect ?? this.effect,
      nationalIdDocument: clearNationalIdDocument
          ? null
          : nationalIdDocument ?? this.nationalIdDocument,
      policeClearanceDocument: clearCvDocument ? null : policeClearanceDocument ?? this.policeClearanceDocument,
      professionalLicenseDocument: clearProfessionalLicenseDocument
          ? null
          : professionalLicenseDocument ?? this.professionalLicenseDocument,
    );
  }

  @override
  List<Object?> get props => [
    status,
    hasCar,
    selectedServices,
    effect,
    nationalIdDocument,
    policeClearanceDocument,
    professionalLicenseDocument,
    policeClearanceHasError,
    nationalIdHasError,
  ];
}
