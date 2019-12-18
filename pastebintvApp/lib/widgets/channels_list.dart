import 'package:flutter/material.dart';
import 'package:pastebintv/models/channels.dart';
import 'package:pastebintv/widgets/channel_widget.dart';

class ChannelsList extends StatelessWidget {
  ChannelsList({this.channels, this.onPressedChannel});

  final Channels channels;
  final Function onPressedChannel;

  @override
  Widget build(BuildContext context) {
    int elementPerRow = (MediaQuery.of(context).size.width / 230).floor();
    double lengthOfList;
    if (channels.channels.length % elementPerRow > 0) {
      lengthOfList = (channels.channels.length -
                  (channels.channels.length % elementPerRow)) /
              elementPerRow +
          1;
    } else {
      lengthOfList = channels.channels.length / elementPerRow;
    }
    List<Row> rows = new List<Row>();
    for (var i = 0; i < lengthOfList.toInt(); i = i + elementPerRow) {
      print(i);
      print(lengthOfList);
      rows.add(Row(
        children: <Widget>[
          ...channels.channels.sublist(i, i + elementPerRow).map((channel) =>
              ChannelWidget(channel.title, channel.title, null, () {
                onPressedChannel(channel);
              }))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ));
    }

    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, position) {
              return rows[position];
            },
            itemCount: rows.length));
  }
}
