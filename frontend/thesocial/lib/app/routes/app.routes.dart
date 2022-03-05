import 'package:thesocial/meta/views/authentication/login.views.dart';
import 'package:thesocial/meta/views/authentication/signup.views.dart';
import 'package:thesocial/meta/views/deciderview/deciderview.dart';
import 'package:thesocial/meta/views/homeview/homeview.dart';

final String LoginRoute = "/login";
final String SignupRoute = "/signup";
final String DeciderRoute = "/decider";
final String HomeRoute = "/";

final routes ={
  LoginRoute : (context) => LoginView(),
  DeciderRoute : (context) => DeciderView(),
  SignupRoute : (context) => SignupView(),
  HomeRoute : (context) => HomeView(),


};
