import 'package:eye_buddy/util/const_config.dart';
import 'package:flutter/material.dart';

class SportVisionTips extends StatefulWidget {
  @override
  _SportVisionTipsState createState() => _SportVisionTipsState();
}

class _SportVisionTipsState extends State<SportVisionTips> {
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
                  '1.  Practice looking up from your computer and focusing on something about 18 inches away and then something far away such as a view out a window for better eye flexibility.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '2. Play memory games with a focus on improving your speed.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '3.Practice “watching” from the sides of your eyes, both left and right, when you are online, walking outside or shopping. This will improve Peripheral vision.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '4. Practice catching or kicking the ball with only one eye open, training each eye separately. Or play with small objects at arm’s length, like tapping two pencil tips, dropping a toothpick through a straw, or threading a needle.',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '5. Table Tennis-Ping Pong games to improve hand-eye coordination',
                  style: nStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '6.   Perform the eye exercises daily to improve reaction time to moving objects and to train peripheral vision by doing the exercises sideways.',
                  style: nStyle(),
                ),
              ),
            ]),
          ),
        ));
  }
}
