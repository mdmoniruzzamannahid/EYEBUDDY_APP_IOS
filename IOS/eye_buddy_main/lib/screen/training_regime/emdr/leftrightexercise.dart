import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr10.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr22.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr23.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr8.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr9.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wakelock/wakelock.dart';
import 'package:eye_buddy/util/colorconfig.dart';

// ignore: must_be_immutable
class LeftRight extends StatefulWidget {
  int id;
  LeftRight({this.id});

  @override
  _LeftRightState createState() => _LeftRightState(
        id: id,
      );
}

class _LeftRightState extends State<LeftRight> with TickerProviderStateMixin {
  int id;

  _LeftRightState({
    this.id,
  });

  // final _vibration = Vibration;
  AudioPlayer advancedPlayer;
  AudioCache audioCache = AudioCache();
  AnimationController _controller;

  // AppLifecycleState _notification;
// .;'*-

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    initPlayer();
    Wakelock.enable();
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print("===========================Dispose Here ============");
    // WidgetsBinding.instance.removeObserver(this);
    advancedPlayer.stop();
    // Vibration.cancel();
    AudioCache().clearAll();
    _controller.dispose();
    Wakelock.disable();

    super.dispose();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    audioCache.play(
      "movingobject.mp3",
    );
  }

  // String localFilePath;
  @override
  Widget build(BuildContext context) {
    //   if (_notification == AppLifecycleState.paused) {
    //     print('============== AppLifecycle: Pause');
    //     advancedPlayer.setVolume(0.0);
    //   }
    //   if (_notification == AppLifecycleState.resumed) {
    //     print('============== AppLifecycle: Resume');
    //     advancedPlayer.setVolume(1.0);
    //   }

    // print(' This  is Exname: $exName');
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        dispose();
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Left Right Move",
            style: TextStyle(fontSize: 18, color: colorFromHex('#181D3D')),
          ),
          backgroundColor: Colors.white,
          // leading: InkWell(
          //     child: Image.asset('assets/icon/back_arrow.png'),
          //     onTap: () {
          //       dispose();
          //       SchedulerBinding.instance.addPostFrameCallback((_) {
          //         Navigator.popAndRemoveUntil(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (BuildContext context) =>
          //                     WhatMoreHappened()),
          //             (route) => false);
          //       });
          //       Navigator.pop(context);
          //     }),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularCountDownTimer(
                    isTimerTextShown: false,
                    duration: 10,
                    width: 10,
                    height: 10,
                    ringColor: colorFromHex("#FEC62D"),
                    fillColor: colorFromHex('#181D3D'),
                    strokeWidth: 10.0,
                    isReverse: true,
                    onComplete: () {
                      dispose();

                      id == 1
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HappenedThatDay()),
                              (Route<dynamic> route) => false)
                          : id == 2
                              ? Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WhatMore()),
                                  (Route<dynamic> route) => false)
                              : id == 3
                                  ? Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ABitBetter()),
                                      (Route<dynamic> route) => false)
                                  : id == 4
                                      ? Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => RateNow()),
                                          (Route<dynamic> route) => false)
                                      : id == 5
                                          ? Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReviewPositiveThings()),
                                              (Route<dynamic> route) => false)
                                          // ignore: unnecessary_statements
                                          : null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          // color: Colors.black,
          height: hp,
          width: hw,
          child: Lottie.asset(
            'assets/excercises/left_right_move.json',
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
