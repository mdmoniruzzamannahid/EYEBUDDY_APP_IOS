
import 'package:eye_buddy/screen/training_regime/video_play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportingVideos extends StatefulWidget {
  List<String> videoList;
  SupportingVideos(this.videoList);
  @override
  _SupportingVideosState createState() => _SupportingVideosState();
}

class _SupportingVideosState extends State<SupportingVideos> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
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
          'SUPPORTING VIDEOS',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.videoList.length,
                  itemBuilder: (context, key) {
                    return _traing_card(h, w, 'videos${key + 1}',
                        'VIDEO 0${key + 1}', widget.videoList[key]);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _traing_card(
      double h, double w, String asset, String name, String videoName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x181D3D).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 40,
              offset: Offset(0, 3),
            )
          ],
        ),
        height: h * 0.1,
        width: h * 0.7,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(
                          "assets/svg/supporting_video/$asset.svg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: w * 0.48,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontFamily: 'TTCommons Demibold',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                      "assets/svg/supporting_video/play_button.svg"),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoPlayScreen(videoName))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
