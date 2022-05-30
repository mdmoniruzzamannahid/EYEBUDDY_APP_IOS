import 'package:eye_buddy/screen/training_regime/emdr/emdr4.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr6.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class NegativeBeliefs extends StatefulWidget {
  @override
  _NegativeBeliefsState createState() => _NegativeBeliefsState();
}

class _NegativeBeliefsState extends State<NegativeBeliefs> {
  List<String> item = [
    "Shame",
    "Guilt",
    "Others",
  ];
  var selectedItem;
  @override
  Widget build(BuildContext context) {
    print(selectedItem);
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => NegetiveFeels())),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        padding:
                            EdgeInsets.fromLTRB(hw * 0.01, 0, hw * 0.01, 0),
                        child: Card(
                          color: selectedItem == index
                              ? ColorConfig.yeallow
                              : Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                            child: Text(
                              '${index + 1} - ${item[index]}',
                              style: TextStyle(fontSize: hp * 0.02),
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              Container(
                child: selectedItem == 2
                    ? Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          // margin: EdgeInsets.all(12),
                          height: 5 * 24.0,
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: "Enter a message",
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 3, color: ColorConfig.yeallow),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          // margin: EdgeInsets.all(12),
                          height: 5 * 24.0,
                        ),
                      ),
              ),
              // Container(
              //   child: Image.asset(
              //     'assets/images/assesment.png',
              //   ),
              // ),
              MaterialButton(
                height: 40,
                minWidth: 220,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  if (selectedItem != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Assessment()));
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
    );
  }
}
