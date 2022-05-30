import 'package:eye_buddy/screen/training_regime/emdr/emdr3.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr5.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class NegetiveFeels extends StatefulWidget {
  @override
  _NegetiveFeelsState createState() => _NegetiveFeelsState();
}

class _NegetiveFeelsState extends State<NegetiveFeels> {
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
  //List selectedItems = [];
  var selectedItem;
  @override
  Widget build(BuildContext context) {
    print(selectedItem);
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoaderImageMemory())),
      child: Scaffold(
        body: Container(
          height: hp,
          width: hw,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 50, 40, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Rate how strong the negative feeling is? ',
                    style: TextStyle(
                        color: ColorConfig.black,
                        fontSize: hp * 0.03,
                        fontFamily: 'TTCommons-DemiBold',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // SizedBox(
                //   height: hp * 0.03,
                // ),
                Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              selectedItem = index;
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  hw * 0.01, 0, hw * 0.01, 0),
                              child: Card(
                                color: selectedItem == index
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
                                    '$index - ${item[index]}',
                                    style: TextStyle(fontSize: 16),
                                    textScaleFactor: 1.2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
                MaterialButton(
                  height: 40,
                  minWidth: 220,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    if (selectedItem != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NegativeBeliefs()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
