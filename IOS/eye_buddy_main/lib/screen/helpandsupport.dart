import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';

class HelpandSupport extends StatefulWidget {
  @override
  _HelpandSupportState createState() => _HelpandSupportState();
}

class _HelpandSupportState extends State<HelpandSupport> {
  @override
  Widget build(BuildContext context) {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Help & Support',
          style: TextStyle(fontSize: 18, color: colorFromHex('#181D3D')),
        ),
        backgroundColor: Colors.white,
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
          width: hw,
          height: hp,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Frequently Asked Questions:",
                    style: TextStyle(
                        fontSize: hw * 0.045, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: hp * 0.01,
                  ),
                  Text(
                    "How do I Improve my vision with EyeBuddy?",
                    style: TextStyle(
                        fontSize: hw * 0.04, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      "Developed with the help of eye care professionals, our eye exercises are based on the most proven techniques in ophthalmology and utilize brain training algorithms to get you seeing the world better, sooner! Log in Daily, Workout for your specific eye condition to get the best results!"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Is this a one-time payment or is there automatic renewal?",
                    style: TextStyle(
                        fontSize: hw * 0.04, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      "All EyeBuddy subscriptions are automatically extended to ensure your constant access. Once the automatic renewal has been cancelled by cancelling the payment in play store, your subscription will be cancelled for the next due payment."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "How can I cancel my subscription?",
                    style: TextStyle(
                        fontSize: hw * 0.04, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      "For subscriptions within the app, the cancellation is done via play store."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Is the membership fee debited monthly or as a single payment?",
                    style: TextStyle(
                        fontSize: hw * 0.04, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      "Use both the total cost and the price per month to compare subscription plans and choose what works best for you. For example, if you choose a 12-month membership, the entire amount will be billed in advance."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Can I have my money back if I change my mind?",
                    style: TextStyle(
                        fontSize: hw * 0.04, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      "Payments via play store can only be approved and refunded by Play Store. To receive a refund from Play Store, you must contact play store Support within 14 days of the purchase date."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "For all additional Enquiries please contact us.",
                    style: TextStyle(
                        fontSize: hw * 0.04, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            launch(_emailLaunchUri
                                .toString()
                                .replaceAll("+", "%20"));
                          },
                          child: Text(
                            'eyebuddy.app@gmail.com',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => WebView()));
                      _launchurl('https://eyebuddy.app/privacy-policy.html');
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Text(
                      'Terms & Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      _launchurl('https://eyebuddy.app/privacy-policy.html');
                    },
                  ),
                  // FlutterClipboard.copy('hello flutter friends').then(( value ) => print('copied'));
                ],
              ),
            ),
          )),
    );
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'eyebuddy.app@gmail.com',
      queryParameters: {'subject': 'Submit a Request'});

  _launchurl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
