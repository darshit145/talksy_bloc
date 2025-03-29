import 'package:flutter/material.dart';

import '../util/font_family.dart';

class UniversalAppbarView extends StatelessWidget {
  final String title;
  final String? subTitle;

  const UniversalAppbarView({super.key,required this.title,required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: SafeArea(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: FontFamily.schyler),
            ),
            Text(
              "Choose how you want to continue",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: FontFamily.roboto),
            )
          ],
        ),
      ),
    );
  }
 static AppBar getAppBar({required String title,required String? subTitle,Color subTitleColor=Colors.black,double? toolbarHeight}){
    return AppBar(
      shape: null,
      forceMaterialTransparency: true,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      elevation: 0,
      bottom: PreferredSize(preferredSize: Size(double.infinity, 10), child:Divider(
        color: Colors.grey,
        thickness: 1,
      )),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: SafeArea(
        child: Column(
          spacing: 3,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: FontFamily.schyler),
            ),
            subTitle!=null?
                Text(
              subTitle,
              style: TextStyle(
                  fontSize: 14,
                  color: subTitleColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.robotoSimple),
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}
