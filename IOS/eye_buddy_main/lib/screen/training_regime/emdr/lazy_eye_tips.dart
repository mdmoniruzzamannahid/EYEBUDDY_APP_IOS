import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LazyEyeTips extends StatefulWidget {
  @override
  _LazyEyeTipsState createState() => _LazyEyeTipsState();
}

class _LazyEyeTipsState extends State<LazyEyeTips> {
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
                  '1.Wear corrective lens or prescription glasses after checking up with an eye professional.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '2.wear the eyepatch over the eye that has better vision for around 2 to 6 hours daily.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '3.Children who cannot tolerate eyepatches may get the same or similar results with Bangerter filters. Bangerter filters covers the inside of eyeglass lens of dominant eye & should be worn full time.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '4.Use Medicated eye drops can be used to blur the vision in the dominant eye, making the weaker eye work harder. (Check with eye professional).',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '5.EyeBuddy Lazy eye games and exercises are designed to improve the weaker eye. Perform them daily & often to see better results with your weaker eye.',
                  style: nStyle(),
                ),
              ),
            ]),
          ),
        ));
  }
}
