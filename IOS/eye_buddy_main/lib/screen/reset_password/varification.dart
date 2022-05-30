import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/reset_password/numeric_kepad.dart';
import 'package:eye_buddy/screen/reset_password/set_password.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Varification extends StatefulWidget {
  final String email;

  Varification({@required this.email});
  @override
  _VarificationState createState() => _VarificationState();
}

class _VarificationState extends State<Varification> {
  String code = "";
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: colorFromHex('#FFFFFF'),
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: SvgPicture.asset(
      //         'assets/svg/backArrow.svg',
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     'VARIFICATION',
      //     style: TextStyle(color: colorFromHex('#181D3D')),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: hw * 0.1,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 192,
                  width: 192,
                  child: SvgPicture.asset('assets/svg/inbox.svg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 210,
                child: Text(
                  'Verification',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
                width: 210,
                child: Text(
                  'Your Password Reset link sent to ' + widget.email,
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: 50,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
            //     buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
            //     buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
            //     buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
            //   ],
            // ),

            // Padding(
            //   padding: EdgeInsets.all(hw * 0.1),
            //   child: TextField(
            //     controller: emailController,
            //     autofocus: true,
            //     decoration: InputDecoration(
            //       hintText: 'Enter email address',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //     ),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: MaterialButton(
            //     height: hp * 0.07,
            //     minWidth: hw * 0.8,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => SetPassword()), //Varification
            //       );
            //     },
            //     child: Text(
            //       'Home',
            //       style: TextStyle(
            //           fontSize: 18,
            //           fontFamily: 'DemiBold',
            //           fontWeight: FontWeight.bold,
            //           color: colorFromHex('#FFFFFF')),
            //     ),
            //     color: colorFromHex('#FEC62D'),
            //   ),
            // ),
            // NumericPad(
            //   onNumberSelected: (value) {
            //     print(value);
            //     setState(() {
            //       if (value != -1) {
            //         if (code.length < 4) {
            //           code = code + value.toString();
            //         }
            //       } else {
            //         code = code.substring(0, code.length - 1);
            //       }
            //       print(code);
            //     });
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MaterialButton(
          height: hp * 0.07,
          minWidth: hw * 0.8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        newSelectedIndex: 4,
                      )), //Varification
            );
          },
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'DemiBold',
                fontWeight: FontWeight.bold,
                color: colorFromHex('#FFFFFF')),
          ),
          color: colorFromHex('#FEC62D'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
