import 'package:eye_buddy/screen/calender_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../homepage/home.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  void initState() {
    // TODO: implement initState

    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection("UserInfo")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get()
          .then((value) {
        print(value.data()['userBirthday'].toDate());
        if (DateTime.now().toString().split(" ")[0] ==
            value.data()['userBirthday'].toDate().toString().split(" ")[0]) {
          print("++++++++++++++++++++++++++++++++++++++ Success!!!");
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
                                        child: Column(
                                          children: [
                                            Text(
                                              'Happy Birth Day ${value.data()['userName'].toString().split(" ")[0]}!',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Happy birth day to you - From the whole Eye Buddy Team',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
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
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Thank You',
                                            style: TextStyle(
                                                fontFamily: 'DemiBold',
                                                color: colorFromHex('#FFFFFF')),
                                          ),
                                          color: colorFromHex('#FEC62D'),
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
                                    // child: Image.asset(
                                    //     'assets/images/instagram.png')),
                                    child: CircleAvatar(
                                        backgroundImage: value
                                                    .data()['userProfileImage']
                                                    .toString() ==
                                                ""
                                            ? AssetImage(
                                                'assets/images/blank_profile.png')
                                            : NetworkImage(value
                                                .data()['userProfileImage']
                                                .toString())))),
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
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorFromHex('FFFFFF'),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: hp * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Image.asset("assets/logo.png", height: hp * 0.08),
              ),
            ),
            Container(
              height: hp * 0.5,
              color: Colors.white70,
              padding: EdgeInsets.only(top: hp * 0.05, bottom: hp * 0.05),
              child: Center(
                child: Lottie.asset('assets/dumble.json', height: hp * 0.5),
              ),
            ),
            Container(
              height: hp * 0.1,
              width: hw * 0.8,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: MaterialButton(
          height: 45,
          minWidth: hw * 0.85,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        newSelectedIndex: 1,
                      )),
            );
          },
          child: Text(
            'Enter the Eye Gym',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'DemiBold',
                fontWeight: FontWeight.w600,
                color: colorFromHex('#181D3D')),
          ),
          color: colorFromHex("#FEC62D"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
