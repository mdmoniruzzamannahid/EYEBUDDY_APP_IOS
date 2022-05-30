import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:eye_buddy/screen/homepage/profile.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EyeIssue extends StatefulWidget {
  @override
  _EyeIssueState createState() => _EyeIssueState();
}

class Issue {
  final int id;
  final String title;

  bool selected = false;
  Issue(this.id, this.title);
}

class _EyeIssueState extends State<EyeIssue> {
  List eyeIssueSelected = [];
  Future sendEyeIssues() async {
    await FirebaseFirestore.instance
        .collection("UserInfo")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({'userEyeIssues': eyeIssueSelected}).then(
            (value) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Home(
                          newSelectedIndex: 4,
                        ))));
  }

  bool selectingmode = true;
  List<Issue> paints = <Issue>[
    Issue(1, 'None'),
    Issue(2, 'Longsightedness'),
    Issue(3, 'Shortsightedness'),
    Issue(4, 'Cataracts'),
    Issue(5, 'Lazy eye'),
    Issue(6, 'Dry eye'),
    Issue(7, 'Glaucoma'),
    Issue(8, 'Retinities pigmentosa'),
    Issue(9, 'Nystagmus'),
    Issue(10, 'Strabismus'),
    Issue(11, 'Conjunctivitis'),
    Issue(12, 'Chalazion'),
    Issue(13, 'Accommodation spasm'),
  ];
  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    var hw = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: colorFromHex('#FFFFFF'),
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(25.6, hp * 0.15, 25.6, 0),
          children: [
            Text(
              'Your Eye issue',
              style: TextStyle(
                fontFamily: 'DemiBold',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: hw * 0.2,
            ),
            Container(
              height: 360,
              width: hw - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: ListView(
                children: List.generate(paints.length, (index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        selectingmode = true;
                        if (selectingmode) {
                          paints[index].selected = !paints[index].selected;

                          print(paints[index].id);
                        }

                        if (eyeIssueSelected.contains(paints[index].title)) {
                          print("exist, remove");
                          eyeIssueSelected.remove(paints[index].title);
                        } else {
                          print("not existant, add");
                          eyeIssueSelected.add(paints[index].title);
                        }
                        eyeIssueSelected.forEach((element) {
                          print(element);
                        });
                        //eyeIssueSelected.clear();
                      });
                    },
                    selected: paints[index].selected,
                    title: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //                 <--- border radius here
                            ),
                        color: (selectingmode)
                            ? ((paints[index].selected)
                                ? colorFromHex('#FEC62D')
                                : colorFromHex('#FFFFFF'))
                            : null,
                      ),
                      child: Text(paints[index].title,
                          style: TextStyle(
                            color: colorFromHex('#181D3D'),
                          )),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: MaterialButton(
            height: 40,
            minWidth: 220,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              sendEyeIssues();
            },
            child: Text(
              'Done',
              style: TextStyle(
                  fontFamily: 'DemiBold',
                  color: colorFromHex('#181D3D'),
                  fontSize: 16),
            ),
            color: colorFromHex("#FEC62D"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
