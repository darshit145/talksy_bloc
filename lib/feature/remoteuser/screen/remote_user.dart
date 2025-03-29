import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';


class RemoteUser extends StatelessWidget {
  const RemoteUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.getWhite(context),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sarah Parker",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.schyler),
              ),
              Text(
                "Online",
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.robotoSimple),
              ),
              CircleAvatar(
                radius: 53,
                backgroundColor: ColorConst.getBlack(context),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    "UI/UX Designer",
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorConst.getSecondryWhite(context),
                        fontFamily: FontFamily.robotoSimple),
                  ),
                  Text(
                    "San Francisco, CA",
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorConst.getSecondryWhite(context),
                        fontFamily: FontFamily.robotoSimple),
                  ),
                  Text(
                    "+1 (555) 123-4567",
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorConst.getSecondryWhite(context),
                        fontFamily: FontFamily.robotoSimple),
                  ),
                ],
              ),
              Row(
                spacing: 10,
                 children: [
                   Expanded(child: SizedBox()),
                  getCustomColumn(Images.callIcon,context, "Call"),
                  getCustomColumn(Images.videoCallIcon,context, "Video"),
                  getCustomColumn(Images.messagingIcon,context, "Message"),
                   Expanded(child: SizedBox()),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCustomColumn(String imagePath, BuildContext context,String text) {
    return Expanded(
      child: Column(
        children: [SvgPicture.asset(imagePath,width: 20,), Text(text,
          style: TextStyle(
            fontSize: 12,
            fontFamily: FontFamily.robotoSimple,
            fontWeight: FontWeight.w500,
            color: ColorConst.getBlack(context),
      
          ),
        )],
      ),
    );
  }
}
