import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pastebintv/widgets/TextInput.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: VideoPage()),
    );
  }
}

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  VideoComponent createState() => VideoComponent();
}

class VideoComponent extends State<VideoPage> {
  bool shouldPlay = false;
  TextEditingController urlController = TextEditingController();
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    urlController.text = "";
  }

  void buttonOnPressed() {
    setState(() {
      this.shouldPlay = true;
    });
    _controller = VideoPlayerController.network(urlController.text)
      ..initialize().then((_) {
        var timer = Timer(Duration(seconds: 2), () => _controller.play());
      });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldPlay) {
      return Container(
          child: Row(
              children: <Widget>[Expanded(child: VideoPlayer(_controller))]));
    }

    return Column(children: <Widget>[
      Text("Pastebin TV", style: Theme.of(context).textTheme.title),
      Container(
          height: 200,
          child: Center(
              child: Column(
            children: <Widget>[
              TextInput(placeholder: "URL", controller: urlController),
              RaisedButton(child: Text("Load"), onPressed: buttonOnPressed)
            ],
          )))
    ]);
  }
}
