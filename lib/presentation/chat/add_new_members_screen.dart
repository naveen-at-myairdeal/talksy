import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/theme/app_theme.dart';

class AddMembersScreen extends StatefulWidget {
  @override
  _AddMembersScreenState createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  // Simulated list of users
  final List<Map<String, String>> users = [
    {'name': 'Jack', 'status': 'last seen a long time ago', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Rocky', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Monk', 'status': 'last seen a month ago', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Latish', 'status': 'last seen a year ago', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Manish', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Fazz', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Lipi', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Alex', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Ozia', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Queen', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Jack', 'status': 'last seen a long time ago', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Rocky', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Monk', 'status': 'last seen a month ago', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Latish', 'status': 'last seen a year ago', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Manish', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Fazz', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Lipi', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Alex', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
    {'name': 'Ozia', 'status': 'last seen recently', 'image': 'assets/images/placeholder/${generateRandomNumber() + 1}.png'},
  ];

  // Track selected users
  final List<Map<String, String>> selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(393, 852));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Icon(Icons.arrow_back, color: Colors.purple, size: 24.sp),
                  ),
                  Text(
                    "Add members",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                  InkWell(
                    onTap: () {
                      print(selectedUsers);
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "${selectedUsers.length}/${users.length}",
                    style: AppTheme.bodyMediumGreyColor,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                // height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Icon(Icons.search, color: Colors.grey, size: 24.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 19.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final isSelected = selectedUsers.contains(user);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedUsers.remove(user);
                          } else {
                            selectedUsers.add(user);
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(user['image']!), // Replace with actual image paths
                              radius: 24.r,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user['name']!,
                                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    user['status']!,
                                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Outer pink circle for selected state
                                if (isSelected)
                                  Container(
                                    width: 24.r,
                                    height: 24.r,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.purple,
                                        width: 1.5.w,
                                      ),
                                    ),
                                  ),
                                // Inner circle
                                Container(
                                  width: isSelected ? 16.r : 24.r,
                                  height: isSelected ? 16.r : 24.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected ? Colors.purple : Colors.black,
                                      width: 1.w,
                                    ),
                                    color: isSelected ? Colors.purple : Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(6); // Generates a number from 0 to 5.
}
