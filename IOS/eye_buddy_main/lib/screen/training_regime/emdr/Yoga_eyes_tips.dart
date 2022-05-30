import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';

class YogaEyesTips extends StatefulWidget {
  @override
  _YogaEyesTipsState createState() => _YogaEyesTipsState();
}

class _YogaEyesTipsState extends State<YogaEyesTips> {
  @override
  Widget build(BuildContext context) {
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
            'Tips',
            style: TextStyle(
              fontFamily: 'TT Commons DemiBold',
              fontSize: 18,
              color: const Color(0xff181d3d),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Additional tips:',
                style: bStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '1. Do the eye exercises while focusing on your breathing pattern.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '2. After completing all eye relaxation exercises, lie in shavasan (corpse pose) for a few minutes and relax completely.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '3. Breathe gently and normally, and do not resist any thoughts or sensations during the exercise.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '4. Always recommended to splash your eyes with cold water a few times.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '5. Pay attention to your blinking and focus on blinking more often.',
                  style: nStyle(),
                ),
              ),
            ]),
          ),
        ));
  }
}
