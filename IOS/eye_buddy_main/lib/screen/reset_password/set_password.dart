import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/reset_password/varification.dart';
import 'package:eye_buddy/util/colorconfig.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetPassword extends StatefulWidget {
  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
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
          'SET PASSWORD',
          style: TextStyle(color: colorFromHex('#181D3D')),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
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
                child: Text(
                  'Set new password',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Enter New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  controller: emailController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                newSelectedIndex: 3,
                              )), //Varification
                    );
                  },
                  child: Text(
                    'Reset Now',
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
      ),
    );
  }
}
