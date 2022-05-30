import 'package:eye_buddy/screen/homepage/eye_test/visual_equity_test/instruction_right.dart';

import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class VisualEquityLeft1 extends StatefulWidget {
  int id;
  VisualEquityLeft1({this.id});
  @override
  _VisualEquityLeft1State createState() => _VisualEquityLeft1State(id: id);
}

class _VisualEquityLeft1State extends State<VisualEquityLeft1> {
  int id;
  _VisualEquityLeft1State({this.id});
  int counter = 0;
  var tap = 0;
  var textSize = 200.0;

  void _incrementCounter() {
    setState(() {
      counter++;
      print('This Is Counter: $counter');
    });
  }

  void _tapConter() {
    setState(() {
      tap++;
      print('This is Tap: $tap');
      textSize = textSize - 35.0;
      print(textSize);
    });
  }

  // void _decrementSize() {
  //   setState(() {
  //     textSize - 10;
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
                                    builder: (context) =>
                                        VisualEquityIntroRight(
                                            id: id, counter: counter)))
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
                                    builder: (context) =>
                                        VisualEquityIntroRight(
                                            id: id, counter: counter)))
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
                                    builder: (context) =>
                                        VisualEquityIntroRight(
                                            id: id, counter: counter)))
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
                                    builder: (context) =>
                                        VisualEquityIntroRight(
                                            id: id, counter: counter)))
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
