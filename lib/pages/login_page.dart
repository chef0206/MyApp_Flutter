import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_img.png", fit: BoxFit.cover),
              SizedBox(
                height: 20.0,
                // child: Text("hola"),
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Enter UserName", labelText: "UserName"),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      InkWell(
                          onTap: () {
                            setState(() {
                              changeButton = true;
                            });
                            // Navigator.pushNamed(context, MyRoutes.homeRoute);
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changeButton ? 90 : 120,
                            color: Colors.teal,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                            decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              shape: changeButton
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              // borderRadius: BorderRadius.circular(changeButton? 50: 8)),
                            ),
                          )),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text("Login"),
                      //   style:
                      //       (TextButton.styleFrom(minimumSize: Size(120, 40))),
                      // )
                    ],
                  )),
            ],
          ),
        ));
  }
}
