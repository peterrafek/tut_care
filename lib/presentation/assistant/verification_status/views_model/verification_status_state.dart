
import 'package:equatable/equatable.dart';

enum VerificationStatus {
  pending,
  confirmed,
  rejected,
}

class VerificationStatusState extends Equatable {
  final VerificationStatus status;
  final String? rejectionReason;

  const VerificationStatusState({
    this.status = VerificationStatus.pending,
    this.rejectionReason,
  });

  VerificationStatusState copyWith({
    VerificationStatus? status,
    String? rejectionReason,
    bool clearRejectionReason = false,
  }) {
    return VerificationStatusState(
      status: status ?? this.status,
      rejectionReason: clearRejectionReason
          ? null
          : rejectionReason ?? this.rejectionReason,
    );
  }

  @override
  List<Object?> get props => [
    status,
    rejectionReason,
  ];
}
