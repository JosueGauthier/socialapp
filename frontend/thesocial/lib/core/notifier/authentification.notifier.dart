import 'package:flutter/cupertino.dart';
import 'package:thesocial/core/api/authentification.api.dart';

class AuthenticationNotifier extends ChangeNotifier{

  final AuthenticationAPI _authenticationAPI = new AuthenticationAPI();

  Future signup({
    required String name,
    required String password,
    required String email,
  }) async{
    try{

      await _authenticationAPI.signUp(name: name, password: password, email: email);

    }
    catch (error){
      print(error);
    }
  }


  Future login({
    required String password,
    required String email,
  }) async{
    try{

      await _authenticationAPI.login(password: password, email: email);

    }
    catch (error){
      print(error);
    }
  }
}