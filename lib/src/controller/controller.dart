import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../view/login.dart';
import '../view/signup.dart';
import '../view/accountProfile.dart';
import '../view/playlist.dart';
import '../../auth.dart';
import '../../api_card_functionality.dart';

class Controller extends ControllerMVC {
  /// Singleton Factory
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }

  static Controller _this;

  Controller._();

  static Controller get con => _this;

  LoginPage createHomePage() {
    return new LoginPage();
  }

  void createLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void createSignupPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }

  void navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountPage()),
    );
  }

  void navigateToMusic(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Playlist()),
    );
  }

  void navigateToPlayer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  void requestGoogleAuth() {
    signInWithUser();
  }

  void requestSignOut() {
    signOutGoogle();
  }
}
