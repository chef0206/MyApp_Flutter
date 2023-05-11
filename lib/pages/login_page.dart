import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign Up")),
        body: Material(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset("assets/images/hey.png", fit: BoxFit.cover),
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
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter UserName",
                                  labelText: "UserName"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "UserName can't be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password"),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Password can't be empty";
                                else if (value.length < 6) {
                                  return "Password length should  be atleast 6";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Material(
                              color: Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 8),
                              child: InkWell(
                                  onTap: () => movetoHome(context),
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    height: 50,
                                    width: changeButton ? 90 : 120,
                                    // color: Colors.teal,
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
                                  )),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )));
  }
}
