import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_social_media/app.dart';
import 'package:flutter_social_media/shared/constants.dart';
import 'firebase_options.dart';

// ...
Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final app = await Firebase.initializeApp(
  //   name: "flutter-social-media",
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // AppConfig.shared.database = FirebaseDatabase.instanceFor(
  //   app: app,
  //   databaseURL: app.options.databaseURL,
  // );
  // print(app.options.appId);
  // BlocOverrides.runZoned(
  //     blocObserver: HCM23BlocObserver(),
  //     () => runApp(const GlobalBlocProviders()));
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppConfig.shared.database = FirebaseDatabase.instanceFor(
    app: app,
    databaseURL: app.options.databaseURL,
  );
  runApp(const MyApp());
}

// class HCM23BlocObserver implements BlocObserver {
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     print("onChange $bloc");
//   }

//   @override
//   void onClose(BlocBase bloc) {
//     print("onClose $bloc");
//   }

//   @override
//   void onCreate(BlocBase bloc) {
//     print("onCreate $bloc");
//   }

//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print("onError $bloc");
//   }

//   @override
//   void onEvent(Bloc bloc, Object? event) {
//     print("onEvent $bloc");
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     print("onTransition $bloc");
//   }
// }
