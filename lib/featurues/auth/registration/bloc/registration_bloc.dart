import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hackathon_app/featurues/auth/registration/repository/register_repo.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationButtonClickedEvent>(registrationButtonClickedEvent);
  }

  FutureOr<void> registrationButtonClickedEvent(RegistrationButtonClickedEvent event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoadingState());
    var data = await RegistrationRepo.register(event.sendData); 
    if (data == 'success') {
      emit(RegistrationSuccessState()); 
    } else {
      emit(RegistrationErrorState(errorMessage: data));
    }
  }
}
