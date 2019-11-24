import 'package:equatable/equatable.dart';
import 'package:pastebintv/models/channel.dart';

class Channels extends Equatable {
  final String id;
  final String groupTitle;
  final List<Channel> channels;

  Channels(this.id, this.groupTitle, this.channels);

  @override
  List<Object> get props => [groupTitle, channels];

  factory Channels.fromJson(Map<String, dynamic> json) {
    List<dynamic> channelsFromJson = json['channel'];
    List<Channel> channels =
        channelsFromJson.map((channel) => Channel.fromJson(channel)).toList();
    return Channels(json['_id'], json['groupTitle'], channels);
  }
}
