import 'package:eye_buddy/screen/training_regime/emdr/emdr6.dart';
import 'package:eye_buddy/screen/training_regime/emdr/leftrightexercise.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class Desensitization extends StatefulWidget {
  @override
  _DesensitizationState createState() => _DesensitizationState();
}

class _DesensitizationState extends State<Desensitization> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Assessment())),
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
                      'Desensitization phase',
                      style: TextStyle(
                          fontSize: 32,
                          color: ColorConfig.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: h * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Instructions:',
                        style:
                            TextStyle(fontSize: 22, color: ColorConfig.yeallow),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: '1. ',
                          style: TextStyle(
                              fontSize: 22, color: ColorConfig.yeallow),
                          children: const <TextSpan>[
                            TextSpan(
                                text:
                                    'Keep the feelings of negative beliefs and image in your mind. Then do the exercise.',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConfig.black)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: '2. ',
                          style: TextStyle(
                              fontSize: 22, color: ColorConfig.yeallow),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Follow the moving object.',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConfig.black)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: '3. ',
                          style: TextStyle(
                              fontSize: 22, color: ColorConfig.yeallow),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Move Eyes left to right.',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConfig.black)),
                          ],
                        ),
                      ),
                    ),
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
                                  builder: (context) => LeftRight(id: 1)));
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
