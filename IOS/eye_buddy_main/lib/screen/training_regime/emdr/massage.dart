import 'package:eye_buddy/screen/training_regime/emdr/emdr3_1.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';

class Massage extends StatefulWidget {
  @override
  _MassageState createState() => _MassageState();
}

class _MassageState extends State<Massage> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            maxLines: 5,
            controller: _text,
            decoration: InputDecoration(
              hintText: "Enter a message",
              errorText:
                  _validate ? 'Please Write Something and Submit again' : null,
              // fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: ColorConfig.yeallow),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(4)),
              //   borderSide: BorderSide(width: 1, color: Colors.black),
              // ),

              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _text.text.isEmpty ? _validate = true : _validate = false;
              });
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.black),
            ),
            // style: ButtonStyle(foregroundColor: Colors.lightBlueAccent),
          )
        ],
      ),
    );
  }
}
