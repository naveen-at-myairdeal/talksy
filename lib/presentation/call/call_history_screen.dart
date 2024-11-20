import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/domain/theme/app_theme.dart';

import '../../domain/constants/asset_paths.dart';

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
                      height: 15.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Contact, calls, chats..',
                        hintStyle: AppTheme.bodyMediumGreyColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.group, color: Colors.purple),
                              SizedBox(width: 16), 
                              Text('New Group Call', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          buildCallTile(context, "Zap,ciok,Lii, anny", "51:16 Mins", "4", PlcaeHolders.one, status: CallStatus.videoMissed),
                          buildCallTile(context, "Jack", "10:19 Mins", "4", PlcaeHolders.two, subtitleTime: "10:40 AM", status: CallStatus.callOutGoing),
                          buildCallTile(context, "Micky", "Declined calls", "1", PlcaeHolders.three, subtitleTime: "10:40 AM", status: CallStatus.callMissed),
                          buildCallTile(context, "XYZ Group", "51:20 Mins", "1", PlcaeHolders.four, subtitleTime: "1:04 PM", status: CallStatus.videoIncomming),
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
                  SizedBox(
                    height: 30.h,
                  ),
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
  required CallStatus status,
}) {
  return Container(
    padding: EdgeInsets.all(8),
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
                  Text(title, style: AppTheme.bodySmall),
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
        callStatusIconFn(status)
      ],
    ),
  );
}

enum CallStatus {
  callIncomming,
  callOutGoing,
  callMissed,
  videoIncomming,

  videoMissed,
}

callStatusIconFn(CallStatus callStatus) {
  switch (callStatus) {
    case CallStatus.callIncomming:
      return Icon(
        Icons.phone_callback_rounded,
        color: Colors.green,
      );

    case CallStatus.callOutGoing:
      return Icon(
        Icons.call,
        color: Colors.green,
      );

    case CallStatus.callMissed:
      return Icon(
        Icons.phone_missed_rounded,
        color: Colors.red,
      );

    case CallStatus.videoIncomming:
      return Icon(
        Icons.videocam,
        color: Colors.green,
      );

    case CallStatus.videoMissed:
      return Icon(
        Icons.missed_video_call_sharp,
        color: Colors.red,
      );
  }
}
