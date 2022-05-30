import 'package:eye_buddy/eye_excercies/Instruction.dart';
import 'package:eye_buddy/eye_excercies/custom_excercies.dart';
import 'package:eye_buddy/screen/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:eye_buddy/util/colorconfig.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';

// ignore: must_be_immutable
class AwsumPage extends StatefulWidget {
  int id;
  String exName;
  List selectedExercise;
  int numberOfDoneExercisesFromCEMP;
  AwsumPage(
      {this.id,
      this.selectedExercise,
      this.numberOfDoneExercisesFromCEMP,
      this.exName});

  @override
  _AwsumPageState createState() => _AwsumPageState(
      id: id,
      selectedExercise: selectedExercise,
      exName: exName,
      numberOfDoneExercisesFromCEMP: numberOfDoneExercisesFromCEMP);
}

class _AwsumPageState extends State<AwsumPage> {
  int id;
  String exName;
  List selectedExercise;
  int numberOfDoneExercisesFromCEMP;
  _AwsumPageState(
      {this.id,
      this.selectedExercise,
      this.exName,
      this.numberOfDoneExercisesFromCEMP});

  List latestExercises;

  int numberOfDoneExercises;
  int numberOfRestExercises = 0;
  String nextCustomExerciseName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    numberOfDoneExercises = numberOfDoneExercisesFromCEMP + 1;

    print(numberOfDoneExercises);

    latestExercises = selectedExercise;
    nextCustomExerciseName = eyeExcerciesFiles[latestExercises[0]].title;
    //latestExercises.removeAt(0);
    latestExercises.forEach((element) {
      print("awsp $element");
    });
    numberOfRestExercises = latestExercises.length.round();
    print(numberOfRestExercises);
  }

  @override
  Widget build(BuildContext context) {
    var hw = MediaQuery.of(context).size.width;
    var hp = MediaQuery.of(context).size.height;
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomExcercies()));
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              child: Image.asset('assets/icon/back_arrow.png'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(
                              newSelectedIndex: 1,
                            )));
              }),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: hp * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Awesome',
                    style: TextStyle(fontSize: 36, color: ColorConfig.black),
                  ),
                ),
                Container(
                  height: 40,
                  color: colorFromHex('#FEC62D'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '${numberOfDoneExercises.toString()} done, ${numberOfRestExercises.toString()} more to go')
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: hw * 0.9,
                  child: Lottie.asset('assets/relax.json'),
                ),
                SizedBox(
                  height: hp * 0.2,
                ),
                Text(
                  'NEXTUP : $nextCustomExerciseName',
                  style: TextStyle(
                      color: ColorConfig.black,
                      fontSize: 16,
                      fontFamily: 'TTCommon'),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ExcerciesPage(
                    //               id: latestExercises[0] + 1,
                    //               selectedExercise: latestExercises,
                    //               customEX: 1,
                    //               numberOfDoneExercises: numberOfDoneExercises,
                    //             )));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Instruction(
                                  id: latestExercises[0] + 1,
                                  selectedExercise: latestExercises,
                                  customEX: 1,
                                  exName: exName,
                                  numberOfDoneExercises: numberOfDoneExercises,
                                )));
                  },
                  child: Container(
                    height: 65,
                    width: 221,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/nextup.svg',
                          fit: BoxFit.fill,
                        ),
                        Center(
                          // left: 80,
                          // top: 45,
                          child: Text(
                            '$nextCustomExerciseName',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorConfig.black,
                                fontSize: 16,
                                fontFamily: 'TTCommon'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
