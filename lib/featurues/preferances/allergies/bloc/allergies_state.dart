part of 'allergies_bloc.dart';

@immutable
sealed class AllergiesState {}

abstract class AllergiesActionState extends AllergiesState {}

final class AllergiesInitial extends AllergiesState {}

final class AllergiesLoadingState extends AllergiesState {}

final class AllergiesFetchingErrorState extends AllergiesState {
  final String errorMessage;

  AllergiesFetchingErrorState({required this.errorMessage});
}

final class AllergiesFetchedState extends AllergiesState {
  final List<Map<String, dynamic>> ingredients;
  final Map<String, bool> selectedPreferences;

  AllergiesFetchedState({
    required this.selectedPreferences, required this.ingredients});
}
