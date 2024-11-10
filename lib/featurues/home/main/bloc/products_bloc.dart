import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hackathon_app/featurues/home/main/repository/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProductsEvent>(getProductsEvent);
  }

  FutureOr<void> getProductsEvent(GetProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    final data = await ProductsRepo.getProducts();
    if (data.isNotEmpty && data[0].containsKey("error")) {
      emit(ProductsErrorState(errorMessage: data[0]["error"]));
    }
    else {
      emit(ProductsFetchedState(products: data));
    }
  }
}
