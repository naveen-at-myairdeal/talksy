// otp_event.dart
abstract class OtpEvent {
  const OtpEvent();
}

class OtpDigitChanged extends OtpEvent {
  final int index;
  final String value;

  OtpDigitChanged({required this.index, required this.value});
}

class OtpSubmitted extends OtpEvent {}

class OtpResendRequested extends OtpEvent {}

class OtpCleared extends OtpEvent {}