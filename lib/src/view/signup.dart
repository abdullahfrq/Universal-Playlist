import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Set up the widgets that we want to display
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 30, color: Colors.purpleAccent[700]),
            ),
            SizedBox(height: 50),
            Container(
              width: 350.0,
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), hintText: 'Username'),
              ),
            ),
            Container(
              width: 350.0,
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), hintText: 'Email'),
              ),
            ),
            Container(
              width: 350.0,
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), hintText: 'Password'),
              ),
            ),
            Container(
              width: 350.0,
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Retype Password'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.purpleAccent[700]),
              onPressed: () {
                print('Login Button pressed: True');
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
