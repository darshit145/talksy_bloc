import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/bordr_button.dart';
import '../../../common/material_button.dart';
import '../../../common/universal_appbar_view.dart';
import '../../../util/string_const.dart';
import '../widget/text_field_view.dart';

class LoginScreenMail extends StatelessWidget {
  const LoginScreenMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UniversalAppbarView.getAppBar(
          title: "Login", subTitle: "Welcome back! Please enter your details"),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child:  SingleChildScrollView(
              child: Column(
                spacing: 25,
                children: [
                  TextFieldView(
                    title: "Email",
                    hintText: "Enter your email",
                    controller: TextEditingController(),
                  ),
                  TextFieldView(
                    title: "Password",
                    hintText: "Enter your password",
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: SafeArea(
                      child: Column(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 53,
                            width: double.infinity,
                            child: MaterialButtonView(
                              text: "Sign in",
                              callbackAction: ()  {

                              },
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              Text(
                                "Or continue with",
                                style: TextStyle(color: Color(0xFF6B7280)),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          BordrButton(
                            onPressed: ()  {

                            },
                            btnChild: BordrButton.googleLoginButton(),
                            borderColor: Color(0xFFD1D5DB),
                          ),
                          Text.rich(
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "By signing up, you agree to our ",
                                ),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context,
                                            StringConst
                                                .routTermAndConditionsScreen);
                                      },
                                    text: "Terms of Service",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                  text: " and ",
                                ),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context,
                                            StringConst
                                                .routTermAndConditionsScreen);
                                      },
                                    text: " Privacy Policy ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
