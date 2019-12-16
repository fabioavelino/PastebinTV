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
            child: Row(
              children: [
                /* Stack(children: [
              background != null ? Image.network(background) : null,
              icon != null ? Image.network(icon) : null
            ]), */
                Center(child: Text(title)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
            width: 150,
            margin: EdgeInsets.all(20)));
  }
}
