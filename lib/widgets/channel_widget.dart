import 'package:flutter/material.dart';

class ChannelWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String background;
  final VoidCallback onPressed;

  ChannelWidget(this.title, this.icon, this.background, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("on tap");
          onPressed();
        },
        child: Container(
          child: Row(children: [
            Stack(children: [Image.network(background), Image.network(icon)]),
            Text(title)
          ]),
          decoration: BoxDecoration(border: Border.all()),
        ));
  }
}
