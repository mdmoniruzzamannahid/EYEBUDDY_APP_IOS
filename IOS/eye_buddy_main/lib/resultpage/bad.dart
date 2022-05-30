import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/model/eye_test_model.dart';
import 'package:eye_buddy/screen/homepage/eye_test/eye_test.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Bad extends StatelessWidget {
  int id;
  Bad({this.id});
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.push(
            context, MaterialPageRoute<void>(builder: (context) => EyeTest()));
      },
      child: Scaffold(
        body: Center(
          child: ListView(children: <Widget>[
            Column(
              children: [
                Container(
                    height: hp * .2, child: Lottie.asset('assets/3.json')),
                Image.asset("assets/images/sad.png"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Result",
                    style: TextStyle(fontSize: 30, fontFamily: 'TTCommons'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    id == 1
                        ? "You seem to have difficulties recognising small characters with both eyes."
                        : id == 2
                            ? "You seem to see some lines that are darker than others with one of your eyes."
                            : id == 3
                                ? "You have difficulties in seeing subtle contrasts with both eyes."
                                : id == 4
                                    ? "You cannot read all the text from 40cm away."
                                    : id == 5
                                        ? "You most likely have some colour vision difficulties."
                                        : id == 6
                                            ? "You saw distortions in the grid with both eyes. It's possible that this symptom is potentially linked to age-related macular degeneration (AMD)."
                                            : null,
                    style: TextStyle(fontSize: 14, fontFamily: 'TTCommons'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    id == 1
                        ? "We recommend visiting an eye care professional."
                        : id == 2
                            ? "You are in a higher risk of being astigmatic. We recommend visiting an eye care professional."
                            : id == 3
                                ? "We recommend visiting an eye care professional."
                                : id == 4
                                    ? "We recommend visiting an eye care professional to find out about different corrective solutions."
                                    : id == 5
                                        ? "We recommend visiting an eye care professional."
                                        : id == 6
                                            ? "We recommend visiting an eye care professional."
                                            : null,
                    style: TextStyle(fontSize: 14, fontFamily: 'TTCommons'),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  // height: hp * 0.07,
                  // minWidth: hw * 0.7,

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EyeTest()));
                  },
                  child: Text(
                    'Retry Test',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#FEC62D')),
                  ),
                  color: colorFromHex('#181D3D'),
                ),
                MaterialButton(
                  // height: hp * 0.07,
                  // minWidth: hw * 0.7,

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                newSelectedIndex: 0,
                              )),
                    );
                  },
                  child: Text(
                    'Exit',
                    style: TextStyle(
                        fontFamily: 'DemiBold', color: colorFromHex('#FEC62D')),
                  ),
                  color: colorFromHex('#181D3D'),
                ),
              ],
            ),
            SizedBox(
              height: hp * 0.12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: MaterialButton(
                minWidth: hw - 40,
                height: 40,
                onPressed: _launchURL,
                color: ColorConfig.yeallow,
                child: Text('Learn More'),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(testModels[id - 1].link)
      ? await launch(testModels[id - 1].link)
      : throw 'Could not launch url';
}
