import 'dart:math';

import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/screen/calender_screen.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/setting_page.dart';
import 'package:eye_buddy/screen/youtube.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Train extends StatefulWidget {
  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  int customEX = 1; // Day 2 , Night 3
  int newId = 1;
  int count;
  List selectedExercise;
  String exName;

  bool dValue = true;
  // ignore: missing_return
  String greeting() {
    var hour = DateTime.now().hour;
    if ((hour >= 6) & (hour < 18)) {
      return 'Day';
    } else {
      return 'Night';
    }
    //  print(hour);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String morningOrEvening = greeting();

    if (morningOrEvening == "Night") {
      selectedExercise = [32, 36, 0, 35, 39];
    }

    if (morningOrEvening == "Day") {
      selectedExercise = [16, 32, 18, 35, 36];
    }
    SharedPreferences.getInstance().then((value) {
      String daInstaShow = value.getString('daInstaShowValue');
      if (daInstaShow == null) {
        value.setString('daInstaShowValue',
            DateTime.now().add(const Duration(days: 11)).toString());

        print(value.getString('daInstaShowValue').toString());

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await showDialog<String>(
            context: context,
            builder: (BuildContext context) => new Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                height: 400,
                width: 250,
                // color: Colors.amber,s
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 250,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Container(
                                height: 230,
                                width: 250,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'We post cool eye facts and how to videos down there',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: MaterialButton(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        onPressed: () async {
                                          SharedPreferences.getInstance()
                                              .then((value) async {
                                            value.setBool(
                                                'isInstaSubscribed', true);
                                            var url =
                                                'https://www.instagram.com/eyebuddy.app/';

                                            if (await canLaunch(url)) {
                                              await launch(
                                                url,
                                                universalLinksOnly: true,
                                              );
                                            } else {
                                              throw 'There was a problem to open the url: $url';
                                            }
                                          });
                                        },
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                              fontFamily: 'DemiBold',
                                              color: colorFromHex('#FFFFFF')),
                                        ),
                                        color: colorFromHex('#EE417E'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 85,
                            child: Container(
                                height: 80,
                                width: 80,
                                // decoration: BoxDecoration(
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(20)),
                                //     color: Colors.red),
                                child:
                                    Image.asset('assets/images/instagram.png')),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 75,
                      bottom: 0,
                      child: InkWell(
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/cross.png')
                            // SvgPicture.asset(
                            //   "assets/svg/cross.svg",
                            //   fit: BoxFit.fill,
                            // )
                            ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      } else {
        print(value.getString('daInstaShowValue').toString());
        if (DateTime.now()
            .isAfter(DateTime.parse(value.getString('daInstaShowValue')))) {
          // var randomMumber = Random().nextInt(100);
          // print(randomMumber);
          // if (randomMumber >= 90 && randomMumber.isOdd) {
          SharedPreferences.getInstance().then((value) {
            try {
              bool isInstaSubscribed = value.getBool('isInstaSubscribed');

              if (isInstaSubscribed == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => new Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: 400,
                        width: 250,
                        // color: Colors.amber,s
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 250,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    child: Card(
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Container(
                                        height: 230,
                                        width: 250,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                'We post cool eye facts and how to videos down there',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: MaterialButton(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                minWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                onPressed: () async {
                                                  SharedPreferences
                                                          .getInstance()
                                                      .then((value) async {
                                                    value.setBool(
                                                        'isInstaSubscribed',
                                                        true);
                                                    var url =
                                                        'https://www.instagram.com/eyebuddy.app/';

                                                    if (await canLaunch(url)) {
                                                      await launch(
                                                        url,
                                                        universalLinksOnly:
                                                            true,
                                                      );
                                                    } else {
                                                      throw 'There was a problem to open the url: $url';
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  'Follow',
                                                  style: TextStyle(
                                                      fontFamily: 'DemiBold',
                                                      color: colorFromHex(
                                                          '#FFFFFF')),
                                                ),
                                                color: colorFromHex('#EE417E'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    left: 85,
                                    child: Container(
                                        height: 80,
                                        width: 80,
                                        // decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.all(Radius.circular(20)),
                                        //     color: Colors.red),
                                        child: Image.asset(
                                            'assets/images/instagram.png')),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 75,
                              bottom: 0,
                              child: InkWell(
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    child:
                                        Image.asset('assets/images/cross.png')
                                    // SvgPicture.asset(
                                    //   "assets/svg/cross.svg",
                                    //   fit: BoxFit.fill,
                                    // )
                                    ),
                                onTap: () {
                                  SharedPreferences.getInstance().then((value) {
                                    value.setString(
                                        'daInstaShowValue',
                                        DateTime.now()
                                            .add(const Duration(days: 11))
                                            .toString());
                                    print(value
                                        .getString('daInstaShowValue')
                                        .toString());
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
                // WidgetsBinding.instance.addPostFrameCallback((_) async {
                //   await showDialog<String>(
                //     context: context,
                //     builder: (BuildContext context) => new AlertDialog(
                //       title: new Text("title"),
                //       content: new Text("Happy Birthday to you!!!"),
                //       actions: <Widget>[
                //         new FlatButton(
                //           child: new Text("OK"),
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //         ),
                //       ],
                //     ),
                //   );
                // });

              }
            } catch (e) {
              print(e);
            }
          });
        }
      }
    }
        // }
        );
  }

  @override
  Widget build(BuildContext context) {
    String greet = greeting();
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Daily Training",
                        style: TextStyle(
                            color: colorFromHex('#181D3D'),
                            fontFamily: 'TTCommons-DemiBold',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: colorFromHex('#FEC62D'),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.settings,
                                size: 20,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage()));
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: hp * 0.06, bottom: hp * 0.05),
                  child: Text(
                    '$greet Exercise',
                    style: TextStyle(
                        fontFamily: 'DemiBold',
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: hp * 0.1, bottom: hp * 0.1),
                  child: Container(
                      height: hp * 0.2,
                      width: hw,
                      decoration: BoxDecoration(),
                      // height: 185.92,
                      // width: 259.11,
                      child: Lottie.asset(
                        'assets/burble.json',
                      )
                      // Image.asset("assets/images/big_eye.png")
                      ),
                ),

                // SizedBox(
                //   height: hp * 0.07,
                // ),
                MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    greet == 'Day' ? count = 2 : count = 1;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Instruction(
                                  id: selectedExercise[0] + 1,
                                  selectedExercise: selectedExercise,
                                  customEX: customEX,
                                  numberOfDoneExercises: 0,
                                  exName: greet,
                                )));
                  },
                  child: Text(
                    'Start Exercise',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex('#FEC62D'),
                ),
                SizedBox(
                  height: hp * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
