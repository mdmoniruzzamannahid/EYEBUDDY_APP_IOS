import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';
import 'Instruction 7.dart';

class Instruction6 extends StatefulWidget {
  @override
  _Instruction6State createState() => _Instruction6State();
}

class _Instruction6State extends State<Instruction6> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: hp * 0.15,
            ),
            Center(
                child: Column(
              children: <Widget>[
                SvgPicture.asset("assets/svg/instruction 6-1.svg"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset("assets/svg/Instruction 6-3.svg"),
                ),
                SvgPicture.asset("assets/svg/instruction 6-2.svg")
              ],
            )),
            SizedBox(
              height: hp * 0.13,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                "Close your eye tights when you feel vibration",
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
    );
  }
}
