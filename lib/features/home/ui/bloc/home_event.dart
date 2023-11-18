class HomeEvent {
  HomeEvent();
}

class GetInitialDataEvent extends HomeEvent {}

class GetListProductsByClient extends HomeEvent {
  final String client;
  GetListProductsByClient({required this.client});
}

class SaveOrder extends HomeEvent {}
