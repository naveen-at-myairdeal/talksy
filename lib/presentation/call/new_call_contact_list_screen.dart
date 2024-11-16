// import 'package:contacts_service/contacts_service.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/theme/app_theme.dart';
import '../../infrastructure/contacts_provider.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsProvider _contactsProvider = ContactsProvider();
  var _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final contacts = await _contactsProvider.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Column(
                    children: [
          
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          children: [
                            // Top Section with Back and Close buttons and Title
                            Container(
                              padding: const EdgeInsets.symmetric( vertical: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Back Arrow
                                  GestureDetector(
                                    onTap: () {
                                      // Go back action
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(Icons.arrow_back, color: Colors.purple),
                                  ),
                        
                                  // Title
                                  Text(
                                    'New call',
                                    style: AppTheme.displayLargePrimaryColor
                                  ),
                        
                                  // Close Icon
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                        
                                    },
                                    child: Icon(Icons.close, color: AppTheme.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                        
                            // Search Bar
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300],
                                hintText: 'Search name or number',
                                prefixIcon: Icon(Icons.search, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                        
                            SizedBox(height: 20),
                        
                            // New Group Call Button
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.group, color:  AppTheme.primaryColor),
                                title: Text(
                                  'New Group Call',
                                  style: AppTheme.titleMediumPrimaryColor,
                                ),
                                trailing: Icon(Icons.arrow_forward, color: Colors.purple),
                                onTap: () {
                                  // New Group Call action
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 15.h,color: Colors.white,),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _contacts.length,
                          itemBuilder: (context, index) {
                            final contact = _contacts[index];
                            return Container(
                              padding: EdgeInsets.only(left: 12,right: 12),
                              margin: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: generateLightColorAccent(), borderRadius: BorderRadius.circular(4)),
                                    child: Text("NZ"),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width:190.w ,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          contact["name"] ?? "",
                                          style: AppTheme.bodyMediumPrimaryColor,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          contact["phone"] ?? "",
                                          style: AppTheme.labelMediumGreyColor,
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.all(2),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: AppTheme.primaryColor,
                                    ),
                                    child: Icon(
                                      Icons.call_outlined,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppTheme.primaryColor),
                                    child: Icon(
                                      Icons.video_call,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Color generateLightColorAccent() {
  // Define the ranges for hue, saturation, and lightness
  final hueRange = [0, 360];
  final saturationRange = [30, 70];
  final lightnessRange = [60, 90];

  // Generate random values within the given ranges
  final hue = Random().nextInt(hueRange[1] - hueRange[0] + 1) + hueRange[0];
  final saturation = Random().nextInt(saturationRange[1] - saturationRange[0] + 1) + saturationRange[0];
  final lightness = Random().nextInt(lightnessRange[1] - lightnessRange[0] + 1) + lightnessRange[0];

  // Convert the HSL values to a Color object
  return HSLColor.fromAHSL(1.0, hue.toDouble(), saturation / 100.0, lightness / 100.0).toColor();
}
