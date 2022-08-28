import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TestPage extends StatefulWidget {
  final GoogleSignInAccount? user;

  TestPage({@required this.user});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
           widget.user!.displayName!
        ),
      ),
    );
  }
}
