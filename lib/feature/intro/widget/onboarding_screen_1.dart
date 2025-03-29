import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/material_button.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';

class OnboardingScreen1 extends StatelessWidget {
  final PageController pageController;
  const OnboardingScreen1({super.key,required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConst.appName,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamily.robotoSimple,
                    color: Colors.black),
              ),
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Images.onboarding_1),
                        fit: BoxFit.fill)),
              ),
              Text(
                "Connect Instantly",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: FontFamily.roboto),
              ),
              Text(
                "Experience seamless communication with real-time messaging, crystal-clear voice calls, and dynamic group chats.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, color: Colors.black, fontFamily: null),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getElemant(imgPath: Images.messagingIcon, title: "Messaging"),
                  getElemant(imgPath: Images.callIcon, title: "Voice Calls"),
                  getElemant(imgPath: Images.groupChatIcon, title: "Group Chat"),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.black,
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.grey,
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButtonView(text: "Next",callbackAction: () {
                pageController.nextPage(duration: Duration(milliseconds: 400), curve:Curves.easeIn);

              },)
            ],
          ),
        ),
      ),
    );
  }

  Widget getElemant({required String imgPath, required String title}) {
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          imgPath,
          height: 36,
          width: 36,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.roboto),
        )
      ],
    );
  }
}
