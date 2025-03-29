import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/color_const.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: ColorConst.getBlack(context),
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            backgroundImage:
                            AssetImage(Images.onboarding_3),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: ColorConst.getBlack(context),
                            child: Center(
                              child: Icon(Icons.add,size: 15,weight: 10,color: ColorConst.getWhite(context),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        "Your Story",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.robotoSimple,
                            color: ColorConst.getBlack(context)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFD1D5DB),
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(Images.onboarding_3),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      "M.R.Darshit Fachara",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.robotoSimple,
                          color: ColorConst.getBlack(context)),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 15,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
