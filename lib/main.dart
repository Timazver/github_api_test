import 'package:flutter/material.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_colors.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_text_style.dart';
import 'package:github_api_testapp/ui/screens/username_enter_screen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github API test app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        loaderColor: CustomColors.greenColor,
          seconds: 3,
          photoSize: 150,
          title: Text(
            "Welcome",
            style: CustomTextStyle(
                textFontSize: 24, colour: CustomColors.greenColor),
          ),
          // navigateAfterSeconds: RegistrationScreen(),
          navigateAfterSeconds: UsernameEnterScreen(),
          image: Image.asset("resources/images/github_logo.png"),
        ),
    );
  }
}

