import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';
import './Instruction 13.dart';

class Instruction12 extends StatefulWidget {
  @override
  _Instruction12State createState() => _Instruction12State();
}

class _Instruction12State extends State<Instruction12> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: hp * 0.15,
              ),
              Container(
                  width: hw * 0.8,
                  child: SvgPicture.asset('assets/svg/instruction 12.svg')),
              SizedBox(
                height: hp * 0.3,
              ),
              Text(
                "During excercise you should follow the moving object",
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
