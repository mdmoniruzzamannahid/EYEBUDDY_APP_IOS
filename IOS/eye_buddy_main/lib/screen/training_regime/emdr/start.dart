import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr2.dart';
import 'package:eye_buddy/screen/training_regime/training_regime.dart';

import 'package:eye_buddy/util/colorconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartSession extends StatefulWidget {
  @override
  _StartSessionState createState() => _StartSessionState();
}

class _StartSessionState extends State<StartSession> {
  TextEditingController nameController = TextEditingController();
  var userID;
  var uname = "loading..";
  int customEX = 1; // Day 2 , Night 3
  int newId = 1;
  int count;
  List selectedExercise;
  String exName;
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
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    userID = user.uid;
    FirebaseFirestore.instance
        .collection("UserInfo")
        .doc(userID)
        .get()
        .then((value) {
      setState(() {
        this.uname = value.data()['userName'];
        print(this.uname);

        // userEyeIssues.forEach((element) {
        //   print(element);
        // });
      });
      print("------------------Username: ${value.data()['userName']}");
    });
    String morningOrEvening = greeting();

    if (morningOrEvening == "Night") {
      selectedExercise = [32, 36, 0, 35, 39];
    }

    if (morningOrEvening == "Day") {
      selectedExercise = [16, 32, 18, 35, 36];
    }
  }

  @override
  Widget build(BuildContext context) {
    String greet = greeting();
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TrainingRegime()));
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Hi ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConfig.black,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: uname.replaceAll(RegExp(' '), '_') != null
                              ? uname.replaceAll(RegExp(' '), '_')
                              : "N/A",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConfig.yeallow,
                              fontSize: 24)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: hp * 0.1, bottom: hp * 0.1),
                  child: Container(
                      height: hp * 0.4,
                      width: hw,
                      decoration: BoxDecoration(),
                      // height: 185.92,
                      // width: 259.11,
                      child: Lottie.asset(
                        'assets/burble.json',
                      )),
                ),
                MaterialButton(
                  height: hp * 0.07,
                  minWidth: hw * 0.8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Memory()));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Memory()));
                  },
                  child: Text(
                    'Start Session',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex('#FEC62D'),
                ),
                Text(
                  'Disclaimer: No data or information will be collected. This is a safe space.',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
