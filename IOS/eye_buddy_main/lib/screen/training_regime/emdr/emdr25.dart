import 'package:eye_buddy/screen/training_regime/training_regime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionCompleted extends StatefulWidget {
  @override
  _SessionCompletedState createState() => _SessionCompletedState();
}

class _SessionCompletedState extends State<SessionCompleted> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => TrainingRegime())),
      child: Scaffold(
        body: SafeArea(
          left: false, right: false,
          // bottom: true,
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => TrainingRegime())),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Session Completed!',
                        style: TextStyle(
                            fontSize: hp * 0.05, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Hope you have an awesome day! ',
                        style: TextStyle(
                            fontSize: hp * 0.03, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: hw - 40,
                  height: hp * 0.3,
                  child: SvgPicture.asset(
                    "assets/svg/sessionheader.svg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: hw,
                  child: SvgPicture.asset(
                    "assets/svg/sessionfooter.svg",
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
