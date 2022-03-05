import 'package:thesocial/meta/views/authentication/login.views.dart';
import 'package:thesocial/meta/views/authentication/signup.views.dart';

final String LoginRoute = "/login";
final String SignupRoute = "/signup";
final String HomeRoute = "/";

final routes ={
  LoginRoute : (context) => LoginView(),
  SignupRoute : (context) => SignupView(),

};
