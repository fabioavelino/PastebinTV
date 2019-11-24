import 'package:flutter/material.dart';
import 'package:pastebintv/models/channels.dart';
import 'package:pastebintv/widgets/channel_widget.dart';

class ChannelsList extends StatelessWidget {
  ChannelsList({this.channels});

  final Channels channels;

  @override
  Widget build(BuildContext context) {
    int elementPerRow = 2;
    double lengthOfList;
    if (channels.channels.length % elementPerRow > 0) {
      lengthOfList = (channels.channels.length -
                  (channels.channels.length % elementPerRow)) /
              elementPerRow +
          1;
    } else {
      lengthOfList = channels.channels.length / elementPerRow;
    }
    List<Row> rows;
    for (var i = 0; i < lengthOfList; i = i + elementPerRow) {
      return Row(children: <Widget>[
        ...channels.channels.sublist(i, i + elementPerRow).map((channel) =>
            ChannelWidget(channel.title, channel.title, null, null))
      ]);
    }
    //List<Row> rows = new List<Row>(lengthOfList.toInt());

    /* rows.map((element) {
      int index = rows.indexOf(element);
      return Row(children: <Widget>[
        ...channels.channels.sublist(index, index + elementPerRow).map(
            (channel) =>
                ChannelWidget(channel.title, channel.title, null, null))
      ]);
    }); */

    print(rows);

    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, position) {
              return rows[position];
            },
            itemCount: rows.length));
  }
}
