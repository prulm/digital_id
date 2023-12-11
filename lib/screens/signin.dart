import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(

                ),
              ),
              Expanded(
                child: Image.asset('assets/images/Asset_1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}