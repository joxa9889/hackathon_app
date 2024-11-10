part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

abstract class ProductsActionState extends ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFetchedState extends ProductsState {
  final List<Map<String, dynamic>> products;
  ProductsFetchedState({required this.products});
}

final class ProductsErrorState extends ProductsState {
  final String errorMessage;
  ProductsErrorState({required this.errorMessage});
}