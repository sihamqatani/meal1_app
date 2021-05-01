import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus { unauthentecated, authentecating, authentecated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  AuthStatus _authStatus = AuthStatus.unauthentecated;
  String errorMessage;

  FirebaseAuth get auth => _auth;

  User get user => _user;

  AuthStatus get authStatus => _authStatus;

  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        _authStatus = AuthStatus.unauthentecated;
      } else {
        _user = user;
      }
      notifyListeners();
    });
  }

  Future<bool> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _authStatus = AuthStatus.authentecating;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Inalid-email') {
        errorMessage = 'الايميل غير صحيح';
      }
      if (e.code == 'user-not-found') {
        {
          errorMessage = 'المستخدم غير موجود';
        }
      } else if (e.code == 'wrong-password') {
        {
          errorMessage = 'كلمة المرور خاطئة';
        }
      }
      notifyListeners();
      return false;
    }
  }

  signOut() async {
    _auth.signOut();
    _authStatus = AuthStatus.authentecated;
    notifyListeners();
  }
}
