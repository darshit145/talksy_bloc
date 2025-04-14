import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy_app/common/cash_image.dart';
import 'package:talksy_app/common/common_obj.dart';
import 'package:talksy_app/feature/chat/controller/chat_bloc.dart';
import 'package:talksy_app/feature/chat/domain/model/user_message.dart';
import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';
import '../../auth/widget/custom_text_field.dart';
import '../../home/domain/model/list_user.dart';
import '../../remoteuser/screen/remote_user.dart';
import '../domain/model/database_helper.dart';
import '../widget/reciver_chat.dart';
import '../widget/sender_chat.dart';

class ChatPage extends StatelessWidget {
  final List chatList = [];
  final String reciverTocken;
  final String cloudUsername;
  final SharedPreferences sp;
  // final String sender;
  final String cloudUserPhoto;
  final User cloudUser;

  ChatPage(
      {super.key,
      required this.cloudUser,
      required this.cloudUserPhoto,
      // required this.sender,
      required this.sp,
      required this.cloudUsername,
      required this.reciverTocken});
  final DateBaseHelper databaseHelper = DateBaseHelper.instance;
  final TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Future.microtask(
    //   () {
    //     databaseHelper2.fetchAndUpdateStream(tableName);
    //   },
    // );
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //   make the Api call
      //     //0 Means the Cloud user is Offline and Have to Make the Api call  --- API Call
      //     //1 means the user is online and have the connect to the web socket
      //     //2 means the cloud  user runn the app in the background and have to sh0ow the Notification
      //     if(true){
      //       Message message=Message(id: "id", msg:" msg", from:" from", to:" to", dateSendingTime:" dateSendingTime", readStatus:1, day:" day", v:1);
      //       // databaseHelper.insertRecent(message);
      //       databaseHelper.getRecent();
      //       context.read<ChatBloc>().add(
      //         GetAllMessage()
      //       );
      //       return;
      //     }
      //     if (cloudUser.uActivestatus == 0) {
      //       context.read<ChatBloc>().add(
      //         SendMessage(
      //           dateSendingTime: "2:18",
      //           day: "Sunday",
      //           from: CommonObj.loginModel!.newUser.id,
      //           msg: "This is the ! Message from the Darshit 7",
      //           to: cloudUser.id,
      //         ),
      //       );
      //       return;
      //     }
      //
      //   },
      // ),
      backgroundColor: Color(0xFFeff1f2),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: ColorConst.getWhite(context),
        automaticallyImplyLeading: false,
        title: SafeArea(
          child: Text(
            cloudUsername,
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
                // SvgPicture.asset(
                //   Images.callIcon,
                //   height: 20,
                //   width: 20,
                // ),
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
                    child:
                        CashImage(circleRedius: 17, getImage: cloudUserPhoto))
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
            // Expanded(
            //   child: GestureDetector(
            //       onTap: () {
            //         FocusScope.of(context).unfocus();
            //       },
            //       child: StreamBuilder(
            //         stream: databaseHelper2.topicStreamController.stream,
            //         builder: (context, snapshot) {
            //           if (snapshot.hasData) {
            //             print(snapshot.data?.length);
            //             return ListView.separated(
            //               separatorBuilder: (context, index) {
            //                 return SizedBox(
            //                   height: 5,
            //                 );
            //               },
            //               itemBuilder: (context, index) {
            //                 if (snapshot.data![index].senderId==sender) {
            //                   return ReciverChat(
            //                     msg: snapshot.data![index].message,
            //                     time: snapshot.data![index].time,
            //
            //                   );
            //                 }
            //                 return SenderChat(
            //                   msg: snapshot.data![index].message,
            //                   time: snapshot.data![index].time,
            //                 );
            //               },
            //               itemCount: snapshot.data!.length,
            //             );
            //           }
            //           return Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         },
            //       ),
            //   ),
            // ),
            Expanded(
                child: BlocBuilder<ChatBloc,ChatState>(builder: (context, state) {
                  if(state.userMessage==null){
                    return SizedBox();
                  }else if(state.userMessage!.messages.isEmpty){
                    return SizedBox();
                  }
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      if (state.userMessage!.messages[index].from==CommonObj.loginModel!.newUser.id) {
                        return SenderChat(
                            msg: state.userMessage!.messages[index].msg, time: " time");

                      }
                      return ReciverChat(
                          senderPhotoUrl: cloudUserPhoto,
                          msg: state.userMessage!.messages[index].msg,
                          time: " time");
                    },
                    itemCount: state.userMessage!.messages.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 6,
                    ),
                  );
                },)
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                        child: MyTextField(
                            obscureText: false,
                            hintText: "Send",
                            controller: textEditingController)),
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
                              if(textEditingController.text.isEmpty){
                                return;
                              }

                              if (cloudUser.uActivestatus == 0) {
                                context.read<ChatBloc>().add(
                                  SendMessage(
                                    dateSendingTime: "2:18",
                                    day: "Sunday",
                                    from: CommonObj.loginModel!.newUser.id,
                                    msg:textEditingController.text.toString().trim(),
                                    to: cloudUser.id,
                                  ),
                                );
                                textEditingController.clear();
                                return;
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(Images.sendIcon,
                                  color: ColorConst.getWhite(context)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
