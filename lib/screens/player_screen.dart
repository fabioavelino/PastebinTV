import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebintv/blocs/channels_bloc/bloc.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    final ChannelsBloc channelsBloc = BlocProvider.of<ChannelsBloc>(context);

    return BlocBuilder<ChannelsBloc, ChannelsState>(builder: (context, state) {
      if (state.isPlayerInitialized == false) {
        _controller =
            VideoPlayerController.network(state.channelSelected.urls[0])
              ..initialize().then((_) => _controller.play());
        channelsBloc.add(PlayerInitalized());
      }

      return Container(
          child: Row(
              children: <Widget>[Expanded(child: VideoPlayer(_controller))]));
    });
  }
}
