import 'package:flutter/material.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_colors.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CustomColors.greenColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Center(child: 
        Container(
          padding: EdgeInsets.only(top:30),
          child:
          Row(children:<Widget>[
              BackButton(),
              Center(child:Text(title,textAlign:TextAlign.center, style:CustomTextStyle(colour: CustomColors.darkGreen, textFontSize: 18)))])),
      ),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}