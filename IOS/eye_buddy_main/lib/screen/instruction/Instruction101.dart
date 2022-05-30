import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';

class Instruction101 extends StatefulWidget {
  @override
  _Instruction101State createState() => _Instruction101State();
}

class _Instruction101State extends State<Instruction101> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: hp * 0.15,
              ),
              SizedBox(
                height: hp * 0.3,
                child: Image.asset(
                  'assets/images/Image 3.png',
                  fit: BoxFit.fill,
                ),
              ),
              // Center(
              //     child: Column(
              //   children: <Widget>[
              //     SvgPicture.asset("assets/svg/instruction 6-1.svg"),
              //   ],
              // )),
              SizedBox(
                height: hp * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text(
                  "Determine if the lines appear blacker, or less distinct, and if the lines appear wavy or less clear.",
                  style: TextStyle(
                    color: colorFromHex('#181D3D'),
                    fontFamily: 'TTCommons',
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
