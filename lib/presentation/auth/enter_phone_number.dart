import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/theme/app_theme.dart';

import '../../domain/constants/app_strings.dart';
import '../../domain/models/country_model/country_model.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _selectedCountry = 'India';
  String _phoneNumber = '';
  List<CountryDataModel> countries = [
    CountryDataModel(flagPath: Assetpaths.authScreensAssets.indianFLag, name: "India", numberCode: "+91"),
    CountryDataModel(flagPath: Assetpaths.authScreensAssets.usaFlag, name: "USA", numberCode: "+046"),
    CountryDataModel(flagPath: Assetpaths.authScreensAssets.spainFlag, name: "Spain", numberCode: "+83")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(AppStrings.signin_screen_add_phone_number_title, style: AppTheme.displayLarge),
              SizedBox(height: 16.h),
              Text(AppStrings.signin_screen_body, textAlign: TextAlign.center, style: AppTheme.bodyMediu),
              SizedBox(height: 24.h),
              DropdownButtonFormField<CountryDataModel>(
                value: countries[0],
                items: [
                  DropdownMenuItem<CountryDataModel>(
                    value: countries[0],
                    child: Row(
                      children: [
                        const SizedBox(width: 8,),
                        SizedBox(
                          width: 20,
                          height: 30,
                          child: Image.asset(countries[0].flagPath)),
                       const SizedBox(width: 15,),
                        const Text('India'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<CountryDataModel>(
                    value: countries[1],
                    child: Row(
                      children: [
                        const SizedBox(width: 8,),
                        SizedBox(
                           width: 20,
                          height: 30,
                          child: Image.asset(countries[1].flagPath)),
                       const SizedBox(width: 15,),
                        const Text('USA'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<CountryDataModel>(
                    value: countries[2],
                    child: Row(
                      children: [
                        const SizedBox(width: 8,),
                        SizedBox(
                           width: 20,
                          height: 30,
                          child: Image.asset(countries[2].flagPath)),
                       const SizedBox(width: 15,),
                        const Text('Spain'),
                      ],
                    ),
                  ),
                  
                  
                  // Add more countries as needed
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value!.name;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Select Country',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _phoneNumber = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
             SizedBox(height: 120.h),
              ElevatedButton(
                onPressed: () {
                  // Handle sign-in logic
                },
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(58.h), backgroundColor: AppTheme.primaryColor),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
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
