// otp_state.dart
class OtpState {
  final List<String> otpDigits;
  final bool isComplete;
  final bool isLoading;
  final String? errorMessage;
  final bool resendingOtp;

  OtpState({
    required this.otpDigits,
    this.isComplete = false,
    this.isLoading = false,
    this.errorMessage,
    this.resendingOtp = false,
  });

  factory OtpState.initial() {
    return OtpState(
      otpDigits: List.filled(6, ''),
    );
  }

  OtpState copyWith({
    List<String>? otpDigits,
    bool? isComplete,
    bool? isLoading,
    String? errorMessage,
    bool? resendingOtp,
  }) {
    return OtpState(
      otpDigits: otpDigits ?? this.otpDigits,
      isComplete: isComplete ?? this.isComplete,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      resendingOtp: resendingOtp ?? this.resendingOtp,
    );
  }

  String get completeOtp => otpDigits.join();
}