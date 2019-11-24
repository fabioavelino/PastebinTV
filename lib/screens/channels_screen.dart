import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebintv/blocs/channels_bloc/bloc.dart';
import 'package:pastebintv/services/service.dart';
import 'package:pastebintv/widgets/channels_list.dart';

class ChannelsScreen extends StatelessWidget {
  ChannelsScreen();
  @override
  Widget build(BuildContext context) {
    final ChannelsBloc channelsBloc = BlocProvider.of<ChannelsBloc>(context);
    return Scaffold(body: Container(child:
        BlocBuilder<ChannelsBloc, ChannelsState>(builder: (context, state) {
      if (state.isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return Column(children: <Widget>[ChannelsList(channels: state.channels)]);
    })));
  }
}
