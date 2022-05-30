import 'dart:io';

import 'package:eye_buddy/eye_excercies/acco_spasm.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/eye_excercies/custom_excercies.dart';
import 'package:eye_buddy/eye_excercies/dry_eyes.dart';
import 'package:eye_buddy/eye_excercies/eye_muscles.dart';
import 'package:eye_buddy/eye_excercies/lazy_eye.dart';
import 'package:eye_buddy/eye_excercies/relaxation.dart';
import 'package:eye_buddy/eye_excercies/simulation.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';

// const _url = 'https://flutter.dev';

// ignore: must_be_immutable
class GreatWork extends StatefulWidget {
  int id;
  String exName;
  GreatWork({this.id, this.exName});
  @override
  _GreatWorkState createState() => _GreatWorkState(id: id, exName: exName);
}

enum Availability { loading, available, unavailable }

class _GreatWorkState extends State<GreatWork> {
  int id;
  String exName;

  _GreatWorkState({
    this.exName,
    this.id,
  });
  int count = 2;
  List<bool> isSelected = [true, false];

  //---------------------IAR_S--------------------------

  final InAppReview _inAppReview = InAppReview.instance;

  String _appStoreId = '';

  Availability _availability = Availability.loading;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        setState(() {
          _availability = isAvailable && !Platform.isAndroid
              ? Availability.available
              : Availability.unavailable;
        });
      } catch (e) {
        setState(() => _availability = Availability.unavailable);
      }
    });
    _requestReview();
  }

  void _setAppStoreId(String id) => _appStoreId = id;

  Future<void> _requestReview() => _inAppReview.requestReview();

  Future<void> _openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: _appStoreId,
      );

//----------------------IAR_E--------------------------

  @override
  Widget build(BuildContext context) {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    print(id.toString());
    print('this is exname: $exName');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: hp * 0.05),
                  child: Row(
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
                            height: 50,
                            width: hw * 0.5 - 40,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              color: count == 1
                                  ? ColorConfig.yeallow
                                  : ColorConfig.black,
                              // borderRadius: BorderRadius.only(
                              //     topLeft: Radius.circular(40),
                              //     bottomLeft: Radius.circular(40)),
                            ),
                            child: Center(
                                child:
                                    SvgPicture.asset('assets/svg/trophy.svg')),
                          ),
                          Container(
                            height: 50,
                            width: hw * 0.5 - 40,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              color: count == 2
                                  ? ColorConfig.yeallow
                                  : ColorConfig.black,
                              // borderRadius: BorderRadius.only(
                              //     topRight: Radius.circular(40),
                              //     bottomRight: Radius.circular(40)),
                            ),
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/svg/learn_mode.svg')),
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
                            // print(count);
                          });
                          // print(isSelected);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: hp * 0.02,
                ),
                count == 2
                    ? Column(
                        children: [
                          Center(
                            child: Container(
                              height: hp * 0.4,
                              width: hw * 0.4,
                              child: Lottie.asset(
                                'assets/json/great_work.json',
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: hp * 0.2,
                          // ),
                          Center(
                            child: Text(
                              'Great work',
                              style: TextStyle(
                                  color: ColorConfig.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'TTCommon'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: hp * 0.20, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  height: 40,
                                  minWidth: hw * 0.35,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home(newSelectedIndex: 3)));
                                    // print(counter);
                                  },
                                  child: Text(
                                    'Check Stats',
                                    style: TextStyle(
                                        fontFamily: 'DemiBold',
                                        color: colorFromHex('#181D3D'),
                                        fontSize: 16),
                                  ),
                                  color: colorFromHex("#FEC62D"),
                                ),
                                SizedBox(
                                  width: hw * 0.1,
                                ),
                                MaterialButton(
                                  height: 40,
                                  minWidth: hw * 0.35,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    exName == 'DryEyes'
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DryEyes()))
                                        : exName == 'AccoSpasm'
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AccoSpasm()))
                                            : exName == 'Relaxation'
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Relaxation()))
                                                : exName == 'LazyEye'
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LazyEye()))
                                                    : exName == 'Simulation'
                                                        ? Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    SimulationEye()))
                                                        : exName == 'EyeMuscles'
                                                            ? Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        EyeMuscles()))
                                                            : (exName == 'Morning') ||
                                                                    (exName ==
                                                                        'Evening')
                                                                ? Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                AllExcercies()))
                                                                : exName ==
                                                                        'AllDay'
                                                                    ? Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder: (context) => CustomExcercies()))
                                                                    : null;
                                    // print(counter);
                                  },
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                        fontFamily: 'DemiBold',
                                        color: colorFromHex('#FEC62D'),
                                        fontSize: 16),
                                  ),
                                  color: colorFromHex("#181D3D"),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              '${eyeExcerciesFiles[id - 1].title} and How this helps',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: hp * 0.45,
                            child: ListView(
                              children: [
                                Text(
                                  '${eyeExcerciesFiles[id - 1].source}',
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: hw - 40,
                            height: 40,
                            onPressed: _launchURL,
                            color: ColorConfig.yeallow,
                            child: Text('Learn More'),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(eyeExcerciesFiles[id - 1].link)
      ? await launch(eyeExcerciesFiles[id - 1].link)
      : throw 'Could not launch url';
}
