import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';

class AppConfig {
  String? dbUrl;
  late FirebaseDatabase? database;
  FirebaseDatabase get database$ => database!;

  AppConfig._internal();
  static AppConfig? _instance;
  static AppConfig get shared {
    _instance ??= AppConfig._internal();

    return _instance!;
  }
}

class UserRepoX {
  UserRepoX._internal();
  static UserRepoX? _instance;
  static UserRepoX get shared {
    _instance ??= UserRepoX._internal();

    return _instance!;
  }

  UserModel? signedInUser;
  UserModel get user => signedInUser!;

  String? userId;
  String get userId$ => userId!;
}
