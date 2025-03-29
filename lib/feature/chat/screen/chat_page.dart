import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constantSP.dart';
import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';
import '../../auth/screen/login_screen.dart';
import '../../auth/widget/custom_text_field.dart';
import '../../remoteuser/screen/remote_user.dart';
import '../domain/model/database_helper.dart';
import '../widget/reciver_chat.dart';
import '../widget/sender_chat.dart';

class ChatPage extends StatelessWidget {
  final List chatList = [];
  final String reciverTocken;
  final String tableName;
  final SharedPreferences sp;
  final String sender;

  ChatPage({super.key,required  this.sender,required this.sp, required this.tableName,required this.reciverTocken});
  final DatabaseHelper2 databaseHelper2=DatabaseHelper2.instance;
  @override
  Widget build(BuildContext context) {
    Future.microtask(
      () {
        databaseHelper2.fetchAndUpdateStream(tableName);
      },
    );
    return Scaffold(
      backgroundColor: ColorConst.getWhite(context),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: ColorConst.getWhite(context),
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Text(
            "ChatApp",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    ///SEND notification to usser 2
                    ///and setUP firebase
                    ///navigate to other screen
                    ///request permition

                    Navigator.pushNamed(
                        context, StringConst.routToVideoCallScreen);
                  },
                  child: SvgPicture.asset(
                    Images.videoCallIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
                SvgPicture.asset(
                  Images.callIcon,
                  height: 20,
                  width: 20,
                ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RemoteUser(),
                        ));
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFD1D5DB),
                    radius: 17,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          spacing: 3,
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: StreamBuilder(
                    stream: databaseHelper2.topicStreamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data?.length);
                        return ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                          itemBuilder: (context, index) {
                            if (snapshot.data![index].senderId==sender) {
                              return ReciverChat(
                                msg: snapshot.data![index].message,
                                time: snapshot.data![index].time,

                              );
                            }
                            return SenderChat(
                              msg: snapshot.data![index].message,
                              time: snapshot.data![index].time,
                            );
                          },
                          itemCount: snapshot.data!.length,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
              ),
            ),
            SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:Row(
                    spacing: 10,
                    children: [
                      Expanded(
                          child: MyTextField(
                              obscureText: false,
                              hintText: "Send",
                              controller:TextEditingController())),
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConst.getBlack(context),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              highlightColor: Colors.grey,
                              onTap: () {
                                ///send the notification to the user b


                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(Images.sendIcon,
                                    color: ColorConst.getWhite(context)),
                              ),
                            ),
                          )),
                    ],
                  ),),
            )
          ],
        ),
      ),
    );
  }
}
