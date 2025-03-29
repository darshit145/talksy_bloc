import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/material_button.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';

class OnboardingScreen2 extends StatelessWidget {
  final PageController pageController;

  const OnboardingScreen2({super.key,required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.onboarding_2),
                          fit: BoxFit.fill)),
                ),
                Text(
                  "Stay Connected Globally",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: FontFamily.roboto),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(1, 1)
                      )
                    ]
                  ),
                  // height: 157,
                  width: double.infinity,
                  child: getElemant(imgPath: Images.energyIcon, title: "Instant Connectivity", title_2:"Lightning-fast messaging across the \nglobe")
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(1, 1)
                      )
                    ]
                  ),
                  // height: 157,
                  width: double.infinity,
                  child: getElemant(imgPath: Images.earthIcon, title: "Free International Messaging", title_2:"No borders, no fees, just pure \ncommunication")
                ),

                SizedBox(
                  height: 10,
                ),
            
                SizedBox(
                  height: 20,
                ),
                Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.black,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButtonView(text: "Next",callbackAction: () {
                  pageController.nextPage(duration: Duration(milliseconds: 400), curve:Curves.easeIn);
            
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getElemant({required String imgPath, required String title,required String title_2}) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          imgPath,
          height: 24,
          width: 24,
        ),
        Text(title,style: TextStyle(fontFamily: FontFamily.roboto,fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black),),
        Text(title_2,style: TextStyle(fontFamily: FontFamily.roboto,fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black45),)
      ],
    );
  }
}
