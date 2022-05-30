import 'package:eye_buddy/screen/training_regime/emdr/emdr3.dart';
import 'package:eye_buddy/screen/training_regime/emdr/emdr4.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class Feel extends StatefulWidget {
  @override
  _FeelState createState() => _FeelState();
}

class _FeelState extends State<Feel> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoaderImageMemory())),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'What would prefer to feel instead?',
                    style: TextStyle(color: ColorConfig.black, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    // margin: EdgeInsets.all(12),
                    height: 5 * 24.0,
                    child: TextField(
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      controller: _text,
                      decoration: InputDecoration(
                        hintText: "Enter a message",
                        errorText: _validate
                            ? 'Please Write Something and Submit again'
                            : null,
                        // fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1, color: ColorConfig.yeallow),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),

                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.red)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.3,
                ),
                Center(
                  child: MaterialButton(
                    height: h * 0.07,
                    minWidth: w * 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      setState(() {
                        _text.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                      if (_validate == false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NegetiveFeels()));
                      }
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontFamily: 'DemiBold',
                          color: colorFromHex('#181D3D')),
                    ),
                    color: colorFromHex('#FEC62D'),
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
