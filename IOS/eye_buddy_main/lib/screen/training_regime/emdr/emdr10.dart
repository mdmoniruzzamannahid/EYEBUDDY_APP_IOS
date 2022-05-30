import 'package:eye_buddy/screen/training_regime/emdr/emdr11.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr16.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr9.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class ABitBetter extends StatefulWidget {
  @override
  _ABitBetterState createState() => _ABitBetterState();
}

class _ABitBetterState extends State<ABitBetter> {
  List<String> item = [
    " No negative feeling",
    " Mildly negative",
    " Mildly negative",
    " Mildly negative",
    " Moderately negative",
    " Moderately negative",
    " Moderately negative",
    " Severely negative",
    " Severely negative",
    " Severely negative",
    " Severely negative",
  ];
  var selectedItems;
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => WhatMore())),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'How do you feel? A bit better?Rate your feelings',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedItems = index;
                            setState(() {});
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(hw * 0.01, 0, hw * 0.01, 0),
                            child: Card(
                              color: selectedItems == index
                                  ? ColorConfig.yeallow
                                  : Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(17, 5, 17, 5),
                                child: Text(
                                  '$index  - ${item[index]}',
                                  style: TextStyle(fontSize: hp * 0.02),
                                  textScaleFactor: 1.2,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  height: 40,
                  minWidth: 220,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    if (selectedItems != null) {
                      if (await Vibration.hasCustomVibrationsSupport()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VibrationInstruction()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HandTapping()));
                      }
                    }
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
    );
  }
}
