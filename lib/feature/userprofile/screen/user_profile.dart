import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';

void logOutAction() {
  CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    title: Text("Logout",
      style: TextStyle(
        fontFamily: FontFamily.schyler,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text("Are you sure you want to logout?"),
    ),
    actions: [
      MaterialButton(
        onPressed: () {
          Navigator.pop(Get.context!);
        },
        child: Text(
          "Cancel",
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.robotoSimple),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(Get.context!, StringConst.routAuthScreen, (route) => false);
        },
        child: Text(
          "Exit",
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.robotoSimple),
        ),
      ),

    ],
  );
  showCupertinoDialog(
    context: Get.context!,
    builder: (context) => cupertinoAlertDialog,
  );
}
///dfachara7
///dfachara10

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  final List<ProfileModel> profileModel = [
    ProfileModel(title: "Personal Info", imagePath: Images.personIcon),
    ProfileModel(title: "Notifications", imagePath: Images.notificationIcon),
    ProfileModel(title: "Privacy", imagePath: Images.lockIcon),
    ProfileModel(title: "Appearance", imagePath: Images.colorPalletIcon),
    ProfileModel(title: "Help & Support", imagePath: Images.qnaIcon),
    ProfileModel(
        title: "Logout",
        voidCallbackActio: logOutAction,
        imagePath: Images.logoutIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.getWhite(context),
      appBar: AppBar(
        backgroundColor: ColorConst.getWhite(context),
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: SafeArea(
          child: Text(
            StringConst.appName,
            style: TextStyle(
                fontFamily: FontFamily.schyler,
                color: ColorConst.getBlack(context),
                fontSize: 20),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 10),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 43,
                backgroundColor: ColorConst.getBlack(context),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF4B5563),
                ),
              ),
              Text(
                "Alex Johnson",
                style: TextStyle(
                    fontSize: 20,
                    color: ColorConst.getBlack(context),
                    fontFamily: FontFamily.robotoSimple,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Product Designer",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorConst.getSecondryWhite(context),
                    fontFamily: FontFamily.robotoSimple,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(
              height: 2,
              child: Divider(
                color: ColorConst.getDeviderColor(context),
                thickness: 1,
              ),
            ),
            itemCount: profileModel.length,
            itemBuilder: (context, index) => Container(
              height: 50,
              child: ListTile(
                onTap: profileModel[index].voidCallbackActio,
                trailing: SvgPicture.string(Images.arrowRight),
                title: Text(
                  profileModel[index].title,
                  style: TextStyle(
                      fontFamily: FontFamily.robotoSimple,
                      fontSize: 14,
                      color: profileModel.length == index + 1
                          ? Colors.red
                          : ColorConst.getBlack(context),
                      fontWeight: FontWeight.w600),
                ),
                horizontalTitleGap: 10,
                leading: SvgPicture.asset(
                  profileModel[index].imagePath,
                  height: 16,
                  color: profileModel.length == index + 1
                      ? Colors.red
                      : ColorConst.getBlack(context),
                ),
              ),
            ),
          ),
          SizedBox()
        ],
      ),
    );
  }
}

class ProfileModel {
  String title;
  String imagePath;
  GestureTapCallback? voidCallbackActio;
  ProfileModel(
      {required this.title, this.voidCallbackActio, required this.imagePath});
}
