import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_social_media/presentation/features/user/data/api/user_repository.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';

import '../../../services/firebase/auth/fir_auth_repo.dart';
import '../../../shared/network/data_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnAuthenticatedState()) {
    on<AuthLoginEvent>((event, emit) async {
      // print("Logiinnn");
      await FirAuthRepo.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
          // onFailure: (p0) {
          //   setState(() {
          //     feedbackType = FeedbackType.error;
          //     feedbackMessage = p0;
          //   });
          // },
          onSuccess: (p0) async {
            final id = p0.data?.user?.uid;
            final DataState<UserModel> user =
                await UserRepo.getUserAuth(id ?? "");
            emit(AuthenticatedState(
              user: user.data!,
            ));
          });
    });
    on<AuthLogoutEvent>((event, emit) {
      emit(UnAuthenticatedState());
    });
  }
}
