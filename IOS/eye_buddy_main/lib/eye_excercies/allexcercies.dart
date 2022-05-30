import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eye_buddy/eye_excercies/acco_spasm.dart';
import 'package:eye_buddy/eye_excercies/all_day.dart';
import 'package:eye_buddy/eye_excercies/relaxation.dart';
import 'package:eye_buddy/eye_excercies/eye_muscles.dart';
import 'dry_eyes.dart';
import 'package:eye_buddy/eye_excercies/lazy_eye.dart';
import 'package:eye_buddy/eye_excercies/simulation.dart';

import 'package:eye_buddy/eye_excercies/custom_excercies.dart';

class AllExcercies extends StatefulWidget {
  @override
  _AllExcerciesState createState() => _AllExcerciesState();
}

class _AllExcerciesState extends State<AllExcercies> {
  int paid = 0;
  int id;
  int count = 1;
  List morning = [16, 32, 18, 35, 36];
  List evening = [32, 39, 0, 35, 36];

  List<bool> isSelected = [true, false];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            newSelectedIndex: 0,
                          )));
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'EYE EXERCISE',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        newSelectedIndex: 0,
                      )));
        },
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ToggleButtons(
                        borderRadius: BorderRadius.circular(15),
                        isSelected: isSelected,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        color: Colors.transparent,
                        fillColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                        renderBorder: false,
                        children: <Widget>[
                          Container(
                            height: 35,
                            width: 120,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              color: count == 1
                                  ? ColorConfig.yeallow
                                  : ColorConfig.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                            ),
                            child: Center(
                                child: Text(
                              "Day",
                              style: TextStyle(
                                fontFamily: 'TT Commons',
                                fontSize: 14,
                                color: count == 1
                                    ? ColorConfig.black
                                    : ColorConfig.yeallow,
                              ),
                            )),
                          ),
                          Container(
                            height: 35,
                            width: 120,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              color: count == 2
                                  ? ColorConfig.yeallow
                                  : ColorConfig.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                            ),
                            child: Center(
                                child: Text(
                              "Night",
                              style: TextStyle(
                                fontFamily: 'TT Commons',
                                fontSize: 14,
                                color: count == 2
                                    ? ColorConfig.black
                                    : ColorConfig.yeallow,
                              ),
                            )),
                          ),
                        ],
                        onPressed: (int newIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected[index] = true;
                                count = 1;
                              } else {
                                isSelected[index] = false;
                                count = 2;
                              }
                            }
                            print(count);
                          });
                          print(isSelected);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: count == 2
                          ? morning.length
                          : evening.length, //2 morning
                      // ignore: missing_return
                      itemBuilder: (context, i) {
                        if (count == 2) {
                          return GestureDetector(
                            child: _excercies(
                                eyeExcerciesFiles[morning[i]].title,
                                eyeExcerciesFiles[morning[i]].logo),
                            onTap: () {
                              print(
                                  ' I am Here ${eyeExcerciesFiles[morning[i]].logo}');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Instruction(
                                            id: eyeExcerciesFiles[morning[i]]
                                                .id,
                                            exName: "Morning",
                                            slide: eyeExcerciesFiles[morning[i]]
                                                .slide,
                                          )));
                            },
                          );
                        }
                        if (count == 1) {
                          return GestureDetector(
                            child: _excercies(
                                eyeExcerciesFiles[evening[i]].title,
                                eyeExcerciesFiles[evening[i]].logo),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Instruction(
                                            id: eyeExcerciesFiles[evening[i]]
                                                .id,
                                            exName: "Evening",
                                            slide: eyeExcerciesFiles[morning[i]]
                                                .slide,
                                          )));
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 45,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text(
                          'All Excercises',
                          style: TextStyle(
                              fontFamily: 'TT Commons',
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: GridView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DryEyes())),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x181D3D).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 40,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 99.66,
                        width: 99.66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 43.82,
                              width: 43.84,
                              child: SvgPicture.asset(
                                "assets/svg/DryEye.svg",
                              ),
                            ),
                            Container(
                              height: 17,
                            ),
                            Text(
                              "Dry Eyes",
                              style: TextStyle(
                                  fontFamily: 'TT Commons',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AccoSpasm())),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x181D3D).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 40,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 99.66,
                        width: 99.66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 40.47,
                              width: 48.56,
                              child: SvgPicture.asset(
                                "assets/svg/Acco.svg",
                              ),
                            ),
                            Container(
                              height: 17,
                            ),
                            Text(
                              "Acco. Spasm",
                              style: TextStyle(
                                  fontFamily: 'TT Commons',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Relaxation())),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x181D3D).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 40,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 99.66,
                        width: 99.66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 50.09,
                              width: 45.08,
                              child: SvgPicture.asset(
                                "assets/svg/Relaxation.svg",
                              ),
                            ),
                            Container(
                              height: 17,
                            ),
                            Text(
                              "Relaxation",
                              style: TextStyle(
                                  fontFamily: 'TT Commons',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EyeMuscles())),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x181D3D).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 40,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 99.66,
                        width: 99.66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 42.36,
                              width: 50.44,
                              child: SvgPicture.asset(
                                "assets/svg/Eye Muscles.svg",
                              ),
                            ),
                            Container(
                              height: 17,
                            ),
                            Text(
                              "Eye Muscles",
                              style: TextStyle(
                                  fontFamily: 'TT Commons',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => AllDay(exName: "AllDay"))),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(5.0),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Color(0x181D3D).withOpacity(0.1),
                  //             spreadRadius: 1,
                  //             blurRadius: 40,
                  //             offset: Offset(0, 3),
                  //           )
                  //         ],
                  //       ),
                  //       height: 99.66,
                  //       width: 99.66,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: <Widget>[
                  //           Container(
                  //             height: 41.55,
                  //             width: 43.21,
                  //             child: SvgPicture.asset(
                  //               "assets/svg/All Day.svg",
                  //             ),
                  //           ),
                  //           Container(
                  //             height: 17,
                  //           ),
                  //           Text(
                  //             "All Day",
                  //             style: TextStyle(
                  //                 fontFamily: 'TT Commons',
                  //                 fontSize: 14,
                  //                 color: Colors.black),
                  //           ),
                  //           Container(
                  //             height: 17,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SimulationEye())),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 17),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x181D3D).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 40,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 99.66,
                        width: 99.66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 45.15,
                              width: 45.15,
                              child: SvgPicture.asset(
                                "assets/svg/Simulation.svg",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Stimulation",
                              style: TextStyle(
                                  fontFamily: 'TT Commons',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LazyEye())),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x181D3D).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 40,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        height: 99.66,
                        width: 99.66,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 39.62,
                              width: 60.54,
                              child: SvgPicture.asset(
                                "assets/svg/LazyEye.svg",
                              ),
                            ),
                            Container(
                              height: 17,
                            ),
                            Text(
                              "Lazy Eye",
                              style: TextStyle(
                                  fontFamily: 'TT Commons',
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Container(
                              height: 17,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorFromHex("#FEC62D"),
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CustomExcercies()));
        },
      ),
    );
  }

  Widget _excercies(name, logo) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
          width: 120,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x181D3D).withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 40,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: SvgPicture.asset(
                  'assets/svg/excercies/$logo.svg',
                  height: 37.31,
                  width: 37.31,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'TT Commons',
                    fontSize: 14,
                    color: Colors.black),
              ),
              Container(
                height: 20,
              )
            ],
          )),
    );
  }
}
