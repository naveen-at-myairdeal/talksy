import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/constants/asset_paths.dart';
import '../../domain/theme/app_theme.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 15.h ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 15.h), // Space for status bar
              Row(
                children: [
                  Text(
                    "Chats",
                    style: GoogleFonts.openSans(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.normal,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(RoutePaths.newCallScreenContactList);
                    },
                    icon: Icon(
                      Icons.add_circle_outlined,
                      color: AppTheme.primaryColor,
                      size: 28,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h),
              // Search bar with TextFormField
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search contacts, calls, chats...",
                  hintStyle: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.search, size: 24.sp, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.group, color: AppTheme.primaryColor, size: 28.sp),
                  SizedBox(width: 8.w),
                  Text(
                    "New Group Chat",
                    style: GoogleFonts.openSans(
                      fontSize: 16.sp,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView(
                  children: [
                    chatTile(
                      name: "Jack (4)",
                      message: "had fooooddd?",
                      time: "1:04 PM",
                      imagePath:PlcaeHolders.one,
                      statusIcon: Icons.done_all,
                      statusColor: AppTheme.primaryColor,
                    ),
                    chatTile(
                      name: "Rahim (4)",
                      message: "നന്നായി ഉറങ്ങി, ശരീരം, പിന്നെ കാനാം",
                      time: "1:04 PM",
                      imagePath: PlcaeHolders.two,
                      statusIcon: Icons.done_all,
                      statusColor: Colors.grey,
                    ),
                    chatTile(
                      name: "Esmil (4)",
                      message: "嘿，朋友！！",
                      time: "1:04 PM",
                      imagePath: PlcaeHolders.three,
                      statusIcon: Icons.done,
                      statusColor: Colors.grey,
                    ),
                    chatTile(
                      name: "Koish",
                      message: "صباح الخير",
                      time: "1:04 PM",
                      imagePath: PlcaeHolders.five,
                      statusIcon: Icons.done,
                      statusColor: Colors.grey,
                    ),
                    chatTile(
                      name: "Sameer",
                      message: "योंओ",
                      time: "1:04 PM",
                      imagePath: PlcaeHolders.four,
                      statusIcon: Icons.done_all,
                      statusColor: AppTheme.primaryColor,
                    ),
                    chatTile(
                      name: "XYZ Group",
                      message: "योंओ",
                      time: "1:04 PM",
                      imagePath: PlcaeHolders.six,
                      statusIcon: Icons.done_all,
                      statusColor: Colors.grey,
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

  Widget chatTile({
    required String name,
    required String message,
    required String time,
    required String imagePath,
    required IconData statusIcon,
    required Color statusColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.openSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(statusIcon, size: 16.sp, color: statusColor),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        message,
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            time,
            style: GoogleFonts.openSans(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
