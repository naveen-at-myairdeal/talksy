import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/domain/theme/app_theme.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.purple),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  const Spacer(),
                  Text(
                    "Language",
                    style: AppTheme.displayLargePrimaryColor,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.transparent),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              _buildLanguageOption("English"),
              _buildLanguageOption("中文 (Chinese)"),
              _buildLanguageOption("മലയാളം (Malayalam)"),
              _buildLanguageOption("العربية (Arabic)"),
              _buildLanguageOption("हिन्दी (Hindi)"),
              SizedBox(height: 40.h),
              ElevatedButton(
                onPressed: _selectedLanguage == null
                    ? null
                    : () {
                        Navigator.of(context).pushNamed(RoutePaths.getUserNameAndProfilePicture);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedLanguage == null ? Colors.grey : Colors.purple,
                  minimumSize: Size(double.infinity, 48.h),
                ),
                child: Text("Next",
                    style: GoogleFonts.openSans(
                      color: _selectedLanguage == null ? Colors.grey : Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    bool isSelected = _selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 25.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          language,
          style: TextStyle(
            fontSize: 21.sp,
            color: isSelected ? Colors.purple : Colors.black,
          ),
        ),
      ),
    );
  }
}
