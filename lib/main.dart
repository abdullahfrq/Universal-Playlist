import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'src/view/playlist.dart';
import 'src/controller/controller.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final _controller = Controller();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _controller.createHomePage(),
    );
  }
}
