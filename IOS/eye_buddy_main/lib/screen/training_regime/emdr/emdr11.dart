import 'package:eye_buddy/screen/training_regime/emdr/emdr10.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr12.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VibrationInstruction extends StatefulWidget {
  @override
  _VibrationInstructionState createState() => _VibrationInstructionState();
}

class _VibrationInstructionState extends State<VibrationInstruction> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ABitBetter())),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Instructions',
                      style: TextStyle(
                          fontSize: 22,
                          color: ColorConfig.yeallow,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: w - 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Use both hands to grasp the phone',
                            style: TextStyle(
                                fontSize: 22,
                                color: ColorConfig.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '(turn on vibration)',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: ColorConfig.yeallow,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.07,
                    ),
                    Container(
                      width: w,
                      child: SvgPicture.asset(
                        "assets/svg/vibration.svg",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: w * 0.7,
                    child: MaterialButton(
                        color: ColorConfig.yeallow,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VibrationPage()));
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(fontSize: 20),
                        )),
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
