// otp_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpState.initial()) {
    on<OtpDigitChanged>(_onOtpDigitChanged);
    on<OtpSubmitted>(_onOtpSubmitted);
    on<OtpResendRequested>(_onOtpResendRequested);
    on<OtpCleared>(_onOtpCleared);
  }

  void _onOtpDigitChanged(OtpDigitChanged event, Emitter<OtpState> emit) {
    final newOtpDigits = List<String>.from(state.otpDigits);
    newOtpDigits[event.index] = event.value;

    final isComplete = newOtpDigits.every((digit) => digit.isNotEmpty);

    emit(state.copyWith(
      otpDigits: newOtpDigits,
      isComplete: isComplete,
      errorMessage: null,
    ));
  }

  Future<void> _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    if (!state.isComplete) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Add your OTP verification logic here
      await Future.delayed(Duration(seconds: 2)); // Simulated API call
      
      // If verification successful, you can emit success state
      // If verification fails, throw exception
      
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Invalid OTP. Please try again.',
      ));
    }
  }

  Future<void> _onOtpResendRequested(OtpResendRequested event, Emitter<OtpState> emit) async {
    emit(state.copyWith(resendingOtp: true, errorMessage: null));

    try {
      // Add your resend OTP logic here
      await Future.delayed(Duration(seconds: 2)); // Simulated API call
      
      emit(state.copyWith(
        resendingOtp: false,
        otpDigits: List.filled(6, ''),
        isComplete: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        resendingOtp: false,
        errorMessage: 'Failed to resend OTP. Please try again.',
      ));
    }
  }

  void _onOtpCleared(OtpCleared event, Emitter<OtpState> emit) {
    emit(state.copyWith(
      otpDigits: List.filled(6, ''),
      isComplete: false,
      errorMessage: null,
    ));
  }
}