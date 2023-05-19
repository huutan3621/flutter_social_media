import 'package:flutter_social_media/presentation/features/user/data/api/user_api.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';
import 'package:flutter_social_media/services/firebase/fir_api_helper.dart';
import 'package:flutter_social_media/shared/network/data_state.dart';

class UserRepo {
  UserRepo();

  static Future<DataState<void>> getUserData(
      String id, void Function(UserModel user) onSuccess) async {
    final FirebaseApiHelperConfig<void> config = FirebaseApiHelperConfig<void>(
      apiFunction: UserApi.getInforUser(id, onSuccess),
      type: FirebaseApiEnum.auth,
    );

    final DataState<void> response =
        await firebaseApiHelper<void>(config: config);

    if (response is DataSuccess<UserModel?> && response.data != null) {
      return DataSuccess<UserModel>(data: response.data!, originResponse: null);
    }

    return DataFailed();
  }

  static Future<DataState<void>> updateUserData(
      {required UserModel userModel,
      required String id,
      required void Function(bool result) onSuccess}) async {
    final FirebaseApiHelperConfig<void> config = FirebaseApiHelperConfig<void>(
      apiFunction: UserApi.updateUser(
          userModel: userModel, userId: id, onSuccess: onSuccess),
      type: FirebaseApiEnum.auth,
    );

    final DataState<void> response =
        await firebaseApiHelper<void>(config: config);

    if (response is DataSuccess<UserModel?> && response.data != null) {
      return DataSuccess<UserModel>(data: response.data!, originResponse: null);
    }

    return DataFailed();
  }

  static Future<DataState<UserModel>> getUserAuth(String id) async {
    final FirebaseApiHelperConfig<UserModel?> config =
        FirebaseApiHelperConfig<UserModel?>(
      apiFunction: UserApi.getAuthUser(id),
      type: FirebaseApiEnum.auth,
    );

    final DataState<void> response =
        await firebaseApiHelper<UserModel?>(config: config);

    if (response is DataSuccess<UserModel?> && response.data != null) {
      return DataSuccess<UserModel>(data: response.data!, originResponse: null);
    }

    return DataFailed();
  }
}
