part of 'allergies_bloc.dart';

@immutable
sealed class AllergiesEvent {}

class GetAllergiesEvent extends AllergiesEvent {}