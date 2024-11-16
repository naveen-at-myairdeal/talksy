import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/routes/routes.dart';

import '../../domain/constants/app_strings.dart';
import '../../domain/theme/app_theme.dart';

class OTPInputScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPInputScreen({required this.phoneNumber, super.key});

  @override
  State<OTPInputScreen> createState() => _OTPInputScreenState();
}

class _OTPInputScreenState extends State<OTPInputScreen> {
  final TextEditingController _otpController = TextEditingController();
  String currentOTP = "";

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 800.h,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Back Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.purple),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                SvgPicture.asset(Assetpaths.authScreensAssets.otpPageBanner),
                SizedBox(height: 32.h),
                Text(AppStrings.otp_screen_entercode, style: AppTheme.displayLarge),
                const SizedBox(height: 16),
                // Description
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.otp_screen_body,
                        style: AppTheme.bodySmallGreyColor,
                      ),
                      TextSpan(text: "+91 ${widget.phoneNumber}", style: AppTheme.bodyMedium),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 32),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  cursorColor: Colors.purple,
                  cursorHeight: 19,
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 55.w,
                    fieldWidth: 55.w,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.purple[50],
                    activeColor: Colors.purple,
                    selectedColor: Colors.purple,
                    inactiveColor: Colors.purple[100]!,
                    borderWidth: 0,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  onChanged: (value) {
                    setState(() {
                      currentOTP = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    // Allow only numbers
                    if (text != null) {
                      return text.contains(RegExp(r'^[0-9]*$'));
                    }
                    return false;
                  },
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: TextButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'Re-send Code',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: currentOTP.length == 6
                        ? () {
                            print('OTP Entered: $currentOTP');
                            Navigator.of(context).pushNamed(RoutePaths.languageSelectionScreen);
                          }
                        : () {
                            
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentOTP.length == 6 ? AppTheme.primaryColor : Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
