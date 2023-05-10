part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {}

class NavigateToSignUpPage extends SignInEvent {
  final BuildContext context;

  NavigateToSignUpPage({
    required this.context,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}
