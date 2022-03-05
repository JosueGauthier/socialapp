import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/meta/views/authentication/login.views.dart';
import 'package:thesocial/meta/views/authentication/signup.views.dart';

import 'app/providers/provider.dart';

void main() {
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers,
    child: Lava(),);
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Social app',
      //theme: ThemeData(primarySwatch: Colors.blue,),
      theme: ThemeData.dark(),
      initialRoute: LoginRoute,
      routes: routes,
    );
  }
}

