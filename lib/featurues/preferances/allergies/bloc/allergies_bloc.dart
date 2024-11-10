import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hackathon_app/featurues/preferances/allergies/repositories/allergies_repo.dart';
import 'package:meta/meta.dart';

part 'allergies_event.dart';
part 'allergies_state.dart';

class AllergiesBloc extends Bloc<AllergiesEvent, AllergiesState> {
  AllergiesBloc() : super(AllergiesInitial()) {
    on<GetAllergiesEvent>(getAllergiesEvent);
  }

  FutureOr<void> getAllergiesEvent(GetAllergiesEvent event, Emitter<AllergiesState> emit) async {
    Map<String, bool> selectedPreferences = {};
    emit(AllergiesLoadingState());
    List<Map<String, dynamic>> data = await IngredientsRepository.getIngredients();
    if (data.isNotEmpty && data[0].containsKey("error")) {
      emit(AllergiesFetchingErrorState(errorMessage: data[0]["error"]));
    }
    else {
      for (var preference in data) {
        selectedPreferences[preference["name"].toString()] = false;
      }
      print(selectedPreferences);
      emit(AllergiesFetchedState(
        ingredients: data,
        selectedPreferences: selectedPreferences
      ));
    }
  }
}
