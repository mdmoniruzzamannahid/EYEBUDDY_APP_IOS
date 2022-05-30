import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:eye_buddy/screen/homepage/left_eye_test_bar.dart';
import 'package:eye_buddy/screen/homepage/right_eye_text_bar.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  String dropdownValue = 'Total';
  var userID;
  var totalXP = 0;
  var thisWeekXP = 0;
  var lastWeekXP = 0;
  var date = DateFormat('EEEE').format(DateTime.now());

  //++++++++++++++ BarChartStart+++++++++++++++++++++++++
  final double barWidth = 22;

  double stimulation = 0;

  double dryEye = 0;

  double accoSpasm = 0;

  double relaxation = 0;

  double eyeMuscles = 0;

  double allDay = 0;

  double lazyEye = 0;

  double morning = 0;

  double evening = 0;
  //++++++++++++++ BarChartEnd+++++++++++++++++++++++++
  var barChartPageValue = "na";
  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  // print(findFirstDateOfTheWeek(DateTime.now()).day);

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  // print(findLastDateOfTheWeek(DateTime.now()));

  DateTime findFirstDateOfPreviousWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfLastWeek =
        dateTime.subtract(const Duration(days: 7));
    return findFirstDateOfTheWeek(sameWeekDayOfLastWeek);
  }

  //print(findFirstDateOfPreviousWeek(DateTime.now()));

  DateTime findLastDateOfPreviousWeek(DateTime dateTime) {
    final DateTime sameWeekDayOfLastWeek =
        dateTime.subtract(const Duration(days: 7));
    return findLastDateOfTheWeek(sameWeekDayOfLastWeek);
  }

  // print(findLastDateOfPreviousWeek(DateTime.now()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userID = FirebaseAuth.instance.currentUser.uid;

    //++++++++++++++++++++++++++++++++++++BarChartStart++++++++++++++++++++++

    FirebaseFirestore.instance
        .collection("EyeExercisePoint")
        .where("userID", isEqualTo: userID)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.data()["exName"] == "DryEyes") {
          dryEye = dryEye + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "AccoSpasm") {
          accoSpasm = accoSpasm + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "Relaxation") {
          relaxation = relaxation + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "EyeMuscles") {
          eyeMuscles = eyeMuscles + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "AllDay") {
          allDay = allDay + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "Simulation") {
          stimulation = stimulation + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "LazyEye") {
          lazyEye = lazyEye + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "Morning") {
          morning = morning + element.data()["xpPoint"];
        }
        if (element.data()["exName"] == "Evening") {
          evening = evening + element.data()["xpPoint"];
        }
      });
      setState(() {});
    });

    //++++++++++++++++++++++++++BarChartEnd+++++++++++++++++++++++++++
    FirebaseFirestore.instance
        .collection("EyeExercisePoint")
        .where("userID", isEqualTo: userID)
        .get()
        .then((value) {
      print(
          "+++++++++++++++++++++++++${value.docs[0]['dateTime'].toDate().toString()}");
      print(
          "+++++++++++++++++++++++++${value.docs[0]['dateTime'].toDate().toString().split(" ")[0].toString().split("-")[2]}");
      value.docs.forEach((element) {
        if (element.data()["xpPoint"] != null) {
          totalXP = totalXP + element.data()["xpPoint"];
        }

        int day = int.parse(element
            .data()["dateTime"]
            .toDate()
            .toString()
            .split(" ")[0]
            .toString()
            .split("-")[2]);

        print("=============== $day");

        if (day >= findFirstDateOfTheWeek(DateTime.now()).day &&
            day <= findLastDateOfTheWeek(DateTime.now()).day) {
          thisWeekXP = thisWeekXP + element.data()["xpPoint"];
          print("================= $thisWeekXP");
        }

        if (day >= findFirstDateOfPreviousWeek(DateTime.now()).day &&
            day <= findLastDateOfPreviousWeek(DateTime.now()).day) {
          lastWeekXP = lastWeekXP + element.data()["xpPoint"];
        }
      });
      setState(() {});
      print("+++++++++++++++++++++++++++++++$totalXP");
      print("+++++++++++++++++++++++++++++++$thisWeekXP");
      print("+++++++++++++++++++++++++++++++$lastWeekXP");
    });
  }

  @override
  Widget build(BuildContext context) {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      // onWillPop: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Home()));
      // },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorFromHex('#FFFFFF'),
          title: Text('History',
              style: TextStyle(
                color: colorFromHex("#181D3D"),
                fontSize: 20,
              )),
          actions: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down_sharp),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String newValue) {
                if (newValue == "Total") {
                  print("************** Total");
                  final barWidth = 22;

                  stimulation = 0;

                  dryEye = 0;

                  accoSpasm = 0;

                  relaxation = 0;

                  eyeMuscles = 0;

                  allDay = 0;

                  lazyEye = 0;

                  morning = 0;

                  evening = 0;

                  FirebaseFirestore.instance
                      .collection("EyeExercisePoint")
                      .where("userID", isEqualTo: userID)
                      .get()
                      .then((value) {
                    value.docs.forEach((element) {
                      if (element.data()["exName"] == "DryEyes") {
                        dryEye = dryEye + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "AccoSpasm") {
                        accoSpasm = accoSpasm + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "Relaxation") {
                        relaxation = relaxation + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "EyeMuscles") {
                        eyeMuscles = eyeMuscles + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "AllDay") {
                        allDay = allDay + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "Simulation") {
                        stimulation = stimulation + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "LazyEye") {
                        lazyEye = lazyEye + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "Morning") {
                        morning = morning + element.data()["xpPoint"];
                      }
                      if (element.data()["exName"] == "Evening") {
                        evening = evening + element.data()["xpPoint"];
                      }
                    });
                    setState(() {});
                  });
                }
                if (newValue == "Daily") {
                  print("************** daily");
                  final barWidth = 22;

                  stimulation = 0;

                  dryEye = 0;

                  accoSpasm = 0;

                  relaxation = 0;

                  eyeMuscles = 0;

                  allDay = 0;

                  lazyEye = 0;

                  morning = 0;

                  evening = 0;
                  FirebaseFirestore.instance
                      .collection("EyeExercisePoint")
                      .where("userID", isEqualTo: userID)
                      .get()
                      .then((value) {
                    String my = value.docs[0]
                        .data()['dateTime']
                        .toDate()
                        .toString()
                        .split(" ")[0]
                        .toString();
                    print("++++++++++++++++++++++++++ $my");
                    print(
                        "++++++++++++++++++++++++++ ${DateTime.now().toString().split(" ")[0].toString()}");
                    value.docs.forEach((element) {
                      if (element
                              .data()["dateTime"]
                              .toDate()
                              .toString()
                              .split(" ")[0]
                              .toString() ==
                          DateTime.now().toString().split(" ")[0].toString()) {
                        if (element.data()["exName"] == "DryEyes") {
                          dryEye = dryEye + element.data()["xpPoint"];
                          print("++++++++++++++++++++$dryEye");
                        }
                        if (element.data()["exName"] == "AccoSpasm") {
                          accoSpasm = accoSpasm + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Relaxation") {
                          relaxation = relaxation + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "EyeMuscles") {
                          eyeMuscles = eyeMuscles + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "AllDay") {
                          allDay = allDay + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Simulation") {
                          stimulation = stimulation + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "LazyEye") {
                          lazyEye = lazyEye + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Morning") {
                          morning = morning + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Evening") {
                          evening = evening + element.data()["xpPoint"];
                        }
                      }
                    });
                    setState(() {});
                  });
                }

                if (newValue == "Monthly") {
                  print("************** Monthly");
                  final barWidth = 22;

                  stimulation = 0;

                  dryEye = 0;

                  accoSpasm = 0;

                  relaxation = 0;

                  eyeMuscles = 0;

                  allDay = 0;

                  lazyEye = 0;

                  morning = 0;

                  evening = 0;
                  FirebaseFirestore.instance
                      .collection("EyeExercisePoint")
                      .where("userID", isEqualTo: userID)
                      .get()
                      .then((value) {
                    String my = value.docs[0]
                        .data()['dateTime']
                        .toDate()
                        .toString()
                        .split(" ")[0]
                        .toString()
                        .split("-")[0]
                        .toString();
                    print("++++++++++++++++++++++++++ $my");
                    print(
                        "++++++++++++++++++++++++++ ${DateTime.now().toString().split(" ")[0].toString()}");
                    value.docs.forEach((element) {
                      if (element
                                  .data()["dateTime"]
                                  .toDate()
                                  .toString()
                                  .split(" ")[0]
                                  .toString()
                                  .split("-")[0]
                                  .toString() ==
                              DateTime.now()
                                  .toString()
                                  .split(" ")[0]
                                  .toString()
                                  .split("-")[0]
                                  .toString() &&
                          element
                                  .data()["dateTime"]
                                  .toDate()
                                  .toString()
                                  .split(" ")[0]
                                  .toString()
                                  .split("-")[1]
                                  .toString() ==
                              DateTime.now()
                                  .toString()
                                  .split(" ")[0]
                                  .toString()
                                  .split("-")[1]
                                  .toString()) {
                        if (element.data()["exName"] == "DryEyes") {
                          dryEye = dryEye + element.data()["xpPoint"];
                          print("++++++++++++++++++++$dryEye");
                        }
                        if (element.data()["exName"] == "AccoSpasm") {
                          accoSpasm = accoSpasm + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Relaxation") {
                          relaxation = relaxation + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "EyeMuscles") {
                          eyeMuscles = eyeMuscles + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "AllDay") {
                          allDay = allDay + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Simulation") {
                          stimulation = stimulation + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "LazyEye") {
                          lazyEye = lazyEye + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Morning") {
                          morning = morning + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Evening") {
                          evening = evening + element.data()["xpPoint"];
                        }
                      }
                    });
                    setState(() {});
                  });
                }
                if (newValue == "Yearly") {
                  print("************** Yearly");
                  final barWidth = 22;

                  stimulation = 0;

                  dryEye = 0;

                  accoSpasm = 0;

                  relaxation = 0;

                  eyeMuscles = 0;

                  allDay = 0;

                  lazyEye = 0;

                  morning = 0;

                  evening = 0;
                  FirebaseFirestore.instance
                      .collection("EyeExercisePoint")
                      .where("userID", isEqualTo: userID)
                      .get()
                      .then((value) {
                    String my = value.docs[0]
                        .data()['dateTime']
                        .toDate()
                        .toString()
                        .split(" ")[0]
                        .toString()
                        .split("-")[0]
                        .toString();
                    print("++++++++++++++++++++++++++ $my");
                    print(
                        "++++++++++++++++++++++++++ ${DateTime.now().toString().split(" ")[0].toString()}");
                    value.docs.forEach((element) {
                      if (element
                              .data()["dateTime"]
                              .toDate()
                              .toString()
                              .split(" ")[0]
                              .toString()
                              .split("-")[0]
                              .toString() ==
                          DateTime.now()
                              .toString()
                              .split(" ")[0]
                              .toString()
                              .split("-")[0]
                              .toString()) {
                        if (element.data()["exName"] == "DryEyes") {
                          dryEye = dryEye + element.data()["xpPoint"];
                          print("++++++++++++++++++++$dryEye");
                        }
                        if (element.data()["exName"] == "AccoSpasm") {
                          accoSpasm = accoSpasm + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Relaxation") {
                          relaxation = relaxation + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "EyeMuscles") {
                          eyeMuscles = eyeMuscles + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "AllDay") {
                          allDay = allDay + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Simulation") {
                          stimulation = stimulation + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "LazyEye") {
                          lazyEye = lazyEye + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Morning") {
                          morning = morning + element.data()["xpPoint"];
                        }
                        if (element.data()["exName"] == "Evening") {
                          evening = evening + element.data()["xpPoint"];
                        }
                      }
                    });
                    setState(() {});
                  });
                }
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Total', 'Daily', 'Monthly', 'Yearly']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  height: 250,
                  //child: BarChartPage(barChartPageValue: barChartPageValue)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 4,
                      // color: const Color(0xff020227),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Eye Improvement Chart',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "TTCommon",
                                  fontWeight: FontWeight.w800,
                                  color: ColorConfig.black),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 20),
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Stimulation',
                                          style: TextStyle(
                                              fontSize: 9,
                                              color: ColorConfig.black)),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Dry Eye',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Accommodation',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Relaxation',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Eye Muscles',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                  // RotatedBox(
                                  //   quarterTurns: 3,
                                  //   child: RichText(
                                  //     text: TextSpan(
                                  //       text: 'All Day',
                                  //       style: TextStyle(
                                  //           fontSize: 9,
                                  //           color: ColorConfig.black),
                                  //     ),
                                  //   ),
                                  // ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Lazy eye',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Day',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Night',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: ColorConfig.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 95,
                            width: hw,
                            child: BarChart(
                              BarChartData(
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  alignment: BarChartAlignment.center,
                                  maxY: 20,
                                  minY: 0,
                                  groupsSpace: hw,
                                  barTouchData: BarTouchData(enabled: true),
                                  titlesData: FlTitlesData(
                                    show: false,
                                  ),
                                  barGroups: [
                                    BarChartGroupData(
                                      barsSpace: hw * 0.0495,
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                            y: stimulation / 100,
                                            width: 22,
                                            colors: [colorFromHex('#FFC392')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        BarChartRodData(
                                            y: dryEye / 100,
                                            width: 22,
                                            colors: [colorFromHex('#FFAED4')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        BarChartRodData(
                                            y: accoSpasm / 100,
                                            width: 22,
                                            colors: [colorFromHex('#5F478C')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        BarChartRodData(
                                            y: relaxation / 100,
                                            width: 22,
                                            colors: [colorFromHex('#8B82D0')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        BarChartRodData(
                                            y: eyeMuscles / 100,
                                            width: 22,
                                            colors: [colorFromHex('#FF773D')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        // BarChartRodData(
                                        //     y: allDay / 100,
                                        //     width: 22,
                                        //     colors: [colorFromHex('#322644')],
                                        //     borderRadius: BorderRadius.only(
                                        //       topLeft: Radius.circular(6),
                                        //       topRight: Radius.circular(6),
                                        //     )),
                                        BarChartRodData(
                                            y: lazyEye / 100,
                                            width: 22,
                                            colors: [colorFromHex('#FFCE5D')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        BarChartRodData(
                                            y: morning / 100,
                                            width: 22,
                                            colors: [colorFromHex('#42C1A6')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                        BarChartRodData(
                                            y: evening / 100,
                                            width: 22,
                                            colors: [colorFromHex('#181D3D')],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                          Divider(
                            indent: 25,
                            endIndent: 25,
                            thickness: 1,
                            color: ColorConfig.black,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LeftEyeTestBar(),
                  RightEyeTestBar(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total'),
                            Text(
                              '${totalXP.toString()} XP',
                              style: TextStyle(
                                  color: ColorConfig.black,
                                  fontSize: 22,
                                  fontFamily: 'TTCommon'),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('This week'),
                                Row(
                                  children: [
                                    Text(
                                      thisWeekXP.toString(),
                                      style: TextStyle(
                                          color: ColorConfig.black,
                                          fontSize: 22,
                                          fontFamily: 'TTCommon'),
                                    ),
                                    thisWeekXP > lastWeekXP
                                        ? Icon(
                                            Icons.arrow_upward_outlined,
                                            color: colorFromHex('#128D47'),
                                          )
                                        : Icon(
                                            Icons.arrow_downward_sharp,
                                            color: colorFromHex('#FF0000'),
                                          )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Last Week'),
                                Row(
                                  children: [
                                    Text(
                                      lastWeekXP.toString(),
                                      style: TextStyle(
                                          color: ColorConfig.black,
                                          fontSize: 22,
                                          fontFamily: 'TTCommon'),
                                    ),
                                    lastWeekXP > thisWeekXP
                                        ? Icon(
                                            Icons.arrow_upward_outlined,
                                            color: colorFromHex('#128D47'),
                                          )
                                        : Icon(
                                            Icons.arrow_downward_sharp,
                                            color: colorFromHex('#FF0000'),
                                          )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 6.0,
                            percent: totalXP <= 100
                                ? totalXP / 100
                                : totalXP <= 300 && totalXP > 100
                                    ? totalXP / 300
                                    : totalXP <= 4200 && totalXP > 300
                                        ? totalXP / 4200
                                        : totalXP <= 9000 && totalXP > 4200
                                            ? totalXP / 9000
                                            : totalXP <= 17000 && totalXP > 9000
                                                ? totalXP / 17000
                                                : totalXP <= 29000 &&
                                                        totalXP > 17000
                                                    ? totalXP / 29000
                                                    : totalXP <= 36000 &&
                                                            totalXP > 29000
                                                        ? totalXP / 36000
                                                        : totalXP <= 40400 &&
                                                                totalXP > 36000
                                                            ? totalXP / 40400
                                                            : totalXP <=
                                                                        54000 &&
                                                                    totalXP >
                                                                        40400
                                                                ? totalXP /
                                                                    54000
                                                                : totalXP <=
                                                                            69000 &&
                                                                        totalXP >
                                                                            54000
                                                                    ? totalXP /
                                                                        69000
                                                                    : totalXP <=
                                                                                1000000 &&
                                                                            totalXP >
                                                                                69000
                                                                        ? totalXP /
                                                                            1000000
                                                                        : 1000000,
                            center: Text(((totalXP <= 100
                                        ? totalXP / 100
                                        : totalXP <= 300 && totalXP > 100
                                            ? totalXP / 300
                                            : totalXP <= 4200 && totalXP > 300
                                                ? totalXP / 4200
                                                : totalXP <= 9000 &&
                                                        totalXP > 4200
                                                    ? totalXP / 9000
                                                    : totalXP <= 17000 &&
                                                            totalXP > 9000
                                                        ? totalXP / 17000
                                                        : totalXP <= 29000 &&
                                                                totalXP > 17000
                                                            ? totalXP / 29000
                                                            : totalXP <=
                                                                        36000 &&
                                                                    totalXP >
                                                                        29000
                                                                ? totalXP /
                                                                    36000
                                                                : totalXP <=
                                                                            40400 &&
                                                                        totalXP >
                                                                            36000
                                                                    ? totalXP /
                                                                        40400
                                                                    : totalXP <=
                                                                                54000 &&
                                                                            totalXP >
                                                                                40400
                                                                        ? totalXP /
                                                                            54000
                                                                        : totalXP <= 69000 &&
                                                                                totalXP > 54000
                                                                            ? totalXP / 69000
                                                                            : totalXP <= 1000000 && totalXP > 69000
                                                                                ? totalXP / 1000000
                                                                                : 1000000) *
                                    100)
                                .toString()
                                .split('.')[0]),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text((totalXP <= 100
                                        ? 100 - totalXP
                                        : totalXP <= 300 && totalXP > 100
                                            ? 300 - totalXP
                                            : totalXP <= 4200 && totalXP > 300
                                                ? 4200 - totalXP
                                                : totalXP <= 9000 &&
                                                        totalXP > 4200
                                                    ? 9000 - totalXP
                                                    : totalXP <= 17000 &&
                                                            totalXP > 9000
                                                        ? 17000 - totalXP
                                                        : totalXP <= 29000 &&
                                                                totalXP > 17000
                                                            ? 29000 - totalXP
                                                            : totalXP <=
                                                                        36000 &&
                                                                    totalXP >
                                                                        29000
                                                                ? 36000 -
                                                                    totalXP
                                                                : totalXP <=
                                                                            40400 &&
                                                                        totalXP >
                                                                            36000
                                                                    ? 40400 -
                                                                        totalXP
                                                                    : totalXP <=
                                                                                54000 &&
                                                                            totalXP >
                                                                                40400
                                                                        ? 54000 -
                                                                            totalXP
                                                                        : totalXP <= 69000 &&
                                                                                totalXP > 54000
                                                                            ? 69000 - totalXP
                                                                            : totalXP <= 1000000 && totalXP > 69000
                                                                                ? 1000000 - totalXP
                                                                                : 1000000)
                                    .toString()),
                                Text('Away from'),
                                Text('Goal'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 103,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 6.0,
                            percent: totalXP <= 100
                                ? totalXP / 100
                                : totalXP <= 300 && totalXP > 100
                                    ? totalXP / 300
                                    : totalXP <= 4200 && totalXP > 300
                                        ? totalXP / 4200
                                        : totalXP <= 9000 && totalXP > 4200
                                            ? totalXP / 9000
                                            : totalXP <= 17000 && totalXP > 9000
                                                ? totalXP / 17000
                                                : totalXP <= 29000 &&
                                                        totalXP > 17000
                                                    ? totalXP / 29000
                                                    : totalXP <= 36000 &&
                                                            totalXP > 29000
                                                        ? totalXP / 36000
                                                        : totalXP <= 40400 &&
                                                                totalXP > 36000
                                                            ? totalXP / 40400
                                                            : totalXP <=
                                                                        54000 &&
                                                                    totalXP >
                                                                        40400
                                                                ? totalXP /
                                                                    54000
                                                                : totalXP <=
                                                                            69000 &&
                                                                        totalXP >
                                                                            54000
                                                                    ? totalXP /
                                                                        69000
                                                                    : totalXP <=
                                                                                1000000 &&
                                                                            totalXP >
                                                                                69000
                                                                        ? totalXP /
                                                                            1000000
                                                                        : 1000000,
                            center: Text(
                              totalXP <= 100
                                  ? 'Contender'
                                  : totalXP <= 300 && totalXP > 100
                                      ? 'Shinning Warrior'
                                      : totalXP <= 4200 && totalXP > 300
                                          ? "Annihilator"
                                          : totalXP <= 9000 && totalXP > 4200
                                              ? "Ravager"
                                              : totalXP <= 17000 &&
                                                      totalXP > 9000
                                                  ? 'Seasoned Champion'
                                                  : totalXP <= 29000 &&
                                                          totalXP > 17000
                                                      ? "Worthy"
                                                      : totalXP <= 36000 &&
                                                              totalXP > 29000
                                                          ? 'The Champion OF Eye'
                                                          : totalXP <= 40400 &&
                                                                  totalXP >
                                                                      36000
                                                              ? "Platinum Eye"
                                                              : totalXP <=
                                                                          54000 &&
                                                                      totalXP >
                                                                          40400
                                                                  ? 'Heav'
                                                                  : totalXP <=
                                                                              69000 &&
                                                                          totalXP >
                                                                              54000
                                                                      ? totalXP /
                                                                          69000
                                                                      : totalXP <= 1000000 &&
                                                                              totalXP >
                                                                                  69000
                                                                          ? totalXP /
                                                                              1000000
                                                                          : 1000000,
                              style: TextStyle(fontSize: 9),
                              textAlign: TextAlign.center,
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Level',
                                  style: (TextStyle(fontSize: hw * 0.035)),
                                ),
                                Text(
                                  'Away from',
                                  style: (TextStyle(fontSize: hw * 0.035)),
                                ),
                                Text(
                                  'Goal',
                                  style: (TextStyle(fontSize: hw * 0.035)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Daily achivement',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'TTCommon',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Center(
                              child: CircleAvatar(
                                backgroundColor: date == 'Sunday'
                                    ? ColorConfig.black
                                    : ColorConfig.yeallow,
                                child: Text(
                                  "S",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Text(
                              "M",
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Text(
                              "T",
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Text(
                              "W",
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Text(
                              "T",
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Text(
                              "F",
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                          CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 2.0,
                            percent: 0.0,
                            center: Text(
                              "S",
                              style: TextStyle(fontSize: 16),
                            ),
                            progressColor: colorFromHex('#FEC62D'),
                            backgroundColor: colorFromHex('#181D3D'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: MaterialButton(
            //     height: hp * 0.07,
            //     minWidth: hw * 0.8,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     onPressed: () async {
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => CustomExcercies()));
            //     },
            //     child: Text(
            //       'Update Training Regime',
            //       style: TextStyle(
            //           fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
            //     ),
            //     color: colorFromHex('#FEC62D'),
            //   ),
            // ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
