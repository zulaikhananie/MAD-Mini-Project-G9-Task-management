import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_management/todolist/auth/main_page.dart';
import 'package:task_management/todolist/screen/home.dart';
import 'firestor.dart';

class AuthenticationRemote {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // User logged in successfully
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Navigate to the home page or any other destination
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Main_Page(),
          ),
        );
      }
    } catch (e) {
      // Handle login errors
      print('Login error: $e');
      // You can show an error message to the user here
    }
  }

  Future<void> register(String email, String password, String passwordConfirm, BuildContext context) async {
    try {
      if (passwordConfirm == password) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
        await Firestore_Datasource().CreateUser(email);
        // Navigate to the home page or another page on successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home_Screen(), // Replace with your home page
          ),
        );
      }
    } catch (e) {
      // Handle registration errors (e.g., display an error message)
      print(e);
    }
  }
}
