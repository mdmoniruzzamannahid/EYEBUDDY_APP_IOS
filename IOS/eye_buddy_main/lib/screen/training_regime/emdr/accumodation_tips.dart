import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';

class AccommodationTips extends StatefulWidget {
  @override
  _AccommodationTipsState createState() => _AccommodationTipsState();
}

class _AccommodationTipsState extends State<AccommodationTips> {
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
                  '1. EyeBuddy eye exercises that will help in focusing as it relaxes the ciliary muscles of eye. Perform them daily.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '2. Use corrective glasses or contact lens',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '3. Biofeedback therapy or relaxation techniques have also been recommended. You can checkout the eye relaxation and meditation exercises in EyeBuddy.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '4. Taking a vacation after a stressful event will alleviate the accommodative spasm as well.',
                  style: nStyle(),
                ),
              ),
            ]),
          ),
        ));
  }
}
