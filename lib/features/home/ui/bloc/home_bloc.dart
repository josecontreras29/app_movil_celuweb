import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-core/params/default_params.dart';
import '../../domain/usecases/get_clientes_usecase.dart';
import '../../domain/usecases/get_productos_usecase.dart';
import '../../domain/usecases/get_vendedor_usecase.dart';
import '../../domain/usecases/save_order_usecase.dart';
import 'home_bloc_imports.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetVendedor getVendedor,
    required GetClientes getClientes,
    required GetProductos getProductos,
    required SaveOrder saveOrder,
  })  : _getVendedor = getVendedor,
        _getClientes = getClientes,
        _getProductos = getProductos,
        _saveOrder = saveOrder,
        super(HomeLoadingState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeGetInitialDataEvent>(homeGetInitialDataEvent);
    on<HomeGetListProductsByClient>(homeGetListProductsByClient);
    on<HomeSaveOrderEvent>(homeSaveOrderEvent);
  }

  final GetVendedor _getVendedor;
  final GetClientes _getClientes;
  final GetProductos _getProductos;
  final SaveOrder _saveOrder;

  void homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {}

  void homeGetInitialDataEvent(
      HomeGetInitialDataEvent event, Emitter<HomeState> emit) async {
    final vendedor = await _getVendedor.call(NoParams());
    final clientes = await _getClientes.call(NoParams());
    emit(HomeInitialState(vendedor: vendedor, listClientes: clientes));
  }

  void homeGetListProductsByClient(
      HomeGetListProductsByClient event, Emitter<HomeState> emit) async {
    emit(HomeLoadingProductsState());
    final listaProductos = await _getProductos.call(NoParams());
    emit(HomeLoadedProductsState(
        listProductos: listaProductos, client: event.client));
  }

  void homeSaveOrderEvent(
      HomeSaveOrderEvent event, Emitter<HomeState> emit) async {
    final resultSaveOrder = await _saveOrder.call(event.pedido);
    if (resultSaveOrder.result) {
      emit(HomeOrderSavedState());
    }
  }
}
