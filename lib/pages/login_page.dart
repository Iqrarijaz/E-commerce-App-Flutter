import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final _fromKey=GlobalKey<FormState>();


  moveToHome(BuildContext context) async
  {
    if(_fromKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          backgroundColor: context.canvasColor,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: _fromKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Image.asset("assets/images/welcome.png",
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Welcome $name",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter username",
                              labelText: "Username",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username can not be empty';
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
                                  hintText: "Enter password",
                                  labelText: "Password"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can not be empty';
                              }
                              else if(value.length<4)
                                {
                                  return "Password must be greater than 4";
                                }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          InkWell(
                            onTap: ()=>moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              alignment: Alignment.center,
                              height: 40.0,
                              width: 150.0,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                ),
                              ),

                              decoration: BoxDecoration(
                                color:context.theme.buttonColor,
                                borderRadius: BorderRadius.circular(7),
                              ),

                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
