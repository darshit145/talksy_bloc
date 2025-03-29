import 'package:flutter/material.dart';

import '../util/font_family.dart';

class MaterialButtonView extends StatelessWidget {
  final VoidCallback? callbackAction;
  final String text;
  final Color btnColor;
  final double borderRedius;
  const MaterialButtonView(
      {super.key,this.borderRedius=5,this.btnColor=Colors.black, this.callbackAction, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRedius)),
      color: btnColor,
      padding: EdgeInsets.all(0),
      onPressed: callbackAction,
      splashColor: Colors.grey,
      highlightColor: Colors.grey,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.robotoSimple,
            fontSize: 14), // White text for visibility
      ),
    );
  }
}
