import 'package:flutter/cupertino.dart';
import 'package:thesocial/core/services/cach.services.dart';
import 'package:thesocial/meta/views/authentication/login.views.dart';
import 'package:thesocial/meta/views/splashview/splashview.dart';

import '../homeview/homeview.dart';

class DeciderView extends StatelessWidget {
  const DeciderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CacheService cacheService = new CacheService();
    return FutureBuilder(
      future: cacheService.readCache(key: "jwt"),
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return SplashView();
        }
        if (snapshot.hasData){
          return HomeView();

        } else {
          return LoginView();
        }

    });

  }
}
