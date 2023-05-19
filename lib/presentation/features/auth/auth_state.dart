part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class UnAuthenticatedState extends AuthState {}

class AuthenticatedState extends AuthState {
  final UserModel user;
  const AuthenticatedState({
    required this.user,
  });
}
