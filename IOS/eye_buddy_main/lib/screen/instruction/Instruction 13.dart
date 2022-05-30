import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';
import './Instruction 14.dart';

class Instruction13 extends StatefulWidget {
  @override
  _Instruction13State createState() => _Instruction13State();
}

class _Instruction13State extends State<Instruction13> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: hp,
          width: hw,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: hp * 0.15,
              ),
              SizedBox(
                  height: hp * 0.3,
                  child: SvgPicture.asset('assets/svg/instruction 13.svg')),
              SizedBox(
                height: hp * 0.2,
              ),
              Text(
                "Keep Glasses on",
                style: TextStyle(
                    color: colorFromHex('#181D3D'),
                    fontFamily: 'TTCommons',
                    fontSize: 26),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
