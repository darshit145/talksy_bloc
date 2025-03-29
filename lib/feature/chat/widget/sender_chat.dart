import 'package:flutter/material.dart';

import '../../../util/color_const.dart';
import '../../../util/font_family.dart';

class SenderChat extends StatelessWidget {
  final String msg;
  final String time;
  const SenderChat({super.key, required this.msg,required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        margin: EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
            color: ColorConst.getBlack(context),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right:10),
              child: Text(
                msg,
                style: TextStyle(
                    color: ColorConst.getWhite(context),
                    fontSize: 14,
                    fontFamily: FontFamily.robotoSimple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 6,
              children: [
                // Icon(
                //   Icons.read_more,
                //   size: 10,
                //   color: ColorConst.getWhite(context),
                // ),
                Text(
                  time,
                  style: TextStyle(
                      color: ColorConst.getWhite(context),
                      fontSize: 8,
                      fontFamily: FontFamily.robotoSimple,
                      fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
