import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hackathon_app/featurues/auth/log_in/repository/auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LogInButtonPressedEvent>(logInButtonPressedEvent);
  }


  FutureOr<void> logInButtonPressedEvent(LogInButtonPressedEvent event, Emitter<LoginState> emit) async {
    emit(LogInLoadingState());
    final data = await AuthRepo.logIn({"username": event.email, "password": event.password});
    if (data) {
      emit(LogInSuccessState(isLoggedIn: data));
    } else {
      emit(LogInErrorState());
    }
  }
}
