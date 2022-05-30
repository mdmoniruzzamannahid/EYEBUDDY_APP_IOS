import 'package:eye_buddy/screen/prad_story/prad_story.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eye_buddy/screen/buddy/buddy.dart';
//import 'package:share/share.dart';

class Prad extends StatefulWidget {
  @override
  _PradState createState() => _PradState();
}

class _PradState extends State<Prad> {
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      // onWillPop: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => Home()));
      // },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ALL ABOUT PRAD',
            style: TextStyle(color: colorFromHex('#181D3D')),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: colorFromHex('#FFFFFF'),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/three_eye.svg',
                  height: hp * 0.5,
                  width: hw,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Hi Friend, now I wouldn\'t recommend working out with a stranger, so here\'s a little bit about me',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PradStory()));
                            },
                            child:
                                SvgPicture.asset('assets/svg/right_arrow.svg')),
                      ],
                    ),
                    SizedBox(
                      height: hp * 0.03,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Buddy()));
                          },
                          child: Stack(
                            children: [
                              SvgPicture.asset('assets/svg/left_arrow.svg')
                            ],
                          ),
                          // Image.asset(
                          //   "assets/images/left_arrow.png",
                          // ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'What other say about prad :-',
                        style: TextStyle(
                            color: colorFromHex('#181D3D'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset('assets/svg/three_star.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 121,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: ColorConfig.yeallow,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 74,
                                        width: 221,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 30,
                                              color: ColorConfig.yeallow,
                                              child: SingleChildScrollView(
                                                child: Text(
                                                    "I'm a digital artist and I spend a lot of hours staring at a screen, so as a result my eyes often hurt. But whenever I use this app and finish the exercises, the pain goes away almost instantly. I definitely recommend it.",
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text("- Jacob Chernyshevsky",
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                      bottom: 7,
                                      left: 88,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color:
                                                      colorFromHex('FFFFFF'))),
                                          height: 50,
                                          width: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/Jacob Chernyshevsky.jpg'),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 121,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: ColorConfig.yeallow,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 74,
                                        width: 221,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 30,
                                              color: ColorConfig.yeallow,
                                              child: SingleChildScrollView(
                                                child: Text(
                                                    "I don't normally leave reviews; but thought it was important to share my experience. I suffer from very dry eyes, so tried this with scepticism, hoping other reviews were correct. I use Omega 7, which works; but is expensive. I have been stunned by the impact of this app. The effect was immediate, and it is now a vital part of my daily routine. I cannot recommend it highly enough. It is great to wake or go about my day without suffering the pain and irritation of dry eyes. A great app.",
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text("- Dr. Julia Rose",
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                      bottom: 7,
                                      left: 88,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color:
                                                      colorFromHex('FFFFFF'))),
                                          height: 50,
                                          width: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/Dr. Julia Rose.jpg'),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 121,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: ColorConfig.yeallow,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        height: 74,
                                        width: 221,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 30,
                                              color: ColorConfig.yeallow,
                                              child: SingleChildScrollView(
                                                child: Text(
                                                    "I spent \$3,000 on vision therapy last year, and received amazing results, however, I couldn't afford more. I am thrilled to have found this app which helps me work on my lazy eye and visual tracking problems. It is a simple, yet extremely effective tool to help me with my vision needs. I am 54 and I have a six-year-old, and a 16 year old who use it as well.",
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text("- Sarah KAMIŃSKI",
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        colorFromHex('FFFFFF'),
                                                    size: 9,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                      bottom: 7,
                                      left: 88,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                  color:
                                                      colorFromHex('FFFFFF'))),
                                          height: 50,
                                          width: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/Sarah KAMINSKI.jpg'),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/images/quate.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                          onTap: () {
                            _onShareWithEmptyOrigin(context);
                          },
                          child:
                              SvgPicture.asset('assets/svg/recommanded.svg')),
                    ),
                    SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onShareWithEmptyOrigin(BuildContext context) async {
    //await Share.share(
    //   "Hello, Check This app:- https://play.google.com/store/apps/details?id=com.eyebuddy.eye_buddy");
  }
}
