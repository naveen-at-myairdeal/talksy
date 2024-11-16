import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/domain/theme/app_theme.dart';

import '../../domain/constants/app_strings.dart';
import '../../domain/models/country_model/country_model.dart';

ValueNotifier<CountryDataModel> selctedCountryModel = ValueNotifier(CountryDataModel(
  flagPath: Assetpaths.authScreensAssets.indianFLag,
  name: "India",
  numberCode: "+91",
));

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _selectedCountry = 'India';
  String _phoneNumber = '';
  late TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<CountryDataModel> countries = [CountryDataModel(flagPath: Assetpaths.authScreensAssets.indianFLag, name: "India", numberCode: "+91"), CountryDataModel(flagPath: Assetpaths.authScreensAssets.usaFlag, name: "USA", numberCode: "+046"), CountryDataModel(flagPath: Assetpaths.authScreensAssets.spainFlag, name: "Spain", numberCode: "+83")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 42.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 45.h,
                width: double.infinity,
              ),
              SvgPicture.asset(Assetpaths.authScreensAssets.signinPageBanner),
              SizedBox(height: 60.h),
              Text(AppStrings.signin_screen_add_phone_number_title, style: AppTheme.displayMedium),
              SizedBox(height: 16.h),
              Text(AppStrings.signin_screen_body, textAlign: TextAlign.center, style: AppTheme.bodyMedium),
              SizedBox(height: 24.h),
              DropdownButtonFormField<CountryDataModel>(
                value: countries[0],
                items: [
                  DropdownMenuItem<CountryDataModel>(
                    value: countries[0],
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(width: 25, child: Image.asset(countries[0].flagPath)),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'India',
                          style: AppTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem<CountryDataModel>(
                    value: countries[1],
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(width: 25,  child: Image.asset(countries[1].flagPath)),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'USA',
                          style: AppTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem<CountryDataModel>(
                    value: countries[2],
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(width: 25,  child: Image.asset(countries[2].flagPath)),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Spain',
                          style: AppTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),

                  // Add more countries as needed
                ],
                onChanged: (value) {
                  setState(() {
                    selctedCountryModel.value = value!;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select Country',
                  hintStyle: AppTheme.bodyMedium,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(height: 16.h),

    
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.phone, // Changed from numberWithOptions
                  style: AppTheme.bodyMedium,
                  cursorColor: AppTheme.primaryColor,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: AppTheme.bodyMedium,
                    border: const OutlineInputBorder(),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min, // Important fix
                      children: [
                        const SizedBox(width: 20),
                        ValueListenableBuilder<CountryDataModel>(
                            valueListenable: selctedCountryModel,
                            builder: (context, value, child) {
                              return Text(value.numberCode,style: AppTheme.bodyMedium,);
                            }), // You can make this dynamic
                        const SizedBox(width: 25),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 120.h),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pushNamed(RoutePaths.enterOtpPage, arguments: controller.text);
                  } else {}
                },
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(58.h), backgroundColor: AppTheme.primaryColor),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({Key? key, this.initialValue, required this.countryCode}) : super(key: key);

  final String? initialValue;
  final String? countryCode;

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  late TextEditingController _controller;
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _phoneNumber = widget.initialValue ?? '';
    _controller = TextEditingController(text: _phoneNumber);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.phone, // Changed from numberWithOptions
      style: AppTheme.bodyMedium,
      cursorColor: AppTheme.primaryColor,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        hintText: 'Phone Number',
        border: const OutlineInputBorder(),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min, // Important fix
          children: [
            const SizedBox(width: 20),
            ValueListenableBuilder<CountryDataModel>(
                valueListenable: selctedCountryModel,
                builder: (context, value, child) {
                  return Text(value.numberCode);
                }), // You can make this dynamic
            const SizedBox(width: 25),
            Container(
              height: 24,
              width: 1,
              color: Colors.grey,
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      onChanged: (value) {
        setState(() {
          _phoneNumber = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        if (value.length < 10) {
          return 'Please enter a valid 10-digit phone number';
        }
        return null;
      },
    );
  }
}
