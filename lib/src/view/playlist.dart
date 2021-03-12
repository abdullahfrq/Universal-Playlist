import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/controller.dart';
import '../view/login.dart';

class Playlist extends StatefulWidget {
  Playlist({Key key}) : super(key: key);

  static final String title = 'CSC301finalproject';

  @override
  _PlaylistPageState createState() => new _PlaylistPageState();
}

class _PlaylistPageState extends State<Playlist> {
  //The controllers for video player link and playlist link
  TextEditingController nameController = TextEditingController();
  final _linkFieldController = TextEditingController();
  final _videoStringController = TextEditingController();
  final _controller = Controller();
  final List<String> videos = <String>[];

  YoutubePlayerController _playlistController =
      YoutubePlayerController(initialVideoId: "JvS8i2TDPSo");

  String playListTitle = "New Playlist";

  void addItemToList() {
    setState(() {
      videos.insert(0, _videoStringController.text);
    });
  }

  // Clean up the link field controller when the widget is disposed.
  @override
  void dispose() {
    _linkFieldController.dispose();
    super.dispose();
  }

  //Set up the controller (note: an initial video id is needed whether the user requests one or not)

  // List<Widget>list = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //Set up the widgets that we want to display
            children: <Widget>[
              /*----------------PLAYLIST TITLE--------------*/
              Padding(padding: const EdgeInsets.all(40.0)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Column contents horizontally
                  children: <Widget>[
                    /*PLAYLIST TITLE TEXT*/
                    Flexible(
                      child: Text(
                        playListTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 36.0),
                      ),
                    ),
                    /*EDIT BUTTON*/
                    Flexible(
                        child: IconButton(
                            icon: Icon(Icons.create_rounded),
                            tooltip: 'Edit Playlist Name',
                            onPressed: () {
                              playListTitle = "GIMME DA 4.0";
                              setState(() {});
                            }))
                  ]),
              /*----------------LISTVIEW ADD TEXT BOX-------------*/
              Padding(padding: const EdgeInsets.all(10.0)),
              Container(
                width: 350,
                child: Row(
                  children: [
                    Expanded(
                      //make sure the ration between the texbox and button is 4:1
                      flex: 4,
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _videoStringController,

                          //INPUT STYLING
                          decoration: InputDecoration(
                            //DEFAULT BORDER
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0)),
                            ),
                            //BORDER WHEN SELECTED
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: const Color(0xFF0097A7), width: 1.5),
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0)),
                            ),
                            //make sure the input text has space to the left
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: 'Add a Video to the Playlist',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      //make sure the ration between the texbox and button is 4:1
                      flex: 1,
                      child: SizedBox(
                        //Make the button height match the height of the text field
                        height: 40,
                        child: FlatButton(
                          color: const Color(0xFF0097A7),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
                          child: Text('Add',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            addItemToList();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /*------------LIST VIEW---------------*/
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                              child: new InkWell(
                            child: new Text(
                              '${videos[index]}',
                              style: TextStyle(fontSize: 12),
                            ),
                            onTap: () {
                              String url =
                                  YoutubePlayer.convertUrlToId(videos[index]);
                              if (url == null) {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // Retrieve the controller data and bring up a video player
                                      content: Text("ERROR: Invalid URL"),
                                    );
                                  },
                                );
                              } else {
                                // Modify the controller based on the text field value
                                _playlistController =
                                    new YoutubePlayerController(
                                        initialVideoId:
                                            YoutubePlayer.convertUrlToId(
                                                videos[index]),
                                        flags: YoutubePlayerFlags(
                                          mute: false,
                                          autoPlay: true,
                                        ));
                                // Display the alert box
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // Retrieve the controller data and bring up a video player
                                      content: YoutubePlayer(
                                        controller: _playlistController,
                                        showVideoProgressIndicator: true,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          )),
                        );
                      })),
              /*------------NAV BAR-----------------*/
              BottomNavigationBar(
                currentIndex: 1,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xFFFFFFFF),
                selectedItemColor: const Color(0xFF0097A7),
                unselectedItemColor: const Color(0xFF717171),
                selectedFontSize: 14,
                unselectedFontSize: 14,
                onTap: (value) {
                  if (value == 0) {
                    _controller.navigateToPlayer(context);
                  } else if (value == 1) {
                  } else if (value == 2) {
                    _controller.navigateToProfile(context);
                  }
                },
                items: [
                  BottomNavigationBarItem(
                    title: Text('Music'),
                    icon: Icon(Icons.music_note),
                  ),
                  BottomNavigationBarItem(
                    title: Text('Playlist'),
                    icon: Icon(Icons.queue_music_outlined),
                  ),
                  BottomNavigationBarItem(
                    title: Text('Profile'),
                    icon: Icon(Icons.person_sharp),
                  ),
                ],
              ),
            ],
          ),
        ),
        /*-----LOGIN BUTTON--------*/
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton(
            onPressed: () {
              _controller.createLoginPage(context);
              /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );*/
            },
            child: Text('Login'),
            backgroundColor: Colors.orangeAccent,
          ),
        ));
  }
}

//TODO
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Controller();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Set up the widgets that we want to display
          children: <Widget>[
            /*----------------PLAYLIST TITLE--------------*/
            Padding(padding: const EdgeInsets.all(40.0)),
            Text(
              "Playlist",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
            ),

            /*------------NAV BAR-----------------*/
            BottomNavigationBar(
              currentIndex: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFFFFFFFF),
              selectedItemColor: const Color(0xFF0097A7),
              unselectedItemColor: const Color(0xFF717171),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                if (value == 0) {
                } else if (value == 1) {
                  _controller.navigateToMusic(context);
                } else if (value == 2) {
                  _controller.navigateToProfile(context);
                }
              },
              items: [
                BottomNavigationBarItem(
                  title: Text('Music'),
                  icon: Icon(Icons.music_note),
                ),
                BottomNavigationBarItem(
                  title: Text('Playlist'),
                  icon: Icon(Icons.queue_music_outlined),
                ),
                BottomNavigationBarItem(
                  title: Text('Profile'),
                  icon: Icon(Icons.person_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//TODO
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Profile"),
      backgroundColor: Colors.blue,
    ));
  }
}
