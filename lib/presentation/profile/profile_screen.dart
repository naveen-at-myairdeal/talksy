import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.only(left: 18.0, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: AppTheme.displayLargePrimaryColor,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),

                            // shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/profile/profile_pic.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 28.0),
                              Text('Bhuvan', style: AppTheme.displaySmallPrimaryColor),
                              Text(
                                'Hey there!!',
                                style: AppTheme.labelLargeGreyColor,
                              ),
                              SizedBox(height: 28.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0.h),
                    _buildMenuItem(
                      icon: Assetpaths.profile.account,
                      title: 'Account',
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 8,
                color: Colors.white,
              ),
              Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Assetpaths.profile.notification,
                      title: 'Notifications',
                    ),
                    _buildMenuItem(
                      icon: Assetpaths.profile.callChat,
                      title: 'Calls & chats',
                    ),
                    _buildMenuItem(
                      icon: Assetpaths.profile.saved,
                      title: 'Saved Message',
                    ),
                    _buildMenuItem(
                      icon: Assetpaths.profile.usage,
                      title: 'Usage',
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 8,
                color: Colors.white,
              ),
              Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Assetpaths.profile.contacts,
                      title: 'Contact Us',
                    ),
                    _buildMenuItem(
                      icon: Assetpaths.profile.about,
                      title: 'About',
                    ),
                    _buildMenuItem(
                      icon: Assetpaths.profile.terms,
                      title: 'Terms & Policy',
                    ),
                    _buildMenuItem(
                      icon: Assetpaths.profile.logout,
                      title: 'LogOut',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMenuItem({
    required String icon,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 16.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
