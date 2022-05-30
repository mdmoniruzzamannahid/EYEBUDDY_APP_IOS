import 'package:eye_buddy/screen/homepage/eye_test/AMD%20Test/amd_right.dart';
import 'package:eye_buddy/screen/homepage/eye_test/Astigmatism/astigmatism_right.dart';
import 'package:eye_buddy/screen/homepage/eye_test/Color%20Blind%20Test/color_blind_right.dart';
import 'package:eye_buddy/screen/homepage/eye_test/light_sensitivity_test/right/light_sensitivity_right.dart';
import 'package:eye_buddy/screen/homepage/eye_test/visual_equity_test/right/visual_equity_test_right.dart';

import 'package:eye_buddy/screen/instruction/Instruction%2017.dart';

import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VisualEquityIntroRight extends StatefulWidget {
  int id;
  int counter;
  VisualEquityIntroRight({
    this.id,
    this.counter,
  });
  @override
  _VisualEquityIntroRightState createState() =>
      _VisualEquityIntroRightState(id: id, counter: counter);
}

class _VisualEquityIntroRightState extends State<VisualEquityIntroRight> {
  int id;
  int counter;

  _VisualEquityIntroRightState({
    this.id,
    this.counter,
  });
  int slideIndex = 0;
  PageController controller;
  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 6.0,
      width: 6.0,
      // height: isCurrentPage ? 10.0 : 6.0,
      // width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        border: Border.all(color: colorFromHex('#181D3D')),
        color:
            isCurrentPage ? colorFromHex('#FEC62D') : colorFromHex('#FFFFFF'),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                Instruction17(),
              ]),
        ),
        floatingActionButton: slideIndex != 0
            ? Padding(
                padding: EdgeInsets.only(bottom: hp * 0.2),
                child: Container(
                  height: 40,
                  width: 50,
                  child: Row(
                    children: [
                      for (int i = 0; i < 1; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: MaterialButton(
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
                                builder: (context) => VisualEquityRight1(
                                    id: id, counter: counter)))
                        : id == 2
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AstigmatismRight(
                                        id: id, counter: counter)))
                            : id == 3
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LightSensitivityRight(
                                                id: id, counter: counter)))
                                : id == 4
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AstigmatismRight(
                                                id: id, counter: counter)))
                                    : id == 5
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ColorBlindRight(
                                                        id: id,
                                                        counter: counter)))
                                        : id == 6
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AmdRight(
                                                            id: id,
                                                            counter: counter)))
                                            : null;
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomSheet:
      ),
    );
  }
}
