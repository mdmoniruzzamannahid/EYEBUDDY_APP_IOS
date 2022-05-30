import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BedTimeTips extends StatefulWidget {
  @override
  _BedTimeTipsState createState() => _BedTimeTipsState();
}

class _BedTimeTipsState extends State<BedTimeTips> {
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
                  '1. Avoid Caffeine, Alcohol, Nicotine, and Other Chemicals that Interfere with Sleep',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '2. Turn Your Bedroom into a quiet, dark, cool Sleep-Inducing Environment.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '3. Establish a Soothing Pre-Sleep Routine. For example, Taking a Bath, Reading a book or performing eye relaxation exercise. ',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '4. Go to Sleep When You’re Truly Tired',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '5. Lighten Up on Evening Meals & Balance Fluid Intake.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '6.  Do Aerobic exercise which causes the body to release endorphins and help sleep better.',
                  style: nStyle(),
                ),
              ),
            ]),
          ),
        ));
  }
}
