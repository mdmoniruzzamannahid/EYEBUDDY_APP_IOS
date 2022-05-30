import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';

class Instruction14 extends StatefulWidget {
  @override
  _Instruction14State createState() => _Instruction14State();
}

class _Instruction14State extends State<Instruction14> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: hp,
        width: hw,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: hp * 0.15,
            ),
            SizedBox(
                height: hp * 0.3,
                child: SvgPicture.asset('assets/svg/instruction 14.svg')),
            SizedBox(
              height: hp * 0.2,
            ),
            Text(
              'Take off your glasses/contacts',
              style: TextStyle(
                  color: colorFromHex('#181D3D'),
                  fontFamily: 'TTCommons',
                  fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
