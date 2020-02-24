import 'package:flutter/material.dart';
import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/ui/components/buttons/buttons.dart';
import 'package:github_api_testapp/ui/components/custom_app_bar.dart';
import 'package:github_api_testapp/ui/custom_styles/custom_colors.dart';
import 'package:github_api_testapp/ui/screens/user_repolist_screen.dart';

class UsernameEnterScreen extends StatefulWidget {
  @override
  UsernameEnterScreenState createState() => UsernameEnterScreenState();
}

class UsernameEnterScreenState extends State<UsernameEnterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: Messages.usernameEnterScreenTitle),
        body: Center(
            child: Form(
                key: _formKey,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      Image.asset("resources/images/github_logo.png"),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: Messages.usernameEnterScreenTextfieldTitle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: CustomColors.greenColor))),
                        controller: _controller,
                        validator: (value) {
                          if (value.isEmpty) {
                            return Messages.usernameEnterScreenTextfieldTitle;
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                      Buttons.greenButton(Messages.submit, () {
                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserRepolistScreen(
                                      userName: _controller.text)));
                        }
                      }, true)
                    ]))))));
  }
}
