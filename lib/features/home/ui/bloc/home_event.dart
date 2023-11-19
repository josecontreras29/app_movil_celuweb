import '../../domain/entities/pedido.dart';

class HomeEvent {
  HomeEvent();
}

class InitEvent extends HomeEvent {}

class GetInitialDataEvent extends HomeEvent {}

class GetListProductsByClient extends HomeEvent {
  final String client;
  GetListProductsByClient({required this.client});
}

class SaveOrderEvent extends HomeEvent {
  final Pedido pedido;
  SaveOrderEvent({required this.pedido});
}
