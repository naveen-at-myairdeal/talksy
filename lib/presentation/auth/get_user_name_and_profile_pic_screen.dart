import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/domain/theme/app_theme.dart';

class GetUserNameAndProfilePicture extends StatefulWidget {
  const GetUserNameAndProfilePicture({super.key});

  @override
  _GetUserNameAndProfilePictureState createState() => _GetUserNameAndProfilePictureState();
}

class _GetUserNameAndProfilePictureState extends State<GetUserNameAndProfilePicture> {
  final ValueNotifier<XFile?> _profileImageNotifier = ValueNotifier<XFile?>(null);
  final TextEditingController _nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? _errorMessage;

  @override
  void dispose() {
    _profileImageNotifier.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Take Photo"),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                _profileImageNotifier.value = image;
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Choose Photo"),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                _profileImageNotifier.value = image;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppTheme.primaryColor),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
              SizedBox(height: 100.h),
              GestureDetector(
                onTap: _selectImage,
                child: ValueListenableBuilder<XFile?>(
                  valueListenable: _profileImageNotifier,
                  builder: (context, file, child) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: file != null
                                ? Image.file(
                                    File(file.path),
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    Assetpaths.authScreensAssets.profilePlaceHolder,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Positioned(
                            child: SvgPicture.asset(Assetpaths.authScreensAssets.cameraIconAtProfileImage),
                            right: 3,
                            bottom: 3,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Enter your name and add a profile picture.",
                style: AppTheme.titleMediumPrimaryColor,
              ),
              SizedBox(height: 30.h),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name ...',
                  hintStyle: AppTheme.labelLargeGreyColor,
                  border: OutlineInputBorder(borderSide: BorderSide(width: 0)),
                  filled: true,
                  fillColor: Colors.purple[50],
                  errorText: _errorMessage,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_nameController.text.trim().isEmpty) {
                      _errorMessage = "Name cannot be empty";
                    } else {
                      _errorMessage = null;
                      Navigator.of(context).pushNamed(RoutePaths.homeScreen);
                      // Handle save action here
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Save',
                        style: GoogleFonts.openSans(color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
