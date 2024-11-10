part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class LogInButtonPressedEvent extends LoginEvent {
  final String email;
  final String password;

  LogInButtonPressedEvent({required this.email, required this.password});
}