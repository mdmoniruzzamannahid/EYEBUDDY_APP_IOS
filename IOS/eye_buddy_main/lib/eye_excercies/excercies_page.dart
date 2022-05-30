import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/training_regime/training_regime.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:wakelock/wakelock.dart';

import 'package:eye_buddy/eye_excercies/acco_spasm.dart';
import 'package:eye_buddy/eye_excercies/allexcercies.dart';
import 'package:eye_buddy/eye_excercies/awsum_page.dart';
import 'package:eye_buddy/eye_excercies/custom_excercies.dart';
import 'package:eye_buddy/eye_excercies/custom_excercise_great_work.dart';
import 'package:eye_buddy/eye_excercies/dry_eyes.dart';
import 'package:eye_buddy/eye_excercies/eye_muscles.dart';
import 'package:eye_buddy/eye_excercies/great_work.dart';
import 'package:eye_buddy/eye_excercies/lazy_eye.dart';
import 'package:eye_buddy/eye_excercies/relaxation.dart';
import 'package:eye_buddy/eye_excercies/simulation.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/util/colorconfig.dart';

typedef void OnError(Exception exception);

// ignore: must_be_immutable
class ExcerciesPage extends StatefulWidget {
  int id;
  String exName;
  List selectedExercise;
  int customEX;
  int numberOfDoneExercises;

  ExcerciesPage({
    Key key,
    this.id,
    this.exName,
    this.selectedExercise,
    this.customEX,
    this.numberOfDoneExercises,
  }) : super(key: key);
  @override
  _ExcerciesPageState createState() => _ExcerciesPageState(
        id: id,
        exName: exName,
        selectedExercise: selectedExercise,
        customEX: customEX,
        numberOfDoneExercises: numberOfDoneExercises,
      );
}

class _ExcerciesPageState extends State<ExcerciesPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  int id;
  String exName;
  List selectedExercise;
  int customEX;
  int numberOfDoneExercises;
  _ExcerciesPageState({
    this.id,
    this.exName,
    this.selectedExercise,
    this.customEX,
    this.numberOfDoneExercises,
  });

  // final _vibration = Vibration;
  AudioPlayer advancedPlayer;
  AudioCache audioCache = AudioCache();
  AnimationController _controller;
  List selectedExercisesOnCEMP;
  int numberOfDoneExercisesOnCEMP;
  int numberOfRestExercisesOnCEMP;
  String link;
  String name;

  AppLifecycleState _notification;
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _init();
    initPlayer();
    Wakelock.enable();

    if (customEX == 1) {
      selectedExercisesOnCEMP = selectedExercise;
      selectedExercisesOnCEMP.removeAt(0);
      numberOfRestExercisesOnCEMP = selectedExercisesOnCEMP.length.round();
      numberOfDoneExercisesOnCEMP = numberOfDoneExercises;
      print(numberOfDoneExercisesOnCEMP);

      selectedExercisesOnCEMP.forEach((element) {
        print("cem----$element");
      });
    }

    name = eyeExcerciesFiles[id - 1].title;

    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? debugPrint('This device can vibrate')
          : debugPrint('This device cannot vibrate');
    });
  }

  @override
  void dispose() {
    print("===========================Dispose Here ============");
    WidgetsBinding.instance.removeObserver(this);
    advancedPlayer.stop();
    // Vibration.cancel();
    AudioCache().clearAll();
    _controller.dispose();
    Wakelock.disable();
    super.dispose();
  }

  // void initVbt() {
  //   id == 35
  //       ? Vibration.vibrate(
  //           pattern: [
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //             1000,
  //             50,
  //           ],
  //         )
  //       : Vibration.cancel();
  //   //     : id == 33
  //   //         ? Vibration.vibrate(
  //   //             pattern: [],
  //   //           )
  //   //         : id == 4
  //   //             ? Vibration.vibrate(
  //   //                 pattern: [],
  //   //                 // ignore: unnecessary_statements
  //   //               )
  //   //             // ignore: unnecessary_statements
  //   // : Vibration.cancel();           // ignore: unnecessary_statements
  //   //: null;
  // }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    if (eyeExcerciesFiles[id - 1].activity == 1) {
      audioCache.play(
        "movingobject.mp3",
      );
    }
    if (eyeExcerciesFiles[id - 1].activity == 2) {
      audioCache.play(
        "closed_eye_moved.mp3",
      );
    }
    if (eyeExcerciesFiles[id - 1].activity == 3) {
      audioCache.play(
        "closed_eye.mp3",
      );
    }
    if (eyeExcerciesFiles[id - 1].activity == 4) {
      audioCache.play(
        "palming.mp3",
      );
    }
    if (eyeExcerciesFiles[id - 1].id == 33) {
      audioCache.play(
        "eye_blinking.mp3",
      );
    }
  }

  // String localFilePath;
  @override
  Widget build(BuildContext context) {
    sendDataToServer() {
      try {
        print("++++++++++++++++++++++ $exName");
        var userID = FirebaseAuth.instance.currentUser.uid;
        FirebaseFirestore.instance.collection("EyeExercisePoint").doc().set({
          "userID": userID,
          "dateTime": DateTime.now(),
          "exName": exName,
          "xpPoint": 15,
          "month": DateTime.now().month,
        });
        FirebaseFirestore.instance
            .collection("UserInfo")
            .doc(userID)
            .get()
            .then((value) {
          var userXpPoint = value.data()["userXpPoint"];
          var userNewXpPoint = userXpPoint + 15;
          print(userXpPoint);
          FirebaseFirestore.instance
              .collection("UserInfo")
              .doc(userID)
              .update({"userXpPoint": userNewXpPoint});
        });
      } catch (e) {}
    }

    if (_notification == AppLifecycleState.paused) {
      print('============== AppLifecycle: Pause');
      advancedPlayer.setVolume(0.0);
    }
    if (_notification == AppLifecycleState.resumed) {
      print('============== AppLifecycle: Resume');
      advancedPlayer.setVolume(1.0);
    }

    // print(' This  is Exname: $exName');
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        dispose();
        // advancedPlayer.stop();
        // _controller.dispose();
        // Vibration.cancel();
        exName == 'DryEyes'
            ? Navigator.push(
                context, MaterialPageRoute(builder: (context) => DryEyes()))
            : exName == 'AccoSpasm'
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccoSpasm()))
                : exName == 'Relaxation'
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Relaxation()))
                    : exName == 'LazyEye'
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LazyEye()))
                        : exName == 'Simulation'
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SimulationEye()))
                            : exName == 'EyeMuscles'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EyeMuscles()))
                                : (exName == 'Morning') || (exName == 'Evening')
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AllExcercies()))
                                    : (exName == 'Day') || (exName == 'Night')
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Home(
                                                      newSelectedIndex: 1,
                                                    )))
                                        : exName == 'AllDay'
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CustomExcercies()))
                                            : exName == 'TrainingRegime'
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TrainingRegime()))
                                                : null;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            name,
            style: TextStyle(fontSize: 18, color: colorFromHex('#181D3D')),
          ),
          backgroundColor: Colors.white,
          leading: InkWell(
              child: Image.asset('assets/icon/back_arrow.png'),
              onTap: () {
                dispose();
                // advancedPlayer.stop();
                // _controller.dispose();
                // Vibration.cancel();
                exName == 'DryEyes'
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DryEyes()))
                    : exName == 'AccoSpasm'
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccoSpasm()))
                        : exName == 'Relaxation'
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Relaxation()))
                            : exName == 'LazyEye'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LazyEye()))
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
                                                (exName == 'Evening')
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AllExcercies()))
                                            : (exName == 'Day') ||
                                                    (exName == 'Night')
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              newSelectedIndex:
                                                                  1,
                                                            )))
                                                : exName == 'AllDay'
                                                    ? Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CustomExcercies()))
                                                    : exName == 'TrainingRegime'
                                                        ? Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        TrainingRegime()))
                                                        : null;
              }),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularCountDownTimer(
                    isTimerTextShown: false,
                    // Countdown duration in Seconds
                    duration: 40,

                    // Width of the Countdown Widget
                    width: 10,

                    // Height of the Countdown Widget
                    height: 10,

                    // Default Color for Countdown Timer
                    ringColor: colorFromHex("#FEC62D"),

                    // Filling Color for Countdown Timer
                    fillColor: colorFromHex('#181D3D'),

                    // Border Thickness of the Countdown Circle
                    strokeWidth: 10.0,

                    // Text Style for Countdown Text

                    // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                    isReverse: true,

                    // Function which will execute when the Countdown Ends
                    onComplete: () {
                      // Vibration.cancel();
                      // advancedPlayer.stop();
                      // _controller.dispose();
                      sendDataToServer();
                      dispose();

                      customEX == 1
                          ? numberOfRestExercisesOnCEMP == 0
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CustomExcerciseGreatWork(
                                              customExTotalXP:
                                                  numberOfDoneExercisesOnCEMP +
                                                      1)))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AwsumPage(
                                          id: id,
                                          exName: exName,
                                          selectedExercise:
                                              selectedExercisesOnCEMP,
                                          numberOfDoneExercisesFromCEMP:
                                              numberOfDoneExercisesOnCEMP)))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GreatWork(id: id, exName: exName)));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: exName == 'LazyEye'
            ? Stack(
                children: [
                  Container(
                      height: hp,
                      width: hw,
                      child: SvgPicture.asset(
                        'assets/svg/lazy_eye_bg.svg',
                        fit: BoxFit.fill,
                      )),
                  Container(
                    height: hp,
                    width: hw,
                    child: Lottie.asset(
                      'assets/excercises/${eyeExcerciesFiles[id - 1].animation}.json',
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..repeat();
                      },
                    ),
                  ),
                ],
              )
            : Container(
                // color: Colors.black,
                height: hp,
                width: hw,
                child: Lottie.asset(
                  'assets/excercises/${eyeExcerciesFiles[id - 1].animation}.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..repeat(reverse: false);
                  },
                ),
              ),
      ),
    );
  }
}
