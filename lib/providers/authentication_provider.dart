//packages
import 'package:chatify/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//services
import '../services/navigation_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    // _auth.signOut();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        // print("Logged in");
        _databaseService.updateUserLastSeenTime(_user.uid);
        _databaseService.getUser(_user.uid);
      } else {
        print("Not Authenticated");
      }
    });
  }

  Future<void> loginUsingEmailPassword(String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(_auth.currentUser);
    } on FirebaseAuthException {
      print("Error loggin user into Firebase");
    } catch (e) {
      print(e);
    }
  }
}
