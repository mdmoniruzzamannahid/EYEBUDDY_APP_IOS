import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';

class Instruction8 extends StatefulWidget {
  @override
  _Instruction8State createState() => _Instruction8State();
}

class _Instruction8State extends State<Instruction8> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: hp,
        width: hw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: hp * 0.15,
            ),
            SizedBox(
                height: hp * 0.3,
                child: SvgPicture.asset('assets/svg/instruction 8.svg')),
            SizedBox(
              height: hp * 0.2,
            ),
            Text(
              "Move your eyes to the pronounced direction",
              style: TextStyle(
                  color: colorFromHex('#181D3D'),
                  fontFamily: 'TTCommons',
                  fontSize: 26),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
