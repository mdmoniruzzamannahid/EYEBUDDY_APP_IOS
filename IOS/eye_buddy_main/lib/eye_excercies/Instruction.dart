import 'package:eye_buddy/eye_excercies/excercies_page.dart';
import 'package:eye_buddy/model/eye_excercies_model.dart';
import 'package:eye_buddy/screen/instruction/Instruction%201.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2011.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2014.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2015.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2017.dart';
import 'package:eye_buddy/screen/instruction/Instruction%202.dart';
import 'package:eye_buddy/screen/instruction/Instruction%203.dart';
import 'package:eye_buddy/screen/instruction/Instruction%204.dart';
import 'package:eye_buddy/screen/instruction/Instruction%205.dart';
import 'package:eye_buddy/screen/instruction/Instruction%206.dart';
import 'package:eye_buddy/screen/instruction/Instruction%207.dart';
import 'package:eye_buddy/screen/instruction/Instruction%208.dart';
import 'package:eye_buddy/screen/instruction/Instruction101.dart';
import 'package:eye_buddy/screen/instruction/Instruction18.dart';
import 'package:flutter/material.dart';
import 'package:eye_buddy/screen/instruction/Inatruction%2010.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2012.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2013.dart';
import 'package:eye_buddy/screen/instruction/Instruction%2016.dart';
import 'package:eye_buddy/screen/instruction/Instruction%209.dart';
import 'package:eye_buddy/util/colorconfig.dart';

class Instruction extends StatefulWidget {
  int id;
  int slide;
  String exName;
  List selectedExercise;
  int customEX;
  int numberOfDoneExercises;

  Instruction(
      {Key key,
      this.id,
      this.slide,
      this.exName,
      this.customEX,
      this.numberOfDoneExercises,
      this.selectedExercise})
      : super(key: key);
  @override
  _InstructionState createState() => _InstructionState(
      id: id,
      slide: slide,
      exName: exName,
      customEX: customEX,
      numberOfDoneExercises: numberOfDoneExercises,
      selectedExercise: selectedExercise);
}

class _InstructionState extends State<Instruction> {
  String exName;
  int id;
  int slide;
  List selectedExercise;
  int customEX;
  int numberOfDoneExercises;
  _InstructionState(
      {this.id,
      this.slide,
      this.exName,
      this.numberOfDoneExercises,
      this.selectedExercise,
      this.customEX});

  int slideIndex = 0;
  int numberOfCustomSlide;
  PageController controller;
  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 6.0,
      width: 6.0,
      // height: isCurrentPage ? 10.0 : 6.0,
      // width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        border: Border.all(color: colorFromHex('#181D3D')),
        color:
            isCurrentPage ? colorFromHex('#FEC62D') : colorFromHex('#FFFFFF'),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberOfCustomSlide = eyeExcerciesFiles[id - 1].slide;
    print("''''''''''''''''''''''''''' $numberOfCustomSlide");
  }

  @override
  Widget build(BuildContext context) {
    var hp = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: hp,
              width: MediaQuery.of(context).size.width,
              child: id == 1
                  ? Container(
                      child: PageView(
                          controller: controller,
                          onPageChanged: (index) {
                            setState(() {
                              slideIndex = index;
                            });
                          },
                          children: <Widget>[
                            Instruction13(),
                            Instruction10(),
                            Instruction9(),
                          ]),
                    )
                  : id == 2
                      ? Container(
                          child: PageView(
                              controller: controller,
                              onPageChanged: (index) {
                                setState(() {
                                  slideIndex = index;
                                });
                              },
                              children: <Widget>[
                                Instruction13(),
                                Instruction9(),
                                Instruction12()
                              ]),
                        )
                      : id == 3
                          ? Container(
                              child: PageView(
                                  controller: controller,
                                  onPageChanged: (index) {
                                    setState(() {
                                      slideIndex = index;
                                    });
                                  },
                                  children: <Widget>[
                                    // Instruction1(),
                                    Instruction13(),
                                    Instruction9(),
                                    Instruction10()
                                  ]),
                            )
                          : id == 4
                              ? Container(
                                  child: PageView(
                                      controller: controller,
                                      onPageChanged: (index) {
                                        setState(() {
                                          slideIndex = index;
                                        });
                                      },
                                      children: <Widget>[
                                        Instruction3(),
                                        Instruction9(),
                                        Instruction10(),
                                      ]),
                                )
                              // : id == 7
                              //     ? Container(
                              //         child: PageView(
                              //             controller: controller,
                              //             onPageChanged: (index) {
                              //               setState(() {
                              //                 slideIndex = index;
                              //               });
                              //             },
                              //             children: <Widget>[
                              //               Instruction13(),
                              //               Instruction9(),
                              //               Instruction10(),
                              //             ]),
                              //       )
                              : id == 5
                                  ? Container(
                                      child: PageView(
                                          controller: controller,
                                          onPageChanged: (index) {
                                            setState(() {
                                              slideIndex = index;
                                            });
                                          },
                                          children: <Widget>[
                                            Instruction13(),
                                            Instruction9(),
                                            Instruction10(),
                                          ]),
                                    )
                                  // : id == 9
                                  //     ? Container(
                                  //         child: PageView(
                                  //             controller: controller,
                                  //             onPageChanged: (index) {
                                  //               setState(() {
                                  //                 slideIndex = index;
                                  //               });
                                  //             },
                                  //             children: <Widget>[
                                  //               Instruction13(),
                                  //               Instruction9(),
                                  //               Instruction10(),
                                  //             ]),
                                  //       )
                                  : id == 6
                                      ? Container(
                                          child: PageView(
                                              controller: controller,
                                              onPageChanged: (index) {
                                                setState(() {
                                                  slideIndex = index;
                                                });
                                              },
                                              children: <Widget>[
                                                Instruction13(),
                                                Instruction9(),
                                                Instruction10()
                                              ]),
                                        )
                                      : id == 7
                                          ? Container(
                                              child: PageView(
                                                  controller: controller,
                                                  onPageChanged: (index) {
                                                    setState(() {
                                                      slideIndex = index;
                                                    });
                                                  },
                                                  children: <Widget>[
                                                    Instruction13(),
                                                    Instruction9(),
                                                  ]),
                                            )
                                          : id == 8
                                              ? Container(
                                                  child: PageView(
                                                      controller: controller,
                                                      onPageChanged: (index) {
                                                        setState(() {
                                                          slideIndex = index;
                                                        });
                                                      },
                                                      children: <Widget>[
                                                        Instruction13(),
                                                        Instruction9(),
                                                      ]),
                                                )
                                              : id == 9
                                                  ? Container(
                                                      child: PageView(
                                                          controller:
                                                              controller,
                                                          onPageChanged:
                                                              (index) {
                                                            setState(() {
                                                              slideIndex =
                                                                  index;
                                                            });
                                                          },
                                                          children: <Widget>[
                                                            Instruction13(),
                                                            Instruction6(),
                                                          ]),
                                                    )
                                                  : id == 10
                                                      ? Container(
                                                          child: PageView(
                                                              controller:
                                                                  controller,
                                                              onPageChanged:
                                                                  (index) {
                                                                setState(() {
                                                                  slideIndex =
                                                                      index;
                                                                });
                                                              },
                                                              children: <
                                                                  Widget>[
                                                                Instruction13(),
                                                                Instruction9(),
                                                                Instruction10(),
                                                                Instruction12(),
                                                              ]),
                                                        )
                                                      : id == 11
                                                          ? Container(
                                                              child: PageView(
                                                                  controller:
                                                                      controller,
                                                                  onPageChanged:
                                                                      (index) {
                                                                    setState(
                                                                        () {
                                                                      slideIndex =
                                                                          index;
                                                                    });
                                                                  },
                                                                  children: <
                                                                      Widget>[
                                                                    Instruction13(),
                                                                    Instruction9(),
                                                                  ]),
                                                            )
                                                          : id == 12
                                                              ? Container(
                                                                  child:
                                                                      PageView(
                                                                          controller:
                                                                              controller,
                                                                          onPageChanged: (index) {
                                                                            setState(() {
                                                                              slideIndex = index;
                                                                            });
                                                                          },
                                                                          children: <Widget>[
                                                                        Instruction13(),
                                                                        Instruction9(),
                                                                        Instruction10(),
                                                                        Instruction12()
                                                                      ]),
                                                                )
                                                              : id == 13
                                                                  ? Container(
                                                                      child: PageView(
                                                                          controller: controller,
                                                                          onPageChanged: (index) {
                                                                            setState(() {
                                                                              slideIndex = index;
                                                                            });
                                                                          },
                                                                          children: <Widget>[
                                                                            Instruction13(),
                                                                            Instruction9(),
                                                                          ]),
                                                                    )
                                                                  : id == 14
                                                                      ? Container(
                                                                          child: PageView(
                                                                              controller: controller,
                                                                              onPageChanged: (index) {
                                                                                setState(() {
                                                                                  slideIndex = index;
                                                                                });
                                                                              },
                                                                              children: <Widget>[
                                                                                Instruction14(),
                                                                                Instruction8(),
                                                                                Instruction11(),
                                                                              ]),
                                                                        )
                                                                      : id == 15
                                                                          ? Container(
                                                                              child: PageView(
                                                                                  controller: controller,
                                                                                  onPageChanged: (index) {
                                                                                    setState(() {
                                                                                      slideIndex = index;
                                                                                    });
                                                                                  },
                                                                                  children: <Widget>[
                                                                                    Instruction13(),
                                                                                    Instruction9(),
                                                                                    Instruction10(),
                                                                                    Instruction12(),
                                                                                  ]),
                                                                            )
                                                                          : id == 16
                                                                              ? Container(
                                                                                  child: PageView(
                                                                                      controller: controller,
                                                                                      onPageChanged: (index) {
                                                                                        setState(() {
                                                                                          slideIndex = index;
                                                                                        });
                                                                                      },
                                                                                      children: <Widget>[
                                                                                        Instruction13(),
                                                                                        Instruction9(),
                                                                                        Instruction10(),
                                                                                        Instruction12(),
                                                                                      ]),
                                                                                )
                                                                              : id == 17
                                                                                  ? Container(
                                                                                      child: PageView(
                                                                                          controller: controller,
                                                                                          onPageChanged: (index) {
                                                                                            setState(() {
                                                                                              slideIndex = index;
                                                                                            });
                                                                                          },
                                                                                          children: <Widget>[
                                                                                            Instruction13(),
                                                                                            Instruction9(),
                                                                                          ]),
                                                                                    )
                                                                                  : id == 18
                                                                                      ? Container(
                                                                                          child: PageView(
                                                                                              controller: controller,
                                                                                              onPageChanged: (index) {
                                                                                                setState(() {
                                                                                                  slideIndex = index;
                                                                                                });
                                                                                              },
                                                                                              children: <Widget>[
                                                                                                Instruction13(),
                                                                                                Instruction9(),
                                                                                              ]),
                                                                                        )
                                                                                      : id == 19
                                                                                          ? Container(
                                                                                              child: PageView(
                                                                                                  controller: controller,
                                                                                                  onPageChanged: (index) {
                                                                                                    setState(() {
                                                                                                      slideIndex = index;
                                                                                                    });
                                                                                                  },
                                                                                                  children: <Widget>[
                                                                                                    Instruction13(),
                                                                                                    Instruction9(),
                                                                                                    Instruction10(),
                                                                                                    Instruction12(),
                                                                                                  ]),
                                                                                            )
                                                                                          : id == 20
                                                                                              ? Container(
                                                                                                  child: PageView(
                                                                                                      controller: controller,
                                                                                                      onPageChanged: (index) {
                                                                                                        setState(() {
                                                                                                          slideIndex = index;
                                                                                                        });
                                                                                                      },
                                                                                                      children: <Widget>[
                                                                                                        Instruction13(),
                                                                                                        Instruction9(),
                                                                                                        Instruction10(),
                                                                                                        Instruction12(),
                                                                                                      ]),
                                                                                                )
                                                                                              : id == 21
                                                                                                  ? Container(
                                                                                                      child: PageView(
                                                                                                          controller: controller,
                                                                                                          onPageChanged: (index) {
                                                                                                            setState(() {
                                                                                                              slideIndex = index;
                                                                                                            });
                                                                                                          },
                                                                                                          children: <Widget>[
                                                                                                            Instruction13(),
                                                                                                            Instruction9(),
                                                                                                            Instruction10(),
                                                                                                            Instruction12(),
                                                                                                          ]),
                                                                                                    )
                                                                                                  : id == 22
                                                                                                      ? Container(
                                                                                                          child: PageView(
                                                                                                              controller: controller,
                                                                                                              onPageChanged: (index) {
                                                                                                                setState(() {
                                                                                                                  slideIndex = index;
                                                                                                                });
                                                                                                              },
                                                                                                              children: <Widget>[
                                                                                                                Instruction13(),
                                                                                                                Instruction9(),
                                                                                                                Instruction10(),
                                                                                                                Instruction12(),
                                                                                                              ]),
                                                                                                        )
                                                                                                      : id == 23
                                                                                                          ? Container(
                                                                                                              child: PageView(
                                                                                                                  controller: controller,
                                                                                                                  onPageChanged: (index) {
                                                                                                                    setState(() {
                                                                                                                      slideIndex = index;
                                                                                                                    });
                                                                                                                  },
                                                                                                                  children: <Widget>[
                                                                                                                    Instruction13(),
                                                                                                                    Instruction9(),
                                                                                                                    Instruction10(),
                                                                                                                    Instruction12(),
                                                                                                                  ]),
                                                                                                            )
                                                                                                          : id == 24
                                                                                                              ? Container(
                                                                                                                  child: PageView(
                                                                                                                      controller: controller,
                                                                                                                      onPageChanged: (index) {
                                                                                                                        setState(() {
                                                                                                                          slideIndex = index;
                                                                                                                        });
                                                                                                                      },
                                                                                                                      children: <Widget>[
                                                                                                                        Instruction13(),
                                                                                                                        Instruction9(),
                                                                                                                        Instruction10(),
                                                                                                                        Instruction12(),
                                                                                                                      ]),
                                                                                                                )
                                                                                                              : id == 25
                                                                                                                  ? Container(
                                                                                                                      child: PageView(
                                                                                                                          controller: controller,
                                                                                                                          onPageChanged: (index) {
                                                                                                                            setState(() {
                                                                                                                              slideIndex = index;
                                                                                                                            });
                                                                                                                          },
                                                                                                                          children: <Widget>[
                                                                                                                            Instruction13(),
                                                                                                                            Instruction9(),
                                                                                                                            Instruction10(),
                                                                                                                            Instruction12(),
                                                                                                                          ]),
                                                                                                                    )
                                                                                                                  : id == 26
                                                                                                                      ? Container(
                                                                                                                          child: PageView(
                                                                                                                              controller: controller,
                                                                                                                              onPageChanged: (index) {
                                                                                                                                setState(() {
                                                                                                                                  slideIndex = index;
                                                                                                                                });
                                                                                                                              },
                                                                                                                              children: <Widget>[
                                                                                                                                Instruction13(),
                                                                                                                                Instruction9(),
                                                                                                                                Instruction10(),
                                                                                                                                Instruction12(),
                                                                                                                              ]),
                                                                                                                        )
                                                                                                                      : id == 27
                                                                                                                          ? Container(
                                                                                                                              child: PageView(
                                                                                                                                  controller: controller,
                                                                                                                                  onPageChanged: (index) {
                                                                                                                                    setState(() {
                                                                                                                                      slideIndex = index;
                                                                                                                                    });
                                                                                                                                  },
                                                                                                                                  children: <Widget>[
                                                                                                                                    Instruction13(),
                                                                                                                                    Instruction9(),
                                                                                                                                    Instruction10(),
                                                                                                                                  ]),
                                                                                                                            )
                                                                                                                          : id == 28
                                                                                                                              ? Container(
                                                                                                                                  child: PageView(
                                                                                                                                      controller: controller,
                                                                                                                                      onPageChanged: (index) {
                                                                                                                                        setState(() {
                                                                                                                                          slideIndex = index;
                                                                                                                                        });
                                                                                                                                      },
                                                                                                                                      children: <Widget>[
                                                                                                                                        Instruction13(),
                                                                                                                                        Instruction9(),
                                                                                                                                        Instruction10(),
                                                                                                                                        Instruction12(),
                                                                                                                                      ]),
                                                                                                                                )
                                                                                                                              : id == 29
                                                                                                                                  ? Container(
                                                                                                                                      child: PageView(
                                                                                                                                          controller: controller,
                                                                                                                                          onPageChanged: (index) {
                                                                                                                                            setState(() {
                                                                                                                                              slideIndex = index;
                                                                                                                                            });
                                                                                                                                          },
                                                                                                                                          children: <Widget>[
                                                                                                                                            Instruction13(),
                                                                                                                                            Instruction15(),
                                                                                                                                          ]),
                                                                                                                                    )
                                                                                                                                  : id == 30
                                                                                                                                      ? Container(
                                                                                                                                          child: PageView(
                                                                                                                                              controller: controller,
                                                                                                                                              onPageChanged: (index) {
                                                                                                                                                setState(() {
                                                                                                                                                  slideIndex = index;
                                                                                                                                                });
                                                                                                                                              },
                                                                                                                                              children: <Widget>[
                                                                                                                                                Instruction13(),
                                                                                                                                                Instruction15(),
                                                                                                                                              ]),
                                                                                                                                        )
                                                                                                                                      : id == 31
                                                                                                                                          ? Container(
                                                                                                                                              child: PageView(
                                                                                                                                                  controller: controller,
                                                                                                                                                  onPageChanged: (index) {
                                                                                                                                                    setState(() {
                                                                                                                                                      slideIndex = index;
                                                                                                                                                    });
                                                                                                                                                  },
                                                                                                                                                  children: <Widget>[
                                                                                                                                                    Instruction13(),
                                                                                                                                                    Instruction9(),
                                                                                                                                                    Instruction10(),
                                                                                                                                                  ]),
                                                                                                                                            )
                                                                                                                                          : id == 32
                                                                                                                                              ? Container(
                                                                                                                                                  child: PageView(
                                                                                                                                                      controller: controller,
                                                                                                                                                      onPageChanged: (index) {
                                                                                                                                                        setState(() {
                                                                                                                                                          slideIndex = index;
                                                                                                                                                        });
                                                                                                                                                      },
                                                                                                                                                      children: <Widget>[
                                                                                                                                                        Instruction13(),
                                                                                                                                                        Instruction9(),
                                                                                                                                                        Instruction10(),
                                                                                                                                                        Instruction12(),
                                                                                                                                                      ]),
                                                                                                                                                )
                                                                                                                                              : id == 33
                                                                                                                                                  ? Container(
                                                                                                                                                      child: PageView(
                                                                                                                                                          controller: controller,
                                                                                                                                                          onPageChanged: (index) {
                                                                                                                                                            setState(() {
                                                                                                                                                              slideIndex = index;
                                                                                                                                                            });
                                                                                                                                                          },
                                                                                                                                                          children: <Widget>[
                                                                                                                                                            Instruction6(),
                                                                                                                                                            Instruction14(),
                                                                                                                                                          ]),
                                                                                                                                                    )
                                                                                                                                                  : id == 34
                                                                                                                                                      ? Container(
                                                                                                                                                          child: PageView(
                                                                                                                                                              controller: controller,
                                                                                                                                                              onPageChanged: (index) {
                                                                                                                                                                setState(() {
                                                                                                                                                                  slideIndex = index;
                                                                                                                                                                });
                                                                                                                                                              },
                                                                                                                                                              children: <Widget>[
                                                                                                                                                                Instruction13(),
                                                                                                                                                                Instruction9(),
                                                                                                                                                                Instruction10(),
                                                                                                                                                              ]),
                                                                                                                                                        )
                                                                                                                                                      : id == 35
                                                                                                                                                          ? Container(
                                                                                                                                                              child: PageView(
                                                                                                                                                                  controller: controller,
                                                                                                                                                                  onPageChanged: (index) {
                                                                                                                                                                    setState(() {
                                                                                                                                                                      slideIndex = index;
                                                                                                                                                                    });
                                                                                                                                                                  },
                                                                                                                                                                  children: <Widget>[
                                                                                                                                                                    Instruction14(),
                                                                                                                                                                    Instruction6(),
                                                                                                                                                                  ]),
                                                                                                                                                            )
                                                                                                                                                          : id == 36
                                                                                                                                                              ? Container(
                                                                                                                                                                  child: PageView(
                                                                                                                                                                      controller: controller,
                                                                                                                                                                      onPageChanged: (index) {
                                                                                                                                                                        setState(() {
                                                                                                                                                                          slideIndex = index;
                                                                                                                                                                        });
                                                                                                                                                                      },
                                                                                                                                                                      children: <Widget>[
                                                                                                                                                                        Instruction14(),
                                                                                                                                                                        Instruction7(),
                                                                                                                                                                        Instruction8(),
                                                                                                                                                                      ]),
                                                                                                                                                                )
                                                                                                                                                              : id == 37
                                                                                                                                                                  ? Container(
                                                                                                                                                                      child: PageView(
                                                                                                                                                                          controller: controller,
                                                                                                                                                                          onPageChanged: (index) {
                                                                                                                                                                            setState(() {
                                                                                                                                                                              slideIndex = index;
                                                                                                                                                                            });
                                                                                                                                                                          },
                                                                                                                                                                          children: <Widget>[
                                                                                                                                                                            Instruction14(),
                                                                                                                                                                            Instruction1(),
                                                                                                                                                                            Instruction2(),
                                                                                                                                                                            Instruction3(),
                                                                                                                                                                            Instruction4(),
                                                                                                                                                                            Instruction5(),
                                                                                                                                                                          ]),
                                                                                                                                                                    )
                                                                                                                                                                  : id == 38
                                                                                                                                                                      ? Container(
                                                                                                                                                                          child: PageView(
                                                                                                                                                                              controller: controller,
                                                                                                                                                                              onPageChanged: (index) {
                                                                                                                                                                                setState(() {
                                                                                                                                                                                  slideIndex = index;
                                                                                                                                                                                });
                                                                                                                                                                              },
                                                                                                                                                                              children: <Widget>[
                                                                                                                                                                                Instruction10(),
                                                                                                                                                                                Instruction13(),
                                                                                                                                                                                Instruction16(),
                                                                                                                                                                              ]),
                                                                                                                                                                        )
                                                                                                                                                                      : id == 39
                                                                                                                                                                          ? Container(
                                                                                                                                                                              child: PageView(
                                                                                                                                                                                  controller: controller,
                                                                                                                                                                                  onPageChanged: (index) {
                                                                                                                                                                                    setState(() {
                                                                                                                                                                                      slideIndex = index;
                                                                                                                                                                                    });
                                                                                                                                                                                  },
                                                                                                                                                                                  children: <Widget>[
                                                                                                                                                                                    Instruction10(),
                                                                                                                                                                                    Instruction13(),
                                                                                                                                                                                  ]),
                                                                                                                                                                            )
                                                                                                                                                                          : id == 40
                                                                                                                                                                              ? Container(
                                                                                                                                                                                  child: PageView(
                                                                                                                                                                                      controller: controller,
                                                                                                                                                                                      onPageChanged: (index) {
                                                                                                                                                                                        setState(() {
                                                                                                                                                                                          slideIndex = index;
                                                                                                                                                                                        });
                                                                                                                                                                                      },
                                                                                                                                                                                      children: <Widget>[
                                                                                                                                                                                        Instruction10(),
                                                                                                                                                                                        Instruction13(),
                                                                                                                                                                                      ]),
                                                                                                                                                                                )
                                                                                                                                                                              : id == 41
                                                                                                                                                                                  ? Container(
                                                                                                                                                                                      child: PageView(
                                                                                                                                                                                          controller: controller,
                                                                                                                                                                                          onPageChanged: (index) {
                                                                                                                                                                                            setState(() {
                                                                                                                                                                                              slideIndex = index;
                                                                                                                                                                                            });
                                                                                                                                                                                          },
                                                                                                                                                                                          children: <Widget>[
                                                                                                                                                                                            Instruction10(),
                                                                                                                                                                                            Instruction11(),
                                                                                                                                                                                          ]),
                                                                                                                                                                                    )
                                                                                                                                                                                  : id == 42
                                                                                                                                                                                      ? Container(
                                                                                                                                                                                          child: PageView(
                                                                                                                                                                                              controller: controller,
                                                                                                                                                                                              onPageChanged: (index) {
                                                                                                                                                                                                setState(() {
                                                                                                                                                                                                  slideIndex = index;
                                                                                                                                                                                                });
                                                                                                                                                                                              },
                                                                                                                                                                                              children: <Widget>[
                                                                                                                                                                                                Instruction10(),
                                                                                                                                                                                                Instruction11(),
                                                                                                                                                                                              ]),
                                                                                                                                                                                        )
                                                                                                                                                                                      : id == 43
                                                                                                                                                                                          ? Container(
                                                                                                                                                                                              child: PageView(
                                                                                                                                                                                                  controller: controller,
                                                                                                                                                                                                  onPageChanged: (index) {
                                                                                                                                                                                                    setState(() {
                                                                                                                                                                                                      slideIndex = index;
                                                                                                                                                                                                    });
                                                                                                                                                                                                  },
                                                                                                                                                                                                  children: <Widget>[
                                                                                                                                                                                                    Instruction13(),
                                                                                                                                                                                                  ]),
                                                                                                                                                                                            )
                                                                                                                                                                                          : id == 44
                                                                                                                                                                                              ? Container(
                                                                                                                                                                                                  child: PageView(
                                                                                                                                                                                                      controller: controller,
                                                                                                                                                                                                      onPageChanged: (index) {
                                                                                                                                                                                                        setState(() {
                                                                                                                                                                                                          slideIndex = index;
                                                                                                                                                                                                        });
                                                                                                                                                                                                      },
                                                                                                                                                                                                      children: <Widget>[
                                                                                                                                                                                                        Instruction13(),
                                                                                                                                                                                                      ]),
                                                                                                                                                                                                )
                                                                                                                                                                                              : id == 45
                                                                                                                                                                                                  ? Container(
                                                                                                                                                                                                      child: PageView(
                                                                                                                                                                                                          controller: controller,
                                                                                                                                                                                                          onPageChanged: (index) {
                                                                                                                                                                                                            setState(() {
                                                                                                                                                                                                              slideIndex = index;
                                                                                                                                                                                                            });
                                                                                                                                                                                                          },
                                                                                                                                                                                                          children: <Widget>[
                                                                                                                                                                                                            Instruction13(),
                                                                                                                                                                                                          ]),
                                                                                                                                                                                                    )
                                                                                                                                                                                                  : id == 46
                                                                                                                                                                                                      ? Container(
                                                                                                                                                                                                          child: PageView(
                                                                                                                                                                                                              controller: controller,
                                                                                                                                                                                                              onPageChanged: (index) {
                                                                                                                                                                                                                setState(() {
                                                                                                                                                                                                                  slideIndex = index;
                                                                                                                                                                                                                });
                                                                                                                                                                                                              },
                                                                                                                                                                                                              children: <Widget>[
                                                                                                                                                                                                                Instruction13(),
                                                                                                                                                                                                              ]),
                                                                                                                                                                                                        )
                                                                                                                                                                                                      : id == 47
                                                                                                                                                                                                          ? Container(
                                                                                                                                                                                                              child: PageView(
                                                                                                                                                                                                                  controller: controller,
                                                                                                                                                                                                                  onPageChanged: (index) {
                                                                                                                                                                                                                    setState(() {
                                                                                                                                                                                                                      slideIndex = index;
                                                                                                                                                                                                                    });
                                                                                                                                                                                                                  },
                                                                                                                                                                                                                  children: <Widget>[
                                                                                                                                                                                                                    Instruction13(),
                                                                                                                                                                                                                  ]),
                                                                                                                                                                                                            )
                                                                                                                                                                                                          : id == 48
                                                                                                                                                                                                              ? Container(
                                                                                                                                                                                                                  child: PageView(
                                                                                                                                                                                                                      controller: controller,
                                                                                                                                                                                                                      onPageChanged: (index) {
                                                                                                                                                                                                                        setState(() {
                                                                                                                                                                                                                          slideIndex = index;
                                                                                                                                                                                                                        });
                                                                                                                                                                                                                      },
                                                                                                                                                                                                                      children: <Widget>[
                                                                                                                                                                                                                        Instruction13(),
                                                                                                                                                                                                                      ]),
                                                                                                                                                                                                                )
                                                                                                                                                                                                              : null,
            ),
            Positioned(
              right: 20,
              top: 20,
              child: InkWell(
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: colorFromHex('#181D3D'),
                      fontFamily: 'TTCommons',
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExcerciesPage(
                                id: id,
                                exName: exName,
                                customEX: customEX,
                                selectedExercise: selectedExercise,
                                numberOfDoneExercises: numberOfDoneExercises,
                              )));
                },
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                "INSTRUCTION",
                style: TextStyle(
                    color: colorFromHex('#181D3D'),
                    fontFamily: 'TTCommons',
                    fontSize: 20),
              ),
            )
          ],
        ),
        floatingActionButton: slideIndex !=
                (customEX == 1 ? numberOfCustomSlide - 1 : slide - 1)
            ? Padding(
                padding: EdgeInsets.only(bottom: hp * 0.05),
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < (customEX == 1 ? numberOfCustomSlide : slide);
                          i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: MaterialButton(
                  height: 40,
                  minWidth: 220,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExcerciesPage(
                                  id: id,
                                  exName: exName,
                                  selectedExercise: selectedExercise,
                                  customEX: customEX,
                                  numberOfDoneExercises: numberOfDoneExercises,
                                )));
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
        // bottomSheet:
      ),
    );
  }
}
