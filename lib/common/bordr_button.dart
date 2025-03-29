import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/font_family.dart';
import '../util/images.dart';

class BordrButton extends StatelessWidget {
  final Widget btnChild;
  final Color borderColor;
  final VoidCallback? onPressed;
  const BordrButton({required this.btnChild,this.onPressed,this.borderColor=Colors.black,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2)),
      child: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set border radius here
          ),
        ),
        onPressed: onPressed,
        child: btnChild
      ),
    );
  }

  static Widget googleLoginButton(){
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Images.googleIcon,
          width: 20,
          height: 20,
        ),
        Text(
          "Continue with Google",
          style: TextStyle(
            fontFamily: FontFamily.robotoSimple,
            color: Color(0xFF374151),
          ),
        )
      ],
    );
  }
}
