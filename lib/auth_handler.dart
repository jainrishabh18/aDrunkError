import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metaphyc/screens/dashboard_page.dart';
import 'package:metaphyc/screens/login_page.dart';

class AuthHandle {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return DashboardPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
