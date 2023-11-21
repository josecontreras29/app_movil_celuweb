import '../../domain/entities/pedido.dart';

class HomeEvent {
  HomeEvent();
}

class HomeInitialEvent extends HomeEvent {}

class HomeGetInitialDataEvent extends HomeEvent {}

class HomeGetListProductsByClient extends HomeEvent {
  final String client;
  HomeGetListProductsByClient({required this.client});
}

class HomeSaveOrderEvent extends HomeEvent {
  final Pedido pedido;
  HomeSaveOrderEvent({required this.pedido});
}
