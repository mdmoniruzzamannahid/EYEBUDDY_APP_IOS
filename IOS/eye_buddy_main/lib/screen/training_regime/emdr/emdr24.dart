import 'package:eye_buddy/screen/training_regime/emdr/emdr21.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr23.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr25.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class PositivelyStrong extends StatefulWidget {
  @override
  _PositivelyStrongState createState() => _PositivelyStrongState();
}

class _PositivelyStrongState extends State<PositivelyStrong> {
  List<String> item = [
    " No positive feeling",
    " Slightly positive",
    " Slightly positive",
    " Slightly positive",
    " Moderately positive",
    " Moderately positive",
    " Moderately positive",
    " Strongly positive",
    " Strongly positive",
    " Strongly positive",
    " Strongly positive",
  ];
  var selectedItems;
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ReviewPositiveThings())),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Rate how positively strong you feel now compared to the original memory',
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
                                  '${index + 1} - ${item[index]}',
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
                  onPressed: () {
                    if (selectedItems != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SessionCompleted()));
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
