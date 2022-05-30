import 'package:eye_buddy/screen/reset_password/varification.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();

  String email;

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: colorFromHex('#FFFFFF'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/svg/backArrow.svg',
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'FORGOT PASSWORD',
          style: TextStyle(color: colorFromHex('#181D3D')),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 192,
                  width: 192,
                  child: Image.asset('assets/images/keyring.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 210,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Container(
                width: 210,
                child: Text(
                  'Enter the email address associated with your account',
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: EdgeInsets.all(hw * 0.1),
              child: TextField(
                controller: emailController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MaterialButton(
                height: hp * 0.07,
                minWidth: hw * 0.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  if (!emailController.text.contains("@") ||
                      !emailController.text.contains(".") ||
                      emailController.text.isEmpty) {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                      "Please Enter a Valid Email!",
                    )));
                  } else {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Varification(
                                email: emailController.text,
                              )), //Varification
                    );
                  }
                },
                child: Text(
                  'Reset password',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'DemiBold',
                      fontWeight: FontWeight.bold,
                      color: colorFromHex('#FFFFFF')),
                  // style: TextStyle(
                  //     fontFamily: 'DemiBold', color: _colorFromHex('#FEC62D')),
                ),
                color: colorFromHex('#FEC62D'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
