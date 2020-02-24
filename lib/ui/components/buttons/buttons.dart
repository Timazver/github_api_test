import 'package:flutter/material.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_colors.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_text_style.dart';

class Buttons {

  static Widget greenButton(String text, void onPressed(), bool isEnabled) {
    return Container(
        width: 247,
        height: 38,
        child: RaisedButton(
          textColor: Colors.white,
          color: CustomColors.greenColor,
          child: text!=null ? Text(text, style: CustomTextStyle(colour: Colors.white, textFontSize: 18)):Text(""),
          onPressed: isEnabled? onPressed:null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ));
  }
}
