import '../../domain/entities/cliente.dart';
import '../../domain/entities/producto.dart';
import '../../domain/entities/vendedor.dart';

class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  final Vendedor vendedor;
  final List<Cliente> listClientes;
  HomeInitialState({required this.vendedor, required this.listClientes});
}

class HomeLoadingState extends HomeState {}

class HomeLoadingProductsState extends HomeState {}

class HomeLoadedProductsState extends HomeState {
  final List<Producto> listProductos;
  final String client;
  HomeLoadedProductsState({required this.listProductos, required this.client});
}

class HomeOrderSavedState extends HomeState {}
