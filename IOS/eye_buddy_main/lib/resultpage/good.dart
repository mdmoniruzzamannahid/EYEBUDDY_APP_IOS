import 'package:eye_buddy/model/eye_test_model.dart';
import 'package:eye_buddy/screen/homepage/eye_test/eye_test.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:eye_buddy/resultpage/bad.dart';
import 'package:url_launcher/url_launcher.dart';

class GoodResult extends StatelessWidget {
  int id;
  GoodResult({this.id});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var hp = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      newSelectedIndex: 0,
                    )));
      },
      child: Scaffold(
        body: Center(
          child: ListView(children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Lottie.asset('assets/1.json'),
                Image.asset("assets/images/good.png")
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
                        ? "Congratulations, your visual acuity seems good in both eyes."
                        : id == 2
                            ? "Congratulations, you are not astigmatic."
                            : id == 3
                                ? "Congratulations, your sensitivity to contrasts in both eyes seems good."
                                : id == 4
                                    ? "Congratulations, you can read all the text from 40cm away."
                                    : id == 5
                                        ? "Congratulations, you have no color vision difficulties."
                                        : id == 6
                                            ? "Congratulations, you do not seem to have any symptoms of age-related macular degeneration (AMD)."
                                            : null,
                    style: TextStyle(fontSize: 14, fontFamily: 'TTCommons'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    id == 1
                        ? "Do not hesitate to take a further vision exam with an eye care professional."
                        : id == 2
                            ? "Do not hesitate to take a further vision exam with an eye care professional"
                            : id == 3
                                ? "Do not hesitate to take a further vision exam with an eye care professional"
                                : id == 4
                                    ? "Do not hesitate to take a further vision exam with an eye care professional"
                                    : id == 5
                                        ? "Do not hesitate to take a further vision exam with an eye care professional"
                                        : id == 6
                                            ? "Do not hesitate to take a further vision exam with an eye care professional"
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EyeTest()),
                    );
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
            ), SizedBox(
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
