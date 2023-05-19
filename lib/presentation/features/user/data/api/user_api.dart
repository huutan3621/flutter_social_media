import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';
import 'package:flutter_social_media/shared/constants.dart';

class UserApi {
  UserApi();

  static Future<void> getInforUser(
    String id,
    void Function(UserModel user) onSuccess,
  ) async {
    try {
      try {
        final starCountRef = AppConfig.shared.database$.ref('users/$id');
        late final UserModel user;
        starCountRef.onValue.listen((DatabaseEvent event) {
          final data = event.snapshot.value;
          user = UserModel.fromJson(jsonDecode(jsonEncode(data)));
          onSuccess.call(user);
        });

        return;
      } catch (e) {
        return;
      }
    } catch (e) {
      return;
    }
  }

  static Future<UserModel?> getAuthUser(
    String id,
  ) async {
    try {
      final starCountRef = AppConfig.shared.database$.ref('users/$id');
      late final UserModel user;
      starCountRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        user = UserModel.fromJson(jsonDecode(jsonEncode(data)));
      });

      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<void> updateUser({
    required UserModel userModel,
    required String userId,
    required void Function(bool result) onSuccess,
  }) async {
    try {
      final ref = AppConfig.shared.database$.ref('users/$userId');
      await ref.update(userModel.toJson());
      onSuccess.call(true);
    } catch (e) {}
    // await UserRepo.getUserData(id, (user2) {
    //   UserRepoX.shared.signedInUser = user2;
    // });
  }
}

class UserNotFoundFailure implements Exception {}

class UserRequestFailure {}
