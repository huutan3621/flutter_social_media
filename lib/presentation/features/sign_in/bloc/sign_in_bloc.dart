import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/sign_up/sign_up_page.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<NavigateToSignUpPage>((event, emit) {
      Navigator.of(event.context).push(
        MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        ),
      );
    });
  }
}
