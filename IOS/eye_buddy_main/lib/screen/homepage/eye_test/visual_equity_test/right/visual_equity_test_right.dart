import 'package:eye_buddy/screen/homepage/eye_test/visual_equity_test/result.dart';

import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisualEquityRight1 extends StatefulWidget {
  int counter;
  int id;

  VisualEquityRight1({this.id, this.counter});
  @override
  _VisualEquityRight1State createState() =>
      _VisualEquityRight1State(id: id, counter: counter);
}

class _VisualEquityRight1State extends State<VisualEquityRight1> {
  int id;
  int counter;
  _VisualEquityRight1State({this.id, this.counter});
  int counter2 = 0;
  var tap = 0;
  var textSize = 200.0;

  void _tapConter() {
    setState(() {
      tap++;
      print('This is Tap: $tap');
      textSize = textSize - 35.0;
      print(textSize);
    });
  }
  // ignore: unused_field

  void _incrementCounter() {
    setState(() {
      counter2++;
      print('This Is counter 2: $counter2');
    });
  }

  // void _decrementSize() {
  //   setState(() {
  //     textSize- 10;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 100, 25, 100),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _tapConter();
                        tap == 1 || tap == 5 ? _incrementCounter() : null;
                        tap == 5
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EyeTestResult(
                                          id: id,
                                          counter: counter,
                                          counter2: counter2,
                                        )))
                            : null;
                      },
                      child: SvgPicture.asset(
                          'assets/svg/eye_test/arrow/up_arrow.svg'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // textSize = textSize - 10.0;
                        _tapConter();
                        tap == 2 ? _incrementCounter() : null;
                        tap == 5
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EyeTestResult(
                                          id: id,
                                          counter: counter,
                                          counter2: counter2,
                                        )))
                            : null;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => VisualEquityLeft2(
                        //             id: id, counter: counter)));
                      },
                      child: SvgPicture.asset(
                          'assets/svg/eye_test/arrow/left_arrow.svg'),
                    ),
                    RotatedBox(
                      quarterTurns: tap == 0
                          ? 3
                          : tap == 1
                              ? 2
                              : tap == 2
                                  ? 4
                                  : tap == 3
                                      ? 1
                                      : 3,
                      child: RichText(
                        text: TextSpan(
                          text: 'E',
                          style: TextStyle(
                              fontSize: textSize, color: ColorConfig.black),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _tapConter();
                        tap == 3 ? _incrementCounter() : null;

                        // textSize = textSize - 10.0;
                        tap == 5
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EyeTestResult(
                                          id: id,
                                          counter: counter,
                                          counter2: counter2,
                                        )))
                            : null;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => VisualEquityLeft2(
                        //             id: id, counter: counter)));
                      },
                      child: SvgPicture.asset(
                          'assets/svg/eye_test/arrow/right_arrow.svg'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _tapConter();
                        tap == 4 ? _incrementCounter() : null;
                        // _incrementCounter();
                        tap == 5
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EyeTestResult(
                                          id: id,
                                          counter: counter,
                                          counter2: counter2,
                                        )))
                            : null;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => VisualEquityLeft2(
                        //             id: id, counter: counter)));
                      },
                      child: SvgPicture.asset(
                          'assets/svg/eye_test/arrow/down_arrow.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
