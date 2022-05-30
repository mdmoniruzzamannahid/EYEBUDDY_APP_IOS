import 'package:flutter/material.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/gestures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Buddy extends StatefulWidget {
  @override
  _BuddyState createState() => _BuddyState();
}

class _BuddyState extends State<Buddy> {
  QuerySnapshot userInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance
        .collection("UserInfo")
        .orderBy("userXpPoint", descending: true)
        .get()
        .then((val) {
      setState(() {
        userInfo = val;
      });
      print("-----------------${val.docs[0]["userProfileImage"]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    TextStyle defaultStyle = TextStyle(
        color: ColorConfig.black,
        fontSize: 11.0,
        fontFamily: 'TTCommon-DemiBold',
        fontWeight: FontWeight.bold);
    TextStyle linkStyle = TextStyle(
        color: ColorConfig.yeallow,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(context, true);
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'WORLDWIDE BUDDY',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.6),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.6, top: 10),
                    child: Text(
                        'increase your XP rating by doing daily excercises'),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 37,
                          color: colorFromHex('#181D3D'),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                child: Center(
                                  child: Text(
                                    "Rank",
                                    style: TextStyle(
                                        color: colorFromHex('#FFFFFF'),
                                        fontSize: 11),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Leaderboard",
                                    style: TextStyle(
                                        color: colorFromHex('#FFFFFF'),
                                        fontSize: 11),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: hp * 0.4,
                          width: hw - 51.6,
                          child: userInfo == null
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  itemCount: userInfo.docs.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 37,
                                              // color: colorFromHex('#181D3D'),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    color:
                                                        colorFromHex('#FEC539'),
                                                    width: 50,
                                                    child: Center(
                                                      child: Text(
                                                        (index + 1).toString(),
                                                        style: TextStyle(
                                                            color: colorFromHex(
                                                                '#FFFFFF'),
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: colorFromHex(
                                                              '#FEC539')),
                                                      color: colorFromHex(
                                                          '#FFFFFF'),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "${userInfo.docs[index]["userProfileImage"]}"),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            colorFromHex('')),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Text(
                                                        userInfo.docs[index]
                                                            ["userName"],
                                                        style: TextStyle(
                                                            color: colorFromHex(
                                                                '#181D3D'),
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: 10,
                                              child: SvgPicture.asset(
                                                  "assets/images/level_logo/${userInfo.docs[index]["userXpPoint"] >= 0 && userInfo.docs[index]["userXpPoint"] < 300 ? '01' : userInfo.docs[index]["userXpPoint"] >= 300 && userInfo.docs[index]["userXpPoint"] < 4200 ? '02' : userInfo.docs[index]["userXpPoint"] >= 4200 && userInfo.docs[index]["userXpPoint"] < 9000 ? '03' : userInfo.docs[index]["userXpPoint"] >= 9000 && userInfo.docs[index]["userXpPoint"] < 17000 ? '04' : userInfo.docs[index]["userXpPoint"] >= 17000 && userInfo.docs[index]["userXpPoint"] < 29000 ? '05' : userInfo.docs[index]["userXpPoint"] >= 29000 && userInfo.docs[index]["userXpPoint"] < 36000 ? '06' : userInfo.docs[index]["userXpPoint"] >= 36000 && userInfo.docs[index]["userXpPoint"] < 40400 ? '07' : userInfo.docs[index]["userXpPoint"] >= 40400 && userInfo.docs[index]["userXpPoint"] < 54000 ? '08' : userInfo.docs[index]["userXpPoint"] >= 54000 && userInfo.docs[index]["userXpPoint"] < 69000 ? '09' : userInfo.docs[index]["userXpPoint"] >= 69000 && userInfo.docs[index]["userXpPoint"] < 1000000 ? 'true bro' : userInfo.docs[index]["userXpPoint"] >= 1000000 ? 'legend' : 'legend'}.svg"),
                                            ),
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Text(
                                                  "${userInfo.docs[index]["userXpPoint"].toString()} XP",
                                                  style: TextStyle(
                                                    color:
                                                        colorFromHex('#181D3D'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 2,
                                              width: 50,
                                              color: colorFromHex('#FFFFFF'),
                                            ),
                                            Container(
                                              height: 2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  105,
                                              color: colorFromHex('#FEC539'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'last updated 21 sec ago',
                            style: TextStyle(
                                color: colorFromHex('#181D3D'), fontSize: 8),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '#EBFRIENDS',
                              style: TextStyle(
                                  color: ColorConfig.black, fontSize: 14),
                            )
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _ebFriend('eb_friend1'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _ebFriend('eb_friend2'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _ebFriend('eb_friend3'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(text: 'Follow us on '),
                              TextSpan(
                                  text: 'Instagram',
                                  style: linkStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _launchURL),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.instagram.com/eyebuddy.app';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _ebFriend(String image) {
  return Container(
    height: 115,
    width: 130,
    child: Container(
      height: 115,
      width: 130,
      child: Center(
        child: Image.asset(
          'assets/images/$image.png',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}



// Update of 2.0 
// Remove all The .data()