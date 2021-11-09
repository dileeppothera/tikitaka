import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  @override
  _AppVideoPlayerState createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(
              color: Colors.black,
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
