import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';
import './Instruction 16.dart';

class Instruction15 extends StatefulWidget {
  @override
  _Instruction15State createState() => _Instruction15State();
}

class _Instruction15State extends State<Instruction15> {
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset("assets/svg/intruction 9-1.svg"),
                    ),
                    Text(
                      "-----------",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset("assets/svg/instruction 9-2.svg"),
                    ),
                  ]),
              // Center(
              //     child: Column(
              //   children: <Widget>[
              //     SvgPicture.asset("assets/svg/instruction 6-1.svg"),
              //   ],
              // )),
              SizedBox(
                height: hp * 0.3,
              ),
              Column(
                children: [
                  Text(
                    "Extends hand 2++",
                    style: TextStyle(
                        color: colorFromHex('#181D3D'),
                        fontFamily: 'TTCommons',
                        fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "from Eyes",
                    style: TextStyle(
                        color: colorFromHex('#181D3D'),
                        fontFamily: 'TTCommons',
                        fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
