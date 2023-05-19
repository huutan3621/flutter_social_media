import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_social_media/services/firebase/fir_api_helper.dart';
import 'package:flutter_social_media/shared/network/data_state.dart';

class FirAuthRepo {
  static Future<DataState<UserCredential?>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    dynamic Function(DataSuccess<UserCredential?>)? onSuccess,
    dynamic Function(String)? onFailure,
  }) async {
    return firebaseApiHelper<UserCredential?>(
        config: FirebaseApiHelperConfig<UserCredential>(
      apiFunction: FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password),
      type: FirebaseApiEnum.auth,
      onFailure: onFailure,
      onSuccess: onSuccess,
    ));
  }

  static Future<DataState<UserCredential?>> signInWithEmailAndPassword({
    required String email,
    required String password,
    dynamic Function(DataSuccess<UserCredential?>)? onSuccess,
    dynamic Function(String)? onFailure,
  }) async {
    return firebaseApiHelper<UserCredential?>(
      config: FirebaseApiHelperConfig<UserCredential>(
        apiFunction: FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password),
        type: FirebaseApiEnum.auth,
        onFailure: onFailure,
        onSuccess: onSuccess,
      ),
    );
  }
}
