import 'package:flutter/material.dart';

import 'package:eye_buddy/screen/training_regime/emdr/emdr20.dart';
import 'package:eye_buddy/screen/training_regime/emdr/leftrightexercise.dart';
import 'package:eye_buddy/util/colorconfig.dart';

class PositiveFeeling extends StatefulWidget {
  int id;
  PositiveFeeling({
    this.id,
  });
  @override
  _PositiveFeelingState createState() => _PositiveFeelingState(id: id);
}

class _PositiveFeelingState extends State<PositiveFeeling> {
  int id;

  _PositiveFeelingState({
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ExerciseComplete())),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Now, Lets improve your preferred positive feeling.',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Keep the positive feelings in mind and do the exercise',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                MaterialButton(
                  height: 40,
                  minWidth: 220,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    id == 1
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeftRight(
                                      id: 4,
                                    )))
                        : id == 2
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LeftRight(id: 5)))
                            : null;
                  },
                  child: Text(
                    'Start Exercise',
                    style: TextStyle(
                        fontFamily: 'DemiBold',
                        color: colorFromHex('#181D3D'),
                        fontSize: 16),
                  ),
                  color: colorFromHex("#FEC62D"),
                ),
              ],
            ),
          ),
          bottom: true,
        ),
      ),
    );
  }
}
