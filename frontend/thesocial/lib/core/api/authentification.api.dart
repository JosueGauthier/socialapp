import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thesocial/app/routes/api.routes.dart';

class AuthenticationAPI {

  final client = http.Client();

  //! Create new user

  Future signUp({

    required String name,
    required String password,
    required String email,

  })
  async {
    final String subUrl = "/user/signup";
    final Uri uri = Uri.parse(APIroutes.BaseURL + subUrl);
    print(uri);
    final http.Response response = await client.post(
        uri,
        body: jsonEncode({

          "username": name,
          "useremail": email,
          "userpassword": password,

        }),
        headers: {

          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",

        });
    final statusCode = response.statusCode;
    final body = response.body;
    if(statusCode == 200){
      print(body);
      return body;
    }

    }

  Future login({


    required String password,
    required String email,

  })
  async {
    final String subUrl = "/user/login";
    final Uri uri = Uri.parse(APIroutes.BaseURL + subUrl);
    print(uri);
    final http.Response response = await client.post(
        uri,
        body: jsonEncode({

          "useremail": email,
          "userpassword": password,

        }),
        headers: {

          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",

        });
    final statusCode = response.statusCode;
    final body = response.body;
    if(statusCode == 200){
      print(body);
      return body;
    }

  }
}