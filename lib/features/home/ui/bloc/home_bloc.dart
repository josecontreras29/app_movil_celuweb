import 'package:app_movil/features/home/domain/usecases/get_productos_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-core/params/default_params.dart';
import '../../domain/usecases/get_clientes_usecase.dart';
import '../../domain/usecases/get_vendedor_usecase.dart';
import '../../domain/usecases/save_order_usecase.dart';
import 'bloc.dart';

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
        super(HomeLoading()) {
    on<InitEvent>(initEvent);
    on<GetInitialDataEvent>(getInitialDataEvent);
    on<GetListProductsByClient>(getListProductsByClient);
    on<SaveOrderEvent>(saveOrderEvent);
  }

  final GetVendedor _getVendedor;
  final GetClientes _getClientes;
  final GetProductos _getProductos;
  final SaveOrder _saveOrder;

  void initEvent(InitEvent event, Emitter<HomeState> emit) {}

  void getInitialDataEvent(
      GetInitialDataEvent event, Emitter<HomeState> emit) async {
    final vendedor = await _getVendedor.call(NoParams());
    final clientes = await _getClientes.call(NoParams());

    emit(HomeInitial(vendedor: vendedor, listClientes: clientes));
  }

  void getListProductsByClient(
      GetListProductsByClient event, Emitter<HomeState> emit) async {
    emit(HomeLoadingProducts());

    final listaProductos = await _getProductos.call(NoParams());
    emit(HomeLoadedProducts(
        listProductos: listaProductos, client: event.client));
  }

  void saveOrderEvent(SaveOrderEvent event, Emitter<HomeState> emit) async {
    final resultSaveOrder = await _saveOrder.call(event.pedido);
    if (resultSaveOrder.result) {
      emit(OrderSaved());
    }
  }
}
