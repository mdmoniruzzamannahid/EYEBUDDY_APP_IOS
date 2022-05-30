import 'package:eye_buddy/screen/training_regime/emdr/emdr5.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr7.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => NegativeBeliefs())),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: h * 0.1,
              ),
              Container(
                height: h * 0.3,
                child: SvgPicture.asset('assets/svg/assessment.svg'),
              ),
              Container(
                height: h * 0.3,
                child: Text(
                  'Assessment phase complete!',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: ColorConfig.yeallow,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Desensitization()));
                    },
                    child: Row(
                      children: [Text('Next'), Icon(Icons.arrow_right)],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              SizedBox(
                height: h * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}
