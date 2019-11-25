import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebintv/blocs/channels_bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:pastebintv/models/channel.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  @override
  PlayerScreenState createState() => PlayerScreenState();
}

class PlayerScreenState extends State<PlayerScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void initPlayer(Channel channel, int index) {
    if (index >= 5) {
      return;
    }
    _controller = VideoPlayerController.network(channel.urls[index])
      ..initialize().then((_) {
        _controller.play();
        return;
      }).catchError((onError) {
        initPlayer(channel, index + 1);
      }).timeout(Duration(seconds: 3), onTimeout: () {
        initPlayer(channel, index + 1);
      });
  }

  @override
  Widget build(BuildContext context) {
    final ChannelsBloc channelsBloc = BlocProvider.of<ChannelsBloc>(context);

    return BlocBuilder<ChannelsBloc, ChannelsState>(builder: (context, state) {
      if (state.isPlayerInitialized == false) {
        initPlayer(state.channelSelected, 0);
        channelsBloc.add(PlayerInitalized());
      }

      return Container(
          child: Row(
              children: <Widget>[Expanded(child: VideoPlayer(_controller))]));
    });
  }
}
