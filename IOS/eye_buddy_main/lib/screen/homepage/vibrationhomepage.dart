import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class VibrateHomepage extends StatefulWidget {
  @override
  _VibrateHomepageState createState() => _VibrateHomepageState();
}

class _VibrateHomepageState extends State<VibrateHomepage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Vibration Plugin example app'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Vibrate for default 500ms'),
                    onPressed: () {
                      Vibration.vibrate();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Vibrate for 1000ms'),
                    onPressed: () {
                      Vibration.vibrate(duration: 1000);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Vibrate with pattern'),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text(
                          'Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate 2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s',
                        ),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                      Vibration.vibrate(
                        pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Vibrate with pattern and amplitude'),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text(
                          'Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate 2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s',
                        ),
                      );

                      Scaffold.of(context).showSnackBar(snackBar);
                      Vibration.vibrate(
                        pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                        intensities: [128, 255, 64, 255],
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Core Haptic Support'),
                    onPressed: () async {
                      if (await Vibration.hasCustomVibrationsSupport()) {
                        Vibration.vibrate(duration: 1000);
                        _value = 1;
                        print(_value);
                      } else {
                        Vibration.vibrate();
                        await Future.delayed(Duration(milliseconds: 500));
                        Vibration.vibrate();
                        _value = 2;
                        print(_value);
                      }
                    },
                  ),
                  Center(
                      child: Text(
                    _value == 0
                        ? ''
                        : _value == 1
                            ? "Your Device Support Core hapticFeedBack"
                            : _value == 2
                                ? 'Your Device Doesn\'t Support Core HapticFeedback'
                                : null,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
