import 'dart:io';

import 'package:eye_buddy/assets/BottomIcon.dart';
import 'package:eye_buddy/screen/signin/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eye_buddy/screen/homepage/profile.dart';
import 'package:eye_buddy/screen/homepage/share.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'discover.dart';
import 'prad.dart';
import 'profile.dart';
import 'train.dart';

class Home extends StatefulWidget {
  var newSelectedIndex;
  Home({this.newSelectedIndex, int newSelectedindex});
  @override
  //_HomeState createState() => _HomeState();
  _HomeState createState() => _HomeState(newSelectedIndex: newSelectedIndex);
}

class _HomeState extends State<Home> {
  var newSelectedIndex;
  _HomeState({this.newSelectedIndex});

  // Properties & Variables needed

  int _selectedIndex = 3;
  //int currentTab = 1; // to keep track of active tab index

  // to store nested tabs
// Our first view in viewport

  List<Widget> screens = [];
  @override
  void initState() {
    super.initState();

    _selectedIndex = newSelectedIndex;
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => Auth()));
        setState(() {
          this.screens = [
            Discover(),
            Train(),
            Prad(),
            _blurStats(),
            LoginScreen()
          ];
        });

        print('User is currently signed out!');
      } else {
        setState(() {
          this.screens = [Discover(), Train(), Prad(), Stats(), Profile()];
        });

        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Stack(
          overflow: Overflow.visible,
          children: [
            screens[_selectedIndex],
            Positioned(
              bottom: 0,
              child: Container(
                width: w,
                height: 60,
                color: colorFromHex('#181D3D'),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/icon/prad.svg',
                        height: 120,
                        width: 120,
                      ),
                      onTap: () {
                        _onItemTapped(2);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 25,
              bottom: 5,
              child: InkWell(
                child: _selectedIndex == 0
                    ? Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: ColorConfig.black,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.0)),
                                  border:
                                      Border.all(color: ColorConfig.yeallow)),
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.search,
                                color: ColorConfig.yeallow,
                                size: 30,
                              )),
                          SizedBox(height: 1),
                          Text(
                            'Discover',
                            style: TextStyle(color: ColorConfig.yeallow),
                          )
                        ],
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.search,
                          color: ColorConfig.yeallow,
                          size: 30,
                        ),
                      ),
                onTap: () {
                  _onItemTapped(0);
                },
              ),
            ),
            Positioned(
              left: w * 0.2 + 25,
              bottom: 5,
              child: InkWell(
                child: _selectedIndex == 1
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: ColorConfig.black,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.0)),
                                border: Border.all(color: ColorConfig.yeallow)),
                            height: 50,
                            width: 50,
                            child: Container(
                              height: 10,
                              width: 10,
                              child: Icon(
                                BottomIcon.weightlifting,
                                size: 20,
                                color: ColorConfig.yeallow,
                              ),
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Train',
                            style: TextStyle(color: ColorConfig.yeallow),
                          )
                        ],
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          BottomIcon.weightlifting,
                          size: 20,
                          color: ColorConfig.yeallow,
                        ),
                      ),
                onTap: () {
                  _onItemTapped(1);
                },
              ),
            ),
            Positioned(
              right: w * 0.2 + 25,
              bottom: 5,
              child: InkWell(
                child: _selectedIndex == 3
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConfig.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0)),
                              border: Border.all(color: ColorConfig.yeallow),
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              BottomIcon.bar_chart,
                              color: ColorConfig.yeallow,
                              size: 15,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Stats',
                            style: TextStyle(color: ColorConfig.yeallow),
                          )
                        ],
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          BottomIcon.bar_chart,
                          color: ColorConfig.yeallow,
                          size: 15,
                        ),
                      ),
                onTap: () {
                  _onItemTapped(3);
                },
              ),
            ),
            Positioned(
              right: 25,
              bottom: 5,
              child: InkWell(
                child: _selectedIndex == 4
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: ColorConfig.black,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0)),
                              border: Border.all(color: ColorConfig.yeallow),
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              BottomIcon.user,
                              color: ColorConfig.yeallow,
                              size: 30,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Profile',
                            style: TextStyle(color: ColorConfig.yeallow),
                          )
                        ],
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          BottomIcon.user,
                          color: ColorConfig.yeallow,
                          size: 20,
                        ),
                      ),
                onTap: () {
                  _onItemTapped(4);
                },
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 25,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     child: InkWell(
            //       child: _selectedIndex == 4
            //           ? Column(
            //               children: [
            //                 Container(
            //                   decoration: BoxDecoration(
            //                       color: ColorConfig.black,
            //                       borderRadius: BorderRadius.vertical(
            //                           top: Radius.circular(30.0)),
            //                       border: Border.all(color: ColorConfig.yeallow)),
            //                   height: 50,
            //                   width: 50,
            //                   child: Icon(
            //                     BottomIcon.user,
            //                     size: 20,
            //                     color: ColorConfig.yeallow,
            //                   ),
            //                 ),
            //                 SizedBox(height: 1),
            //                 Text(
            //                   'Profile',
            //                   style: TextStyle(color: ColorConfig.yeallow),
            //                 )
            //               ],
            //             )
            //           : Icon(
            //               BottomIcon.user,
            //               size: 20,
            //               color: ColorConfig.yeallow,
            //             ),
            //       onTap: () {
            //         _onItemTapped(4);
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {},
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // bottomNavigationBar: ConvexAppBar(
        //   backgroundColor: colorFromHex('#181D3D'),
        //   color: colorFromHex('#FEC62D'),
        //   activeColor: colorFromHex('#FEC62D'),
        //   style: TabStyle.react,
        //   items: [
        //     TabItem(
        //       icon: Icons.search,
        //       title: 'Discover',
        //     ),
        //     TabItem(
        //         icon: SvgPicture.asset('assets/icon/weightlifting.svg'),
        //         title: 'Train'),
        //     TabItem(
        //       icon: Image(
        //         height: 200,
        //         width: 200,
        //         image: AssetImage('assets/icon/eye.png'),
        //       ),
        //     ),
        //     TabItem(
        //         icon: SvgPicture.asset('assets/icon/bar-chart.svg'),
        //         title: 'Stats'),
        //     TabItem(
        //         icon: SvgPicture.asset('assets/icon/user.svg'), title: 'Profile'),
        //   ],
        //   // initialActiveIndex: 1 /optional/,
        //   onTap: onItemTapped,
        //   initialActiveIndex: selectedIndex,
        // ),
      ),
    );
  }

  _blurStats() {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    return Container(
      height: hp,
      width: hw,
      child: Stack(
        children: [
          Container(
            height: hp,
            width: hw,
            child: Image.asset(
              'assets/images/blur_stats.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
              height: hp,
              width: hw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    height: hp * 0.07,
                    minWidth: hw * 0.6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(
                                  newSelectedIndex: 4,
                                )),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'DemiBold',
                          color: colorFromHex('#181D3D')),
                    ),
                    color: colorFromHex('#FEC62D'),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm'),
              content: Text('Do you want to exit the App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false); //Will not exit the App
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    //Navigator.of(context).pop(true); //Will exit the App
                    exit(0);
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
    setState(() {});
  }
}
