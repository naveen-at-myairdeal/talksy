import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/theme/app_theme.dart';
import 'package:talksy/presentation/call/call_history_screen.dart';

import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar( 
        color: AppTheme.accentColor,
        backgroundColor: Colors.white,
        items: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(Assetpaths.bottomNavAssets.call,height: 20,),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(Assetpaths.bottomNavAssets.chat,height: 20,),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(Assetpaths.bottomNavAssets.contacts,height: 20,),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(Assetpaths.bottomNavAssets.profile,height: 20,),
        ),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: _getScreen(page),
    );
  }
}
Widget _getScreen(int index) {
  switch (index) {
    case 0:
      return CallHistoryScreen();
    case 1:
      return Scaffold(
        body: Center(
          child: Text("Chatting"),
        ),
      );
    case 2:
      return Scaffold(
        body: Center(
          child: Text("Groups"),
        ),
      );
    case 3:
      return ProfilePage();
    default:
      return Scaffold(
        body: Center(
          child: Text("Unknown screen"),
        ),
      );
  }
}

