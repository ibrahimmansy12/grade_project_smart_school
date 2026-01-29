// feature/login/logic/login_state.dart
part of 'login_cubit.dart';

/// Plain (non-freezed) states for `LoginCubit`.
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess({required this.message, required this.token});

  final String message;
  final String token;
}

class LoginFailure extends LoginState {
  LoginFailure(this.message);

  final String message;
}
