import 'package:app_movil/features/home/domain/entities/cliente.dart';

import '../../domain/entities/producto.dart';
import '../../domain/entities/vendedor.dart';

class HomeState {
  HomeState();
}

class HomeInitial extends HomeState {
  final Vendedor vendedor;
  final List<Cliente> listClientes;
  HomeInitial({required this.vendedor, required this.listClientes});
}

class HomeLoading extends HomeState {}

class HomeLoadingProducts extends HomeState {}

class HomeLoadedProducts extends HomeState {
  final List<Producto> listProductos;
  final String client;
  HomeLoadedProducts({required this.listProductos,required this.client});
}
