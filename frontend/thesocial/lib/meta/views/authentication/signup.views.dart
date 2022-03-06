import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/notifier/authentification.notifier.dart';
import 'package:thesocial/core/notifier/utility.notifier.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    var authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);

    var utilityNotifier = Provider.of<UtilityNotifier>(context, listen: false);
    var _userimage =
        Provider.of<UtilityNotifier>(context, listen: true).userimage;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(utilityNotifier.userimage);
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Signup view"),
        ),
        body: Container(
          child: Center(
              child: SingleChildScrollView(
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
                  child: Text(utilityNotifier.userimage!.isEmpty
                      ? "Upload image"
                      : "Reselect"),
                  color: Colors.redAccent,
                  onPressed: () {
                    utilityNotifier.uploadUserImage(context: context);
                  },
                ),
                _userimage!.isNotEmpty
                    ? Container(
                        // si _userimage non vide non vide
                        height: 100,
                        width: 100,
                        child: Image.network(utilityNotifier.userimage!),
                      )
                    : Container(
                        // si userimage vide vide
                        height: 0,
                      ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  child: Text("Sign up"),
                  color: Colors.redAccent,
                  onPressed: () {
                    authenticationNotifier.signup(
                        context: context,
                        username: namecontroller.text,
                        userpassword: passwordcontroller.text,
                        useremail: emailcontroller.text,
                        userimage: utilityNotifier.userimage!);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginRoute);
                  },
                  child: Text("Have an account ? Login up now !"),
                ),
              ],
            ),
          )),
        ));
  }
}
