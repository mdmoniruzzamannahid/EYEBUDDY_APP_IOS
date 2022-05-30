import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:eye_buddy/screen/signup/birthday.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String genderValue;

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, hw * 0.3, 20, 0),
        children: <Widget>[
          Text(
            'Your gender',
            style: TextStyle(
              fontFamily: 'DemiBold',
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: hw * 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    genderValue = "male";
                    print("Male");
                  });
                },
                child: Container(
                  height: hp * 0.2,
                  width: hw * 0.43,
                  child: Card(
                    color: genderValue == 'male'
                        ? colorFromHex('FEC62D')
                        : colorFromHex('#FFFFFF'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/svg/male.svg',
                          ),
                        ),
                        Text('Male',
                            style: TextStyle(
                              fontFamily: 'DemiBold',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    genderValue = "female";
                    print("female");
                  });
                },
                child: Container(
                  height: hp * 0.2,
                  width: hw * 0.43,
                  child: Card(
                    color: genderValue == 'female'
                        ? colorFromHex('FEC62D')
                        : colorFromHex('#FFFFFF'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/svg/female.svg',
                          ),
                        ),
                        Text('Female',
                            style: TextStyle(
                              fontFamily: 'DemiBold',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      genderValue = "others";
                      print("others");
                    });
                  },
                  child: Container(
                    height: hp * 0.2,
                    width: hw * 0.43,
                    child: Card(
                      color: genderValue == 'others'
                          ? colorFromHex('FEC62D')
                          : colorFromHex('#FFFFFF'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/svg/others.svg',
                            ),
                          ),
                          Text('Others',
                              style: TextStyle(
                                fontFamily: 'DemiBold',
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: MaterialButton(
          height: 40,
          minWidth: 220,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            FirebaseFirestore.instance
                .collection("UserInfo")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .update({'userGender': genderValue}).then((value) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Birthday()));
            });
          },
          child: Text(
            'Done',
            style: TextStyle(
                fontFamily: 'DemiBold',
                color: colorFromHex('#181D3D'),
                fontSize: 16),
          ),
          color: colorFromHex("#FEC62D"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
