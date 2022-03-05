import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thesocial/app/routes/app.routes.dart';
import 'package:thesocial/core/api/authentification.api.dart';
import 'package:thesocial/core/services/cach.services.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationAPI _authenticationAPI = new AuthenticationAPI();
  final CacheService cacheService = new CacheService();

  Future signup({
    required String name,
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    try {
      var userData = await _authenticationAPI.signUp(
          name: name, password: password, email: email);

      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        cacheService.writeCache(key: "jwt", value: userJWT);
        Navigator.of(context).pushNamed(HomeRoute);
      }else{

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));

      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
    }
  }

  Future login({
    required String password,
    required String email,
    required BuildContext context,
  }) async {

    try {
      var userData = await _authenticationAPI.login(
          password: password, email: email);

      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        cacheService.writeCache(key: "jwt", value: userJWT);
        Navigator.of(context).pushNamed(HomeRoute);
      }else{

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));

      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
    }
    try {
      await _authenticationAPI.login(password: password, email: email);
    } catch (error) {
      print(error);
    }
  }
}
