import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy_app/common/cash_image.dart';
import 'package:talksy_app/feature/chat/domain/model/user_message.dart';
import '../../../get_it.dart';
import '../../../util/app_constantSP.dart';
import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../chat/controller/chat_bloc.dart';
import '../../chat/domain/model/database_helper.dart';
import '../../chat/screen/chat_page.dart';
import '../domain/model/list_user.dart';

class CustomTile extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String photoUrl;
  final SharedPreferences sp;
  final String notificationTck;
  final User cloudUser;
  const CustomTile(
      {super.key,
      required this.sp,
      required this.notificationTck,
      required this.photoUrl,
      required this.titleText,
      required this.cloudUser,
      required this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: ColorConst.getDeviderColor(context),
        onTap: ()async {
          // String email = sp.getString(AppConstSP.uaerEmail) ?? "";
          //i haVE  TO fatch the records from the Database
          // final DateBaseHelper databaseHelper = DateBaseHelper.instance;
          // List<Message> messages=await databaseHelper.getRecent();
          // messages.removeWhere((element) {
          //   if(element.from==cloudUser.id||element.to==cloudUser.id){
          //     return false;
          //   }
          //   return true;
          // },);
          // print(messages.length);
          // print(messages[0].msg);
          //i have to Emit the Chats
          context.read<ChatBloc>().add(GetOnlySelectedMessage(id: cloudUser.id));

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  sp: it(),
                  cloudUserPhoto: photoUrl,
                  cloudUser: cloudUser,
                  // sender: email.split('@')[0],
                  cloudUsername: titleText,
                  // tableName: generateChatTableName(email, subTitleText),
                  // tableName: generateChatTableName("dfachara8", "dfachara8"),
                  reciverTocken: notificationTck,
                ),
              ));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          child: Row(
            spacing: 10,
            children: [
              CashImage(circleRedius: 24, getImage: photoUrl),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        child: Text(
                          titleText,
                          style: TextStyle(
                              color: ColorConst.getBlack(context),
                              fontFamily: FontFamily.robotoSimple,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: ColorConst.getBlack(context),
                        child: FittedBox(
                            child: Center(
                                child: Text(
                          "0",
                          style: TextStyle(color: ColorConst.getWhite(context)),
                        ))),
                      ),
                      Text(
                        "Yesterday",
                        style: TextStyle(
                            color: ColorConst.getBlack(context),
                            fontFamily: FontFamily.robotoSimple,
                            fontSize: 13),
                      )
                    ],
                  ),
                  Text(
                    subTitleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ColorConst.getBlack(context),
                        fontFamily: FontFamily.robotoSimple,
                        fontSize: 13),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// String generateChatTableName(String userId1, String userId2) {
//   userId1 = userId1.split('@')[0];
//   userId2 = userId2.split('@')[0];
//   List<String> sortedIds = [userId1, userId2]..sort();
//   return "${sortedIds[0]}_${sortedIds[1]}";
// }
