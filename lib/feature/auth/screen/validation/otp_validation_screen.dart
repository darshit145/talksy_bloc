import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../common/material_button.dart';
import '../../../../common/universal_appbar_view.dart';
import '../../../../util/string_const.dart';

class OtpValidationScreen extends StatelessWidget {
  const OtpValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: GestureDetector(onTap: () {
        FocusScope.of(context).unfocus();
      },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: UniversalAppbarView.getAppBar(
                toolbarHeight: 100,
                title: "OTP Verification",
                subTitle: "Enter verification code sent to\n+1 234-567-8900",
                subTitleColor: Color(0xFF22C55E)),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
              child: Column(
                spacing: 20,
                children: [
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    animationDuration: Duration.zero,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 48,
                      fieldWidth: 48,
                      activeFillColor: Colors.white,
                      activeColor: Colors.black, // Border color
                      selectedColor: const Color(0xFFD1D5DB),
                      inactiveColor: const Color(0xFFD1D5DB),
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                    ),
                    enableActiveFill: true,
                    onChanged: (value) {
                      print(value);
                    },
                    onCompleted: (value) {
                      print("OTP entered: $value");
                    },
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn't receive code? ",
                        ),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {

                              print("object");
                              },
                            text: "Resend",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 53,
                    width: double.infinity,
                    child: MaterialButtonView(
                      text: "Verify",
                      callbackAction: () {
                        Navigator.pushNamed(
                            context, StringConst.routHomePage);
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
