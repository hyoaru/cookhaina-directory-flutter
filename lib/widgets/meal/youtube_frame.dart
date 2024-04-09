import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeFrame extends StatefulWidget {
  final String youtubeLink;
  const YoutubeFrame({super.key, required this.youtubeLink});

  @override
  State<YoutubeFrame> createState() => _YoutubeFrameState();
}

class _YoutubeFrameState extends State<YoutubeFrame> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.youtubeLink)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      
    );
  }
}
