import 'package:flutter/material.dart';
import 'package:pastebintv/screens/channels_screen.dart';
import 'package:pastebintv/screens/player_screen.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => ChannelsScreen(),
  "/play": (BuildContext context) => PlayerScreen()
};
