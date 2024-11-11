import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/asset_paths.dart';

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
        color: Colors.pink.shade100,
        backgroundColor: Colors.white,
        items: <Widget>[
        SvgPicture.asset(Assetpaths.bottomNavAssets.call,height: 30,),
        SvgPicture.asset(Assetpaths.bottomNavAssets.chat,height: 30,),
        SvgPicture.asset(Assetpaths.bottomNavAssets.contacts,height: 30,),
        SvgPicture.asset(Assetpaths.bottomNavAssets.profile,height: 30,),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: Container(color: Colors.white ,height: 500,alignment: Alignment.center,child: Text("Page $page"),),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    Scaffold(
      body: Center(
        child: Text("calling"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("chatting"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Groups"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("profile"),
      ),
    ),
  ];
}
