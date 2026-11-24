import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'verification_status_state.dart';

@injectable
class VerificationStatusCubit extends Cubit<VerificationStatusState> {
  VerificationStatusCubit() : super(const VerificationStatusState());

  void updateVerificationStatus({
    required VerificationStatus status,
    String? rejectionReason,
  }) {
    emit(
      state.copyWith(
        status: status,
        rejectionReason: rejectionReason,
        clearRejectionReason: status != VerificationStatus.rejected,
      ),
    );
  }
}
