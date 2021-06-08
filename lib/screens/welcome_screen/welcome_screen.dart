import 'package:adahi_eidapp/screens/login_screen/login_screen.dart';
import 'package:adahi_eidapp/screens/sign_up_screen/sign_up_screen.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_helper_methods.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:adahi_eidapp/shared/app_strings.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 105.0,
              backgroundColor: Colors.teal[700],
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage(kSheepPhoto),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            DefaultButton(
              elevation: 0,
              text: 'login',
              function: () => navigateTo(context, LoginScreen()),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: DefaultButton(
                elevation: 0,
                text: 'Sign Up',
                function: () => navigateTo(context, SignUpScreen()),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CaptionText(text: 'or login with ? '),
          ],
        ),
      ),
    );
  }
}
