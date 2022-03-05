import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login view"),
        ),
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: "Enter email"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                child: Text("login"),
                color: Colors.redAccent,
                onPressed: (){},
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(SignupRoute);
                  },
                  child: Text("First time ? Sign up now !"),

              ),
            ],
          )),
        ));
  }
}
