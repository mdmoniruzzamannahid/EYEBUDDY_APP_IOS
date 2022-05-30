import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter_svg/svg.dart';
import './Instruction 2.dart';

class Instruction1 extends StatefulWidget {
  @override
  _Instruction1State createState() => _Instruction1State();
}

class _Instruction1State extends State<Instruction1> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: hp * 0.15,
          ),
          Container(
              height: 100,
              width: 100,
              child: SvgPicture.asset('assets/svg/instruction 1.svg')),
          SizedBox(
            height: hp * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Text(
              "Wash your hands",
              style: TextStyle(
                  color: colorFromHex('#181D3D'),
                  fontFamily: 'TTCommons',
                  fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';

// Widget instruction1(context, hp) {
//   return Padding(
//     padding: EdgeInsets.all(20.0),
//     child: Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             InkWell(
//               child: Text(
//                 "Skip",
//                 style: TextStyle(
//                     color: colorFromHex('#181D3D'),
//                     fontFamily: 'TTCommons',
//                     fontSize: 16),
//               ),
//               onTap: () {
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (context) => Instruction2()));
//               },
//             )
//           ],
//         ),
//         SizedBox(
//           height: hp * 0.15,
//         ),
//         Container(
//             height: 100,
//             width: 100,
//             child: SvgPicture.asset('assets/svg/instruction 1.svg')),
//         SizedBox(
//           height: hp * 0.3,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10.0, right: 10),
//           child: Text(
//             "Wash your hands",
//             style: TextStyle(
//                 color: colorFromHex('#181D3D'),
//                 fontFamily: 'TTCommons',
//                 fontSize: 26),
//           ),
//         )
//       ],
//     ),
//   );
// }
