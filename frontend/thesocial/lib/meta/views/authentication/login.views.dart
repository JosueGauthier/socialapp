import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    return Scaffold(
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
          const MaterialButton(
            child: Text("login"),
            onPressed: null,
            color: Colors.white,
          ),
        ],
      )),
    ));
  }
}
