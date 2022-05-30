import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';
import './Instruction 1.dart';
import './Instruction 6.dart';

class Instruction5 extends StatefulWidget {
  @override
  _Instruction5State createState() => _Instruction5State();
}

class _Instruction5State extends State<Instruction5> {
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
            SizedBox(
              height: hp * 0.3,
              child: Text(
                'x5',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: hp * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                "Repeat 5 times",
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
