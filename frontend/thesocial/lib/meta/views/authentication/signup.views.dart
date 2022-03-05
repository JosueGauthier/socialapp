import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Signup view"),
        ),
        body: Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(hintText: "Enter your email"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(hintText: "Enter your username"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(hintText: "Enter a new password"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    child: Text("Sign up"),
                    color: Colors.redAccent,
                    onPressed: (){},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(LoginRoute);
                    },
                    child: Text("Have an account ? Login up now !"),

                  ),
                ],
              )),
        ));
  }
}
