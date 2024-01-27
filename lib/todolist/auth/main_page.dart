import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen/home.dart';
import 'auth_page.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // You can show a loading indicator while checking authentication state
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // User is authenticated, navigate to Home_Screen
            return Home_Screen();
          } else {
            // User is not authenticated, navigate to Auth_Page
            return Auth_Page();
          }
        },
      ),
    );
  }
}
