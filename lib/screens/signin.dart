import 'package:digital_id/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  Color primary = const Color.fromRGBO(249, 118, 66, 1);
  Color secondary = const Color.fromRGBO(194, 172, 161, 1);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = false;
  bool isOn = false;

  void _getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.getBool('isOn') != null
          ? isOn = prefs.getBool('isOn')!
          : prefs.setBool('isOn', false);
    });
  }

  @override
  void initState() {
    _getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .042,
            vertical: MediaQuery.sizeOf(context).width * .02),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                        child: Image.asset('assets/images/Asset_4.png'),
                        width: MediaQuery.sizeOf(context).width * .45,
                        margin: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * .05)),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                    Divider(),
                    Container(
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                          filled: true,
                          fillColor: primary,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 10.0),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .015),
                    Container(
                      child: TextField(
                        controller: passwordController,
                        obscureText: !isVisible,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(36.0),
                          ),
                          filled: true,
                          fillColor: primary,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 0),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .017,
              ),
              Switch(
                value: isOn,
                onChanged: (data) async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isOn', data);
                  setState(() {
                    isOn = data;
                  });
                },
              ),
              GestureDetector(
                child: Container(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * .4,
                    child: Image.asset(
                      'assets/images/Asset_box.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
