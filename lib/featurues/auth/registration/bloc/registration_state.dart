part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoadingState extends RegistrationState {}

final class RegistrationSuccessState extends RegistrationState {}

final class RegistrationErrorState extends RegistrationState {
  final String errorMessage;

  RegistrationErrorState({required this.errorMessage});
}