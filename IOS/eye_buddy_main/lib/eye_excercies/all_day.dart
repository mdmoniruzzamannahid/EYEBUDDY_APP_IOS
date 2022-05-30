// import 'package:eye_buddy/eye_excercies/Instruction.dart';
// import 'package:eye_buddy/model/eye_excercies_model.dart';
// import 'package:flutter/material.dart';
// import 'package:eye_buddy/eye_excercies/excercies_class/eye_excercies_item.dart';

// // ignore: must_be_immutable
// class AllDay extends StatefulWidget {
//   String exName;
//   AllDay({this.exName});
//   int id;
//   @override
//   _AllDayState createState() => _AllDayState(exName: exName);
// }

// class _AllDayState extends State<AllDay> {
//   String exName;
//   _AllDayState({this.exName});
//   @override
//   Widget build(BuildContext context) {
//     var hp = MediaQuery.of(context).size.height;
//     var hw = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: Image.asset('assets/icon/back_arrow.png'),
//           onTap: () {
//             Navigator.pop(context, true);
//           },
//         ),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           'All Day',
//           style: TextStyle(
//             fontFamily: 'TT Commons DemiBold',
//             fontSize: 18,
//             color: const Color(0xff181d3d),
//           ),
//           textAlign: TextAlign.left,
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(20),
//             child: GridView(
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               children: <Widget>[
//                 // InkWell(
//                 //   onTap: () => Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //           builder: (context) => Instruction(
//                 //                 id: 1,
//                 //                 exName: exName,
//                 //                 slide: eyeExcerciesFiles[0].slide,
//                 //               ))),
//                 //   child: splitimages(hp, hw),
//                 // ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 1,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[0].slide,
//                               ))),
//                   child: focusshift(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 19,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[18].slide,
//                               ))),
//                   child: diagonalMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 20,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[19].slide,
//                               ))),
//                   child: ellipsisMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 15,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[14].slide,
//                               ))),
//                   child: jumpingMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 16,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[15].slide,
//                               ))),
//                   child: bouncingBall(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 14,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[13].slide,
//                               ))),
//                   child: crossMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 12,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[11].slide,
//                               ))),
//                   child: waveMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 22,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[21].slide,
//                               ))),
//                   child: spiralMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 21,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[20].slide,
//                               ))),
//                   child: flowerMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 23,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[22].slide,
//                               ))),
//                   child: springMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 24,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[23].slide,
//                               ))),
//                   child: trajectoryMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 26,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[25].slide,
//                               ))),
//                   child: infinityMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 25,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[24].slide,
//                               ))),
//                   child: butterflyMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 34,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[33].slide,
//                               ))),
//                   child: circleFocus(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 28,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[27].slide,
//                               ))),
//                   child: ractangularMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 2,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[1].slide,
//                               ))),
//                   child: colorPath(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 6,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[5].slide,
//                               ))),
//                   child: colorStripes(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 7,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[6].slide,
//                               ))),
//                   child: trafficLigths(hp, hw),
//                 ),

//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 3,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[2].slide,
//                               ))),
//                   child: blurrygabor(hp, hw),
//                 ),

//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 4,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[3].slide,
//                               ))),
//                   child: gaborblinking(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 11,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[10].slide,
//                               ))),
//                   child: flashingShapes(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 18,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[17].slide,
//                               ))),
//                   child: chessboardFlicker(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 27,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[26].slide,
//                               ))),
//                   child: circleMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 29,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[28].slide,
//                               ))),
//                   child: patternFocus(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 32,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[31].slide,
//                               ))),
//                   child: leftRightMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 35,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[34].slide,
//                               ))),
//                   child: closingTight(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 36,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[35].slide,
//                               ))),
//                   child: closedEyeMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 37,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[36].slide,
//                               ))),
//                   child: plaming(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 38,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[37].slide,
//                               ))),
//                   child: twoObjects(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 39,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[38].slide,
//                               ))),
//                   child: tibetanEyeChart(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 31,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[30].slide,
//                               ))),
//                   child: randomMove(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 13,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[12].slide,
//                               ))),
//                   child: lightFlare(hp, hw),
//                 ),

//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 9,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[8].slide,
//                               ))),
//                   child: yinYangFocus(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 8,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[7].slide,
//                               ))),
//                   child: yinYangFlicker(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 10,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[9].slide,
//                               ))),
//                   child: rollerCoaster(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 17,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[16].slide,
//                               ))),
//                   child: growingPattern(hp, hw),
//                 ),
//                 InkWell(
//                   onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Instruction(
//                                 id: 40,
//                                 exName: exName,
//                                 slide: eyeExcerciesFiles[39].slide,
//                               ))),
//                   child: kaleidoscope(hp, hw),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
