import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:http/http.dart" as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:talksy_app/get_it.dart';

import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/string_const.dart';
import '../../userprofile/screen/user_profile.dart';
import '../widget/custom_tile.dart';
import '../widget/story_view.dart';


class HomePage extends StatelessWidget {
 final FocusNode focusNode=FocusNode();
 TextEditingController textEditingController=TextEditingController();

    HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // focusNode.unfocus();
    return GestureDetector(
      onTap: () {
        textEditingController.clear();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
          actions: [
            Text(
              "Online",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.robotoSimple,
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFD1D5DB),
                  radius: 17,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 5,
              children: [
                CupertinoSearchTextField(
                  focusNode: focusNode,
                  controller: textEditingController,
                  onChanged: (val) {
                  },
                  itemColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                SizedBox(height: 5,),
                StoryView(),

                ListView.separated(
                  padding: EdgeInsets.all(0),

                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 2,
                      child: Divider(
                        color: ColorConst.getDeviderColor(context),
                        thickness: 1,
                      ),
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return CustomTile(
                      sp: it(),
                      notificationTck: "value.listOfUsers.result[index].uMessaging",
                      photoUrl: "value.listOfUsers.result[index].uPhoto",
                      subTitleText:"value.listOfUsers.result[index].uEmail" ,
                      titleText: "value.listOfUsers.result[index].uName",
                    );
                  },itemCount: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

