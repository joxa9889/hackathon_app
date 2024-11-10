part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LogInLoadingState extends LoginState {}

final class LogInErrorState extends LoginState {}

final class LogInSuccessState extends LoginState {
  final bool isLoggedIn;

  LogInSuccessState({required this.isLoggedIn});
}