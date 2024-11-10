part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class RegistrationButtonClickedEvent extends RegistrationEvent {
  final Map<String, dynamic> sendData;

  RegistrationButtonClickedEvent({required this.sendData});
}
