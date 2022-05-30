import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// var hp = MediaQuery.of(context).size.height;
// var hw = MediaQuery.of(context).size.width;
Widget myEx(String name, String fontsize, String assetname, double height,
    double width, double hp, double hw, bool paid) {
  return paid == true
      ? Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x181D3D).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 40,
                  offset: Offset(0, 3),
                )
              ],
            ),
            // height: hp * 0.4,
            // width: hw * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: height,
                  width: width,
                  child: SvgPicture.asset(
                    'assets/svg/excercies/$assetname.svg',
                  ),
                ),
                Container(
                  height: 17,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'TTCommons Demibold',
                      fontSize: 16,
                      color: Colors.black),
                ),
                Container(
                  height: 17,
                )
              ],
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x181D3D).withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 40,
                  offset: Offset(0, 3),
                )
              ],
            ),
            height: hp * 0.4,
            width: hw * 0.4,
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                      height: hw * 0.07,
                      width: hw * 0.07,
                      child: SvgPicture.asset('assets/svg/lock.svg')),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: height,
                      width: width,
                      child: SvgPicture.asset(
                        'assets/svg/excercies/$assetname.svg',
                      ),
                    ),
                    Container(
                      height: 17,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'TTCommons Demibold',
                          fontSize: 16,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 17,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
}

Widget splitimages(double hp, double hw, bool paid) {
  return myEx("Split Images", "16", "Split Images", 59.99, 60.00, hp, hw, paid);
}

Widget convergence(double hp, double hw, bool paid) {
  return myEx(
      "Converging Eyes", "16", "Convergence", 59.99, 64.00, hp, hw, paid);
}

Widget focusshift(double hp, double hw, bool paid) {
  return myEx("Focus Shift", "16", "Focus Shift", 62, 61.00, hp, hw, paid);
}

Widget gaborpatches(double hp, double hw, bool paid) {
  return myEx(
      "Gabor Patches", "16", "Gabor Patches", 59.99, 60.00, hp, hw, paid);
}

Widget blurrygabor(double hp, double hw, bool paid) {
  return myEx(
      "Gabor Patch Blur", "16", "Blurry Gabor", 59.99, 60.00, hp, hw, paid);
}

Widget gaborblinking(double hp, double hw, bool paid) {
  return myEx(
      "Gabor Patch Blink", "16", "Gabor Blinking", 59.99, 60.00, hp, hw, paid);
}

Widget splittinggabor(double hp, double hw, bool paid) {
  return myEx(
      "Splitting Gabor", "16", "Splitting Gabor", 59.99, 60.00, hp, hw, paid);
}

Widget growingGabor(double hp, double hw, bool paid) {
  return myEx(
      "Growing Gabor", "16", "Growing Gabor", 59.99, 60.00, hp, hw, paid);
}

Widget yinYangFocus(double hp, double hw, bool paid) {
  return myEx(
      "Dark-Light Focus", "16", "Yin Yang Focus", 59.99, 60.00, hp, hw, paid);
}

Widget yinYangFlicker(double hp, double hw, bool paid) {
  return myEx("Dark-Light Flicker", "16", "Yin Yang Flicker", 59.99, 60.00, hp,
      hw, paid);
}

Widget rollerCoaster(double hp, double hw, bool paid) {
  return myEx(
      "Roller Coaster", "16", "Roller Coaster", 59.99, 60.00, hp, hw, paid);
}

Widget flashingShapes(double hp, double hw, bool paid) {
  return myEx(
      "Shape Illusion", "16", "Flashing Shapes", 59.99, 60.00, hp, hw, paid);
}

Widget patternFocus(double hp, double hw, bool paid) {
  return myEx(
      "Focus Pattern", "16", "Pattern Focus", 59.99, 60.00, hp, hw, paid);
}

Widget lightFlicker(double hp, double hw, bool paid) {
  return myEx(
      "Light Flicker", "16", "Light Flicker", 59.99, 60.00, hp, hw, paid);
}

Widget circleFocus(double hp, double hw, bool paid) {
  return myEx("Focus C", "16", "Circle Focus", 59.99, 60.00, hp, hw, paid);
}

Widget twoObjects(double hp, double hw, bool paid) {
  return myEx("Elastic Move", "16", "Two Objects", 59.99, 60.00, hp, hw, paid);
}

Widget jumpingMove(double hp, double hw, bool paid) {
  return myEx(
      "Vertical Move", "16", "Jumping Move", 59.99, 60.00, hp, hw, paid);
}

Widget bouncingBall(double hp, double hw, bool paid) {
  return myEx(
      "Bouncing Ball", "16", "Bouncing Ball", 59.99, 60.00, hp, hw, paid);
}

Widget diagonalMove(double hp, double hw, bool paid) {
  return myEx(
      "Diagonal Move", "16", "Diagonal Move", 59.99, 60.00, hp, hw, paid);
}

Widget waveMove(double hp, double hw, bool paid) {
  return myEx("Curve Move", "16", "Wave Move", 59.99, 60.00, hp, hw, paid);
}

Widget closedEyeMove(double hp, double hw, bool paid) {
  return myEx(
      "Closed-Eye Move", "16", "closed_eye_moved", 59.99, 60.00, hp, hw, paid);
}

Widget plaming(double hp, double hw, bool paid) {
  return myEx("Palming", "16", "clap", 59.99, 60.00, hp, hw, paid);
}

Widget closingTight(double hp, double hw, bool paid) {
  return myEx("Tight Shut", "16", "Closing Tight", 59.99, 60.00, hp, hw, paid);
}

Widget blinking(double hp, double hw, bool paid) {
  return myEx("Eye Blinking", "16", "Blinking", 59.99, 60.00, hp, hw, paid);
}

Widget tibetanEyeChart(double hp, double hw, bool paid) {
  return myEx("Tibetan Eye Chart", "16", "Tibetan Eye Chart", 59.99, 60.00, hp,
      hw, paid);
}

Widget crossMove(double hp, double hw, bool paid) {
  return myEx("Open Eye Move", "16", "Cross Move", 59.99, 60.00, hp, hw, paid);
}

Widget leftRightMove(double hp, double hw, bool paid) {
  return myEx(
      "Left Right Move", "16", "Left Right Move", 59.99, 60.00, hp, hw, paid);
}

Widget ellipsisMove(double hp, double hw, bool paid) {
  return myEx("Orbit Move", "16", "Ellipsis Move", 59.99, 60.00, hp, hw, paid);
}

Widget spiralMove(double hp, double hw, bool paid) {
  return myEx("Tornado Move", "16", "Spiral Move", 59.99, 60.00, hp, hw, paid);
}

Widget flowerMove(double hp, double hw, bool paid) {
  return myEx("Flower Move", "16", "Flower Move", 59.99, 60.00, hp, hw, paid);
}

Widget springMove(double hp, double hw, bool paid) {
  return myEx("Spring Move", "16", "Spring Move", 59.99, 60.00, hp, hw, paid);
}

Widget trajectoryMove(double hp, double hw, bool paid) {
  return myEx(
      "Flight Move", "16", "Trajectory Move", 59.99, 60.00, hp, hw, paid);
}

Widget infinityMove(double hp, double hw, bool paid) {
  return myEx("8-move", "16", "Infinity Move", 59.99, 60.00, hp, hw, paid);
}

Widget butterflyMove(double hp, double hw, bool paid) {
  return myEx(
      "Butterfly Move", "16", "Butterfly Move", 59.99, 60.00, hp, hw, paid);
}

Widget ractangularMove(double hp, double hw, bool paid) {
  return myEx(
      "Square Moves", "16", "Ractangular Move", 59.99, 60.00, hp, hw, paid);
}

Widget colorPath(double hp, double hw, bool paid) {
  return myEx(
      "Color Stimulation", "16", "Color Path", 59.99, 60.00, hp, hw, paid);
}

Widget colorStripes(double hp, double hw, bool paid) {
  return myEx(
      "Color blocks", "16", "Color Stripes", 59.99, 60.00, hp, hw, paid);
}

Widget trafficLigths(double hp, double hw, bool paid) {
  return myEx(
      "Hypno Stimulate", "16", "Traffic Lights", 59.99, 60.00, hp, hw, paid);
}

Widget chessboardFlicker(double hp, double hw, bool paid) {
  return myEx("Chessboard Flicker", "16", "Chessboard Flicker", 59.99, 60.00,
      hp, hw, paid);
}

Widget circleMove(double hp, double hw, bool paid) {
  return myEx("Circle Move", "16", "Circle Move", 59.99, 60.00, hp, hw, paid);
}

Widget randomMove(double hp, double hw, bool paid) {
  return myEx("Random Move", "16", "Random Move", 59.99, 60.00, hp, hw, paid);
}

Widget lightFlare(double hp, double hw, bool paid) {
  return myEx(
      "Spiral Illusion", "16", "Light Flare", 59.99, 60.00, hp, hw, paid);
}

Widget kaleidoscope(double hp, double hw, bool paid) {
  return myEx("Kaleidoscope", "16", "Kaleidoscope", 59.99, 60.00, hp, hw, paid);
}

Widget growingPattern(double hp, double hw, bool paid) {
  return myEx(
      "Expansion Focus", "16", "Growing Pattern", 59.99, 60.00, hp, hw, paid);
}

Widget three_part_breathing(double hp, double hw, bool paid) {
  return myEx("Three Part Breath", "16", "3_part_breathing", 59.99, 60.00, hp,
      hw, paid);
}

Widget finger_tapping(double hp, double hw, bool paid) {
  return myEx(
      "Finger Tapping", "16", "finger_tapping", 59.99, 60.00, hp, hw, paid);
}

Widget head_palm_rub(double hp, double hw, bool paid) {
  return myEx(
      "Head Palm Rub", "16", "head_palm_rub", 59.99, 60.00, hp, hw, paid);
}

Widget lymph_cleanse(double hp, double hw, bool paid) {
  return myEx(
      "Lymph Cleanse", "16", "lymph_cleanse", 59.99, 60.00, hp, hw, paid);
}

Widget rhythmic_breathing(double hp, double hw, bool paid) {
  return myEx("Rhythmic Breathing", "16", "rhythmic_breathing", 59.99, 60.00,
      hp, hw, paid);
}

Widget single_nostril(double hp, double hw, bool paid) {
  return myEx("Single Nostril Breathing", "16", "single_nostril", 59.99, 60.00,
      hp, hw, paid);
}
