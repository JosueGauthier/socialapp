import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/services/cach.services.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CacheService cacheService = new CacheService();

    return Scaffold(
      floatingActionButton: FloatingActionButton(

        onPressed: (){
          cacheService.deleteCache(key: "jwt").whenComplete((){

            Navigator.of(context).pushNamed(LoginRoute);

          });
        },

      ),
      appBar: AppBar(
        title: Text("Home view"),

      ),
    );
  }
}
