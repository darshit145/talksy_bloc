import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/material_button.dart';
import '../../../common/universal_appbar_view.dart';
import '../../../util/font_family.dart';
import '../../../util/string_const.dart';
import '../widget/text_field_view.dart';

class MobileAuthScreen extends StatelessWidget {
  const MobileAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {

      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: UniversalAppbarView.getAppBar(
              title: "Sign In",
              subTitle: "Enter your phone number",
              subTitleColor: Color(0xFF22C55E)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 20,
              children: [
                TextFieldView(
                  title: "Mobile No",
                  hintText: "Phone number",
                  controller: TextEditingController(),
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 2, color: Colors.grey)),
                      child: CountryCodePicker(
                        flagWidth: 35,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        hideMainText: true,
                        onChanged: (country) {
                          print(country);
                        },
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: ['+1', '+91'],
                        showFlag: true,
                        alignLeft: true,
                      ),
                    ),
                  ),
                ),
                Text("We'll send you a verification code",
                  style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      fontFamily: FontFamily.robotoSimple,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: 53,
                  width: double.infinity,
                  child: MaterialButtonView(
                    text: "Continue",
                    callbackAction: () {
                      Navigator.pushReplacementNamed(context, StringConst.routOtpValidationScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
