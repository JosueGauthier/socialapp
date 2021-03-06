import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:thesocial/core/notifier/authentification.notifier.dart';
import 'package:thesocial/core/notifier/utility.notifier.dart';

List<SingleChildWidget> providers =[...remoteProvider];

//Independant provider remote providers

List<SingleChildWidget> remoteProvider =[

  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  ChangeNotifierProvider(create: (_) => UtilityNotifier())


];