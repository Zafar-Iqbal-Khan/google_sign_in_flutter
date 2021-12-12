import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/homepage.dart';
import 'package:flutter_firebase/widgets/logged_in_widget.dart';

class HomePageGoogle extends StatelessWidget {
  const HomePageGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const LoggedInWidget();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something Went Wrong'),
              );
            } else {
              return const MyHomePage();
            }
          }),
    );
  }
}
