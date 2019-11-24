import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pastebintv/models/channel.dart';

@immutable
abstract class ChannelsEvent extends Equatable {
  const ChannelsEvent();

  @override
  List<Object> get props => [];
}

class LoadChannels extends ChannelsEvent {}

class SelectChannel extends ChannelsEvent {
  final Channel channelSelected;

  const SelectChannel(this.channelSelected);

  @override
  List<Object> get props => [channelSelected];
}
