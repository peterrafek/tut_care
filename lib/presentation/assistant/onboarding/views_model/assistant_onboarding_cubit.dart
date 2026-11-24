import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'assistant_onboarding_intent.dart';
import 'assistant_onboarding_state.dart';

@injectable
class AssistantOnboardingCubit extends Cubit<AssistantOnboardingState> {
  AssistantOnboardingCubit() : super(const AssistantOnboardingState());
  static const int _maxFileSize = 10 * 1024 * 1024;

  Future<void> doIntent({required AssistantOnboardingIntent intent}) async {
    switch (intent) {
      case ToggleCarIntent():
        _toggleCar();
        break;

      case ToggleServiceIntent():
        _toggleService(intent.service);
        break;

      case NextButtonPressedIntent():
        _onNextButtonPressed();
        break;

      case AssistantOnboardingInit():
        _init();
        break;

      case SelectDocumentIntent():
        await _selectDocument(intent.documentType);
        break;

      case CaptureDocumentIntent():
        await _captureDocument(intent.documentType);
        break;

      case RemoveDocumentIntent():
        _removeDocument(intent.documentType);
        break;
      case SubmitDocumentsIntent():
        _submitDocuments();
        break;
    }
  }

  void _toggleCar() {
    emit(state.copyWith(hasCar: !state.hasCar));
  }

  void _toggleService(AssistantServiceType service) {
    final updatedServices = {...state.selectedServices};

    if (updatedServices.contains(service)) {
      updatedServices.remove(service);
    } else {
      updatedServices.add(service);
    }

    emit(state.copyWith(selectedServices: Set.unmodifiable(updatedServices)));
  }

  void _onNextButtonPressed() {
    if (state.selectedServices.isEmpty) {
      emit(state.copyWith(effect: OnboardingEffect.validationError));
      return;
    }

    emit(state.copyWith(effect: OnboardingEffect.navigateToVerification));
  }

  void _init() {
    emit(const AssistantOnboardingState());
  }

  void resetEffect() {
    emit(state.copyWith(effect: OnboardingEffect.none));
  }

  Future<void> _selectDocument(OnboardingDocumentType documentType) async {
    List<String> allowedExtensions;

    switch (documentType) {
      case OnboardingDocumentType.nationalId:
        allowedExtensions = ['jpg', 'jpeg', 'png'];
        break;

      case OnboardingDocumentType.policeClearance:
        allowedExtensions = [
          'jpg',
          'jpeg',
          'png',
          'pdf',
          'doc',
          'docx',
        ];
        break;

      case OnboardingDocumentType.professionalLicense:
        allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
        break;
    }

    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );

    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;

    if (documentType == OnboardingDocumentType.policeClearance && file.size > _maxFileSize) {
      _emitDocumentTooLargeEffect();
      return;
    }

    _updateDocument(documentType, file);
  }

  Future<void> _captureDocument(OnboardingDocumentType documentType) async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    if (image == null) return;

    final file = File(image.path);

    final platformFile = PlatformFile(
      name: image.name,
      path: image.path,
      size: await file.length(),
    );

     if (documentType == OnboardingDocumentType.policeClearance &&
        platformFile.size > _maxFileSize) {
      _emitDocumentTooLargeEffect();
      return;
    }

    _updateDocument(documentType, platformFile);
  }

  void _updateDocument(OnboardingDocumentType documentType, PlatformFile file) {
    switch (documentType) {
      case OnboardingDocumentType.nationalId:
        emit(state.copyWith(nationalIdDocument: file,
          nationalIdHasError: false,
        ));
        break;

      case OnboardingDocumentType.policeClearance:
        emit(state.copyWith(policeClearanceDocument: file,
          policeClearanceHasError: false,));
        break;

      case OnboardingDocumentType.professionalLicense:
        emit(state.copyWith(professionalLicenseDocument: file));
        break;
    }
  }

  void _removeDocument(OnboardingDocumentType documentType) {
    switch (documentType) {
      case OnboardingDocumentType.nationalId:
        emit(state.copyWith(clearNationalIdDocument: true));
        break;

      case OnboardingDocumentType.policeClearance:
        emit(state.copyWith(clearCvDocument: true));
        break;

      case OnboardingDocumentType.professionalLicense:
        emit(state.copyWith(clearProfessionalLicenseDocument: true));
        break;
    }
  }

  void _emitDocumentTooLargeEffect() {
    emit(state.copyWith(effect: OnboardingEffect.documentTooLarge));
  }

  void _submitDocuments() {
    final nationalIdMissing = state.nationalIdDocument == null;
    final cvMissing = state.policeClearanceDocument == null;

    emit(
      state.copyWith(
        nationalIdHasError: nationalIdMissing,
        policeClearanceHasError: cvMissing,
      ),
    );

    if (nationalIdMissing || cvMissing) return;


    // TODO: Call Submit Documents API and wait for successful response.
    emit(
      state.copyWith(
        effect: OnboardingEffect.navigateToVerificationStatus,
      ),
    );
  }
}
