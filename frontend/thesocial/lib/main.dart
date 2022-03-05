import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/meta/views/authentication/login.views.dart';
import 'package:thesocial/meta/views/authentication/signup.views.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Social app',
      //theme: ThemeData(primarySwatch: Colors.blue,),
      theme: ThemeData.dark(),
      initialRoute : LoginRoute,
      routes: routes,
    );
  }
}
