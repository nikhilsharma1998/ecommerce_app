import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  bool get isAuthenticated => currentUser != null;


  User? get user => _user;


  AuthProvider() {
    _authService.user.listen(_onAuthStateChanged);
  }


Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners(); // Notify listeners to update the UI
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "An unknown error occurred.";
      
    }
  }
  // Future<bool> signIn(String email, String password) async {
  //   try {
  //     _user = await _authService.signInWithEmail(email, password);
  //     notifyListeners();
  //     return true; // Sign-in successful
  //   } catch (e) {
  //     return false; // Sign-in failed
  //   }
  // }

  Future<bool> signUp(String email, String password) async {
    try {
      _user = await _authService.signUpWithEmail(email, password);
      notifyListeners();
      return true; // Sign-up successful
    } catch (e) {
      return false; // Sign-up failed
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }
}
