import 'package:flutter/material.dart';
import '../controller/controller.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Controller();

    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Username'),
                subtitle: Text('username'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Password'),
                subtitle: Text('********'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Email'),
                subtitle: Text('email'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 215.0),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: Color(0xFF0097A7),
                  unselectedItemColor: Color(0xFF717171),
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  currentIndex: 2,
                  onTap: (value) {
                    // Respond to item press.
                    if (value == 0) {}
                    if (value == 1) {
                      _controller.navigateToMusic(context);
                    }
                    if (value == 2) {}
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
                ))
          ],
        ));
  }
}
