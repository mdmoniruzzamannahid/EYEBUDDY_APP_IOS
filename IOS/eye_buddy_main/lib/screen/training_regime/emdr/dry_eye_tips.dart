import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DryEyeTips extends StatefulWidget {
  @override
  _DryEyeTipsState createState() => _DryEyeTipsState();
}

class _DryEyeTipsState extends State<DryEyeTips> {
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
                  'For Mild to Moderate Cases of Dry Eyes:',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '1. Use protective eyewear to block dry air',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '3. Position the computer screen below eye level',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '4. Avoid exposure to smoke',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '5. Use artificial tears',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '6. Exercise the eyes at frequent intervals by blinking & closing the eyes',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '7. Eat a diet rich in Vitamin A (liver, carrots, and broccoli)',
                  style: nStyle(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Online Communities that help with Dry eyes:',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Join the Dry Eyes Reddit Community',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      'Link: ',
                      style: nStyle(),
                    ),
                    GestureDetector(
                        child: Text("https://www.reddit.com/r/Dryeyes/",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontSize: 18)),
                        onTap: () async {
                          final url = 'https://www.reddit.com/r/Dryeyes/';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        })
                  ],
                ),
              ),
              Text(
                'Online Dry Eye Forum:',
                style: nStyle(),
              ),
              GestureDetector(
                  child: Text("https://forum.dryeyezone.com/",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 18)),
                  onTap: () async {
                    final url = 'https://forum.dryeyezone.com/';
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                      );
                    }
                  }),
              Text(
                'EyeBuddy Dry Eye Forum: Connecting Patients with our Dry Eye Specialists',
                style: nStyle(),
              ),
              Text(
                '(Coming Soon...)',
                style: nStyle(),
              ),
            ]),
          ),
        ));
  }
}
