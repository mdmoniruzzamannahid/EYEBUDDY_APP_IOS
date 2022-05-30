import 'package:eye_buddy/screen/training_regime/emdr/emdr14.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr19.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr22.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr24.dart';
import 'package:eye_buddy/screen/training_regime/emdr/round-button.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ReviewPositiveThings extends StatefulWidget {
  @override
  _ReviewPositiveThingsState createState() => _ReviewPositiveThingsState();
}

class _ReviewPositiveThingsState extends State<ReviewPositiveThings>
    with TickerProviderStateMixin {
  AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration * controller.value;
    return controller.isDismissed
        ? '${controller.duration.inHours}:${(controller.duration.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
  bool navigate = false;

  void notify() {
    if (countText == '0:00:00') {
      // FlutterRingtonePlayer.playNotification();
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Feel()));
    }
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    if (controller.isCompleted == true) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PositivelyStrong()),
            (route) => false);
      });
    }
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => RateNow())),
      child: Scaffold(
        backgroundColor: Color(0xfff5fbff),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  width: w * 0.8,
                  child: Text(
                    'Review the positive things you did so far',
                    style: TextStyle(
                        fontSize: w * 0.05,
                        color: ColorConfig.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 275,
                      height: 275,
                      child: CircularProgressIndicator(
                        backgroundColor: ColorConfig.yeallow,
                        value: 0,
                        strokeWidth: 5,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: CircularProgressIndicator(
                        backgroundColor: colorFromHex('#181D3D'),
                        value: progress,
                        strokeWidth: 20,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.isDismissed) {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              child: CupertinoTimerPicker(
                                initialTimerDuration: controller.duration,
                                onTimerDurationChanged: (time) {
                                  setState(() {
                                    controller.duration = time;
                                  });
                                },
                              ),
                            ),
                          );
                        }
                      },
                      child: AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (controller.isAnimating) {
                                          controller.stop();
                                          setState(() {
                                            isPlaying = false;
                                          });
                                        } else {
                                          controller.forward(
                                              from: controller.value == 1.0
                                                  ? 0
                                                  : controller.value);
                                          setState(() {
                                            isPlaying = true;
                                          });
                                        }
                                      },
                                      child: RoundButton(
                                        icon: isPlaying == true
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
