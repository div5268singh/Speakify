import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:speakify/screens/splash.dart';
import 'package:speakify/sign_up_email.dart';

class AuthService {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          debugPrint(snapshot.data.toString());
          print("9" + snapshot.data.toString());
          if (snapshot.hasData) {
            return Sign_Email();
          } else {
            return Splash();
          }
        });
  }

  signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    FirebaseAuth.instance.authStateChanges();
    handleAuthState();
  }

  signOut() async {
    signInWithGoogle().clear();
    await FirebaseAuth.instance.currentUser!.delete();
    FirebaseAuth.instance.signOut();
    googleSignIn.signOut();
  }
}
