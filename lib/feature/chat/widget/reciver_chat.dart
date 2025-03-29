import 'package:flutter/material.dart';

import '../../../util/font_family.dart';

class ReciverChat extends StatelessWidget {
  final String msg;
  final String time;
  const ReciverChat({super.key, required this.msg,required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xFFD1D5DB),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                msg,
                softWrap: true,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: FontFamily.robotoSimple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(time,style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: FontFamily.robotoSimple,
                fontWeight: FontWeight.w300),),
          ],
        ),
      ),
    );
  }
}
