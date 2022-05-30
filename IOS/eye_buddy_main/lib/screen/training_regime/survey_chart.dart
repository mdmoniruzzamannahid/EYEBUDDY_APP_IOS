import 'package:eye_buddy/screen/training_regime/dry_eye_treatment.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import "package:flutter/material.dart";

class SurveyChart extends StatefulWidget {
  @override
  _SurveyChartState createState() => _SurveyChartState();
}

class _SurveyChartState extends State<SurveyChart> {
  Map<int, int> quesAns = {};
  double result;
  int q1 = 0;
  int q2 = 0;
  int q3 = 0;
  int q4 = 0;
  int q5 = 0;
  int q6 = 0;
  int q7 = 0;
  int q8 = 0;
  int q9 = 0;
  int q10 = 0;
  int q11 = 0;
  int q12 = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(
                context,
              );
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'SURVEY CHART',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        width: w,
        height: h,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              Text(
                'Have you experienced any of the following during the last week:',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '1. Eyes that are sensitive to light?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // print(quesAns.toString());
                            q1 = 4;
                            quesAnsValue(1, q1);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q1 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q1 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q1 = 3;
                            quesAnsValue(1, q1);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q1 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q1 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q1 = 2;
                            quesAnsValue(1, q1);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q1 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q1 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q1 = 1;
                            quesAnsValue(1, q1);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q1 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q1 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q1 = 0;
                            quesAnsValue(1, q1);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q1 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q1 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '2. Eyes that feel gritty?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q2 = 4;
                            quesAnsValue(2, q2);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q2 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q2 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q2 = 3;
                            quesAnsValue(2, q2);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q2 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q2 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q2 = 2;
                            quesAnsValue(2, q2);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q2 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q2 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q2 = 1;
                            quesAnsValue(2, q2);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q2 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q2 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q2 = 0;
                            quesAnsValue(2, q2);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q2 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q2 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '3. Painful or sore eyes?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q3 = 4;
                            quesAnsValue(3, q3);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q3 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q3 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q3 = 3;
                            quesAnsValue(3, q3);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q3 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q3 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q3 = 2;
                            quesAnsValue(3, q3);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q3 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q3 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q3 = 1;
                            quesAnsValue(3, q3);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q3 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q3 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q3 = 0;
                            quesAnsValue(3, q3);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q3 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q3 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '4. Blurred vision?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q4 = 4;
                            quesAnsValue(4, q4);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q4 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q4 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q4 = 3;
                            quesAnsValue(4, q4);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q4 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q4 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q4 = 2;
                            quesAnsValue(4, q4);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q4 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q4 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q4 = 1;
                            quesAnsValue(4, q4);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q4 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q4 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q4 = 0;
                            quesAnsValue(4, q4);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q4 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q4 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '5. Poor vision?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q5 = 4;
                            quesAnsValue(5, q5);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q5 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q5 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q5 = 3;
                            quesAnsValue(5, q5);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q5 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q5 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q5 = 2;
                            quesAnsValue(5, q5);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q5 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q5 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q5 = 1;
                            quesAnsValue(5, q5);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q5 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q5 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q5 = 0;
                            quesAnsValue(5, q5);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q5 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q5 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Have problems with your eyes limited you in performing any of the following during the last week:',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '6. Reading?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q6 = 4;
                            quesAnsValue(6, q6);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q6 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q6 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q6 = 3;
                            quesAnsValue(6, q6);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q6 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q6 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q6 = 2;
                            quesAnsValue(6, q6);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q6 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q6 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q6 = 1;
                            quesAnsValue(6, q6);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q6 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q6 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q6 = 0;
                            quesAnsValue(6, q6);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q6 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q6 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '7. Driving at night?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q7 = 4;
                            quesAnsValue(7, q7);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q7 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q7 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q7 = 3;
                            quesAnsValue(7, q7);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q7 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q7 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q7 = 2;
                            quesAnsValue(7, q7);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q7 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q7 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q7 = 1;
                            quesAnsValue(7, q7);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q7 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q7 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q7 = 0;
                            quesAnsValue(7, q7);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q7 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q7 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '8. Working with a computer or bank machine (ATM)?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q8 = 4;
                            quesAnsValue(8, q8);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q8 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q8 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q8 = 3;
                            quesAnsValue(8, q8);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q8 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q8 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q8 = 2;
                            quesAnsValue(8, q8);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q8 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q8 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q8 = 1;
                            quesAnsValue(8, q8);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q8 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q8 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q8 = 0;
                            quesAnsValue(8, q8);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q8 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q8 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '9. Watching TV?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q9 = 4;
                            quesAnsValue(9, q9);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q9 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q9 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q9 = 3;
                            quesAnsValue(9, q9);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q9 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q9 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q9 = 2;
                            quesAnsValue(9, q9);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q9 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q9 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q9 = 1;
                            quesAnsValue(9, q9);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q9 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q9 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q9 = 0;
                            quesAnsValue(9, q9);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q9 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q9 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Have your eyes felt uncomfortable in any of the following situations during the last week:',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '10. Windy conditions?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q10 = 4;
                            quesAnsValue(10, q10);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q10 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q10 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q10 = 3;
                            quesAnsValue(10, q10);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q10 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q10 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q10 = 2;
                            quesAnsValue(10, q10);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q10 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q10 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q10 = 1;
                            quesAnsValue(10, q10);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q10 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q10 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q10 = 0;
                            quesAnsValue(10, q10);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q10 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q10 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '11. Places or areas with ow humidity (very dry)?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q11 = 4;
                            quesAnsValue(11, q11);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q11 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q11 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q11 = 3;
                            quesAnsValue(11, q11);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q11 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q11 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q11 = 2;
                            quesAnsValue(11, q11);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q11 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q11 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q11 = 1;
                            quesAnsValue(11, q11);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q11 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q11 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q11 = 0;
                            quesAnsValue(11, q11);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q11 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q11 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '12. Areas that are air conditioned?',
                style: TextStyle(
                  fontFamily: 'TT Commons DemiBold',
                  fontSize: 18,
                  color: const Color(0xff181d3d),
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: w - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q12 = 4;
                            quesAnsValue(12, q12);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q12 == 4
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: w * 0.08,
                                      fontWeight: FontWeight.bold,
                                      color: q12 == 4
                                          ? Colors.white
                                          : colorFromHex('#FEC62D'),
                                    ),
                                  ),
                                  Text(
                                    'All of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q12 = 3;
                            quesAnsValue(12, q12);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q12 == 3
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q12 == 3
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Most of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q12 = 2;
                            quesAnsValue(12, q12);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q12 == 2
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q12 == 2
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Half of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q12 = 1;
                            quesAnsValue(12, q12);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q12 == 1
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q12 == 1
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Some of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            q12 = 0;
                            quesAnsValue(12, q12);
                          });
                        },
                        child: Container(
                          width: (w - 40) * 0.18,
                          decoration: BoxDecoration(
                            color: q12 == 0
                                ? colorFromHex('#FEC62D')
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x181D3D).withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 40,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Container(
                              width: (w - 40) * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                        fontSize: w * 0.08,
                                        color: q12 == 0
                                            ? Colors.white
                                            : colorFromHex('#FEC62D'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'None of the time',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: MaterialButton(
                  height: 45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Survey Result'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text("Your score is: ${result.toString()}"),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DryEyesTreatment()));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'DemiBold',
                        fontWeight: FontWeight.w600,
                        color: colorFromHex('#181D3D')),
                  ),
                  color: colorFromHex("#FEC62D"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void quesAnsValue(ques, ans) {
    quesAns.update(ques, (dynamic val) => ans, ifAbsent: () => ans);
    print(quesAns.toString());
    print(quesAns.keys.length);
    print(quesAns.values.reduce((value, element) => value + element));
    result = quesAns.values.reduce((value, element) => value + element) *
        25 /
        quesAns.length;
  }
}
