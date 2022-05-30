import 'package:flutter/material.dart';

class PradStory extends StatefulWidget {
  @override
  _PradStoryState createState() => _PradStoryState();
}

class _PradStoryState extends State<PradStory> {
  @override
  Widget build(BuildContext context) {
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
          'PRAD STORY',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset("assets/images/prad_story/story2.JPEG"),
            Image.asset("assets/images/prad_story/story1.JPEG"),
          ],
        ),
      ),
    );
  }
}
