import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayScreen extends StatefulWidget {
//  const VideoPlayScreen({Key key}) : super(key: key);
  String videoName;
  VideoPlayScreen(this.videoName);

  @override
  _VideoPlayScreenState createState() => _VideoPlayScreenState(videoName);
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  String videoName;
  _VideoPlayScreenState(this.videoName);

  YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState

    _controller = YoutubePlayerController(
      initialVideoId: videoName,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Image.asset('assets/icon/back_arrow.png'),
            onTap: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'PLAY VIDEO',
          style: TextStyle(
            fontFamily: 'TT Commons DemiBold',
            fontSize: 18,
            color: const Color(0xff181d3d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Center(
        child: Container(
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }
}
