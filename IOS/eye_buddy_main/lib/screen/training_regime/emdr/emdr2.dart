import 'package:eye_buddy/screen/training_regime/emdr/emdr3.dart';
import 'package:eye_buddy/screen/training_regime/emdr/start.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class Memory extends StatefulWidget {
  @override
  _MemoryState createState() => _MemoryState();
}

class _MemoryState extends State<Memory> {
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
      onWillPop: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => StartSession())),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'What is the memory?',
                      style: TextStyle(color: ColorConfig.black, fontSize: 24),
                    ),
                  ),
                  TextField(
                    textInputAction: TextInputAction.done,
                    maxLines: 5,
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
                          borderSide: BorderSide(width: 1, color: Colors.red)),
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
                                  builder: (context) => LoaderImageMemory()));
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
      ),
    );
  }
}
