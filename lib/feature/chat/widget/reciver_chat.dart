import 'package:flutter/material.dart';
import 'package:talksy_app/common/cash_image.dart';

import '../../../util/font_family.dart';

class ReciverChat extends StatelessWidget {
  final String msg;
  final String senderPhotoUrl;
  final String time;
  const ReciverChat({super.key,required this.senderPhotoUrl, required this.msg, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CashImage(circleRedius: 20, getImage:senderPhotoUrl),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Container(
              // height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child:  Text(
                msg,
                softWrap: true,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: FontFamily.robotoSimple,
                    fontWeight: FontWeight.w500),
              ),
              // child: Column(
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   // crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //
              //     // Text(time,style: TextStyle(
              //     //     color: Colors.black,
              //     //     fontSize: 10,
              //     //     fontFamily: FontFamily.robotoSimple,
              //     //     fontWeight: FontWeight.w300),),
              //   ],
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
