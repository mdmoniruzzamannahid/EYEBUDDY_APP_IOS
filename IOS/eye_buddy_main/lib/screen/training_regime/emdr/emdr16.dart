import 'package:eye_buddy/screen/training_regime/emdr/emdr15.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr17.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class HandTapping extends StatefulWidget {
  @override
  _HandTappingState createState() => _HandTappingState();
}

class _HandTappingState extends State<HandTapping> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HowDoYouFeel())),
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
                      'Hand tappings',
                      style: TextStyle(
                          fontSize: 32,
                          color: ColorConfig.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'TTCommons-DemiBold'),
                    ),
                    SizedBox(
                      height: h * 0.07,
                    ),
                    Text(
                      'Instructions:',
                      style: TextStyle(
                          fontSize: 22,
                          color: ColorConfig.yeallow,
                          fontFamily: 'TTCommons-DemiBold'),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '1. ',
                        style:
                            TextStyle(fontSize: 22, color: ColorConfig.yeallow),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Cross your hands on your shoulders.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConfig.black)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '2. ',
                        style:
                            TextStyle(fontSize: 22, color: ColorConfig.yeallow),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Then tap back and forth with your fingers',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConfig.black)),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                          height: h * 0.4,
                          width: 200,
                          child: Image.asset('assets/images/handtap.png')),
                    ),
                  ],
                ),
                Center(
                  child: MaterialButton(
                    height: 40,
                    minWidth: 220,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HandTappingPage()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
