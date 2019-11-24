import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pastebintv/models/channels.dart';
import 'package:pastebintv/models/channel.dart';

class ChannelsState extends Equatable {
  final Channels channels;
  final Channel channelSelected;
  final bool isPlay;
  final bool isLoading;

  const ChannelsState(
      this.channels, this.channelSelected, this.isPlay, this.isLoading);

  factory ChannelsState.initialState() {
    return ChannelsState(null, null, false, true);
  }

  ChannelsState copyWith(
      {Channels channels,
      Channel channelSelected,
      bool isPlay,
      bool isLoading}) {
    return ChannelsState(
        channels ?? this.channels,
        channelSelected ?? this.channelSelected,
        isPlay ?? this.isPlay,
        isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [channels, channelSelected, isPlay, isLoading];

  @override
  String toString() {
    return '''ChannelsState {
      channels: $channels,
      channelSelected: $channelSelected,
      isPlay: $isPlay,
      isLoading: $isLoading
    }''';
  }
}
