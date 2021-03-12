import 'package:flutter/material.dart';
import '../controller/controller.dart';
import '../view/playlist.dart';

class LoginPage extends StatelessWidget {
  final _controller = new Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Set up the widgets that we want to display
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                elevation: 3,
                primary: Colors.black,
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                // Respond to button press

                try {
                  _controller.requestGoogleAuth();
                  createAlertDialog(context);
                } catch (e) {
                  print(e.toString());
                  return null;
                }

                //_controller.requestGoogleAuth();
                //createAlertDialog(context);
              },
              icon: Image.asset("assets/google_logo.png",
                  width: 35.0, height: 35.0),
              label: Text("Sign in with Google"),
            ),
            SizedBox(height: 5),
            OutlinedButton.icon(
              onPressed: () {
                // Respond to button press
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                elevation: 3,
                primary: Colors.black,
                backgroundColor: Colors.white,
              ),
              icon: Image.asset("assets/Spotify_Icon_RGB_Green.png",
                  width: 35.0, height: 35.0),
              label: Text("Sign in with Spotify"),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Container(width: 35.0, height: 1),
          RaisedButton(
            child: Text('Sign up'),
            onPressed: () {
              _controller.createSignupPage(context);
            },
          ),
          RaisedButton(
            child: Text('Playlist'),
            onPressed: () {
              _controller.navigateToMusic(context);
            },
          ),
          RaisedButton(
              child: Text('Sign Out'),
              onPressed: () {
                _controller.requestSignOut();
              }),
        ],
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      content: Text("User has been logged in"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
