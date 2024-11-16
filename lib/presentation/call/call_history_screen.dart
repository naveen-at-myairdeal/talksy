import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/domain/theme/app_theme.dart';

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({super.key});

  @override
  State<CallHistoryScreen> createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  bool isCallsAwailable = false;

  @override
  Widget build(BuildContext context) {
    return isCallsAwailable
        ? Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Calls",
                          style: AppTheme.displayLargePrimaryColor,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(RoutePaths.newCallScreenContactList);
                          },
                          icon: Icon(
                            Icons.add_circle_outlined,
                            color: AppTheme.primaryColor,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Contact, calls, chats..',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.group, color: Colors.purple),
                      title: Text('New Group Call'),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          buildCallTile(
                            context,
                            "Zap,ciok,Lii, anny",
                            "51:16 Mins",
                            "4",
                            "assets/group_image.png",
                          ),
                          buildCallTile(
                            context,
                            "Jack",
                            "10:19 Mins",
                            "4",
                            "assets/jack_image.png",
                            subtitleTime: "10:40 AM",
                          ),
                          buildCallTile(
                            context,
                            "Micky",
                            "Declined calls",
                            "1",
                            "assets/micky_image.png",
                            subtitleTime: "10:40 AM",
                            declined: true,
                          ),
                          buildCallTile(
                            context,
                            "XYZ Group",
                            "51:20 Mins",
                            "1",
                            "assets/xyz_group_image.png",
                            subtitleTime: "1:04 PM",
                            videoCall: true,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isCallsAwailable = false;
                                });
                              },
                              child: Text(
                                "Go to No history state",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Calls",
                        style: AppTheme.displayLargePrimaryColor,
                      ),
                      const Spacer(),
                       IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(RoutePaths.newCallScreenContactList);
                          },
                          icon: Icon(
                            Icons.add_circle_outlined,
                            color: AppTheme.primaryColor,
                            size: 30,
                          ),
                        )
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'To begin calling contacts with XYZ,\n',
                      style: AppTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'tap the ',
                        ),
                        TextSpan(
                          text: '"+"',
                          style: TextStyle(color: AppTheme.primaryColor),
                        ),
                        TextSpan(
                          text: ' icon at the top of the\nscreen to ',
                        ),
                        TextSpan(
                          text: '"New Call".',
                          style: TextStyle(color: AppTheme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                 ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isCallsAwailable = true;
                                });
                              },
                              child: Text(
                                "Go to  history state",
                                style: TextStyle(color: Colors.white),
                              )),
                  const Spacer(),
                ],
              ),
            )),
          );
  }
}

Widget buildCallTile(
  BuildContext context,
  String title,
  String subtitle,
  String count,
  String imagePath, {
  String? subtitleTime,
  bool declined = false,
  bool videoCall = false,
}) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTheme.bodyMedium),
                  Text("($count)", style: AppTheme.labelMediumGreyColor),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: AppTheme.labelMediumGreyColor,
                  ),
                  if (subtitleTime != null)
                    Text(
                      subtitleTime,
                      style: AppTheme.bodySmall,
                    ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Icon(
          declined
              ? Icons.call_end
              : videoCall
                  ? Icons.videocam
                  : Icons.call,
          color: declined ? Colors.red : Colors.purple,
        ),
      ],
    ),
  );
}
