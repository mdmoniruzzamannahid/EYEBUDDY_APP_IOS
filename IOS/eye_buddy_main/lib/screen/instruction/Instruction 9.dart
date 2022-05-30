import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';

class Instruction9 extends StatefulWidget {
  @override
  _Instruction9State createState() => _Instruction9State();
}

class _Instruction9State extends State<Instruction9> {
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
                child: Center(
                  child: SvgPicture.asset("assets/svg/Instruction22.svg"),
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
              Center(
                child: Text(
                  "Hold the Screen about 40cm or 15 inches away.",
                  style: TextStyle(
                      color: colorFromHex('#181D3D'),
                      fontFamily: 'TTCommons',
                      fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   var hp = MediaQuery.of(context).size.height;
  //   var hw = MediaQuery.of(context).size.width;
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Padding(
  //         padding: EdgeInsets.all(20.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             SizedBox(
  //               height: hp * 0.15,
  //             ),
  //             Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.all(10.0),
  //                     child: SvgPicture.asset("assets/svg/intruction 9-1.svg"),
  //                   ),
  //                   Text(
  //                     "-----------",
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(10.0),
  //                     child: SvgPicture.asset("assets/svg/instruction 9-2.svg"),
  //                   ),
  //                 ]),
  //             SizedBox(
  //               height: hp * 0.3,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 20.0, right: 20),
  //               child: Text(
  //                 "Focus at the center",
  //                 style: TextStyle(
  //                   color: colorFromHex('#181D3D'),
  //                   fontFamily: 'TTCommons',
  //                   fontSize: 26,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
