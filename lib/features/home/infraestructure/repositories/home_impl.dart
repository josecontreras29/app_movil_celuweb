import 'package:app_movil/features/home/domain/entities/cliente.dart';
import 'package:app_movil/features/home/domain/entities/pedido.dart';
import 'package:app_movil/features/home/domain/entities/producto.dart';

import '../../../../-core/params/home_params.dart';
import '../../domain/entities/vendedor.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/home_datasource.dart';

class HomeImpl implements HomeRepository {
  final HomeDataSource remoteDataSource;

  HomeImpl({required this.remoteDataSource});

  @override
  Future<Vendedor> getVendedor() async {
    try {
      return await remoteDataSource.getVendedor();
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<List<Cliente>> getClientes() async {
    try {
      return await remoteDataSource.getClientes();
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<List<Producto>> getProductos() async {
    try {
      return await remoteDataSource.getProductos();
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<SaveOrderResult> saveOrder(Pedido params) async {
    try {
      return await remoteDataSource.saveOrder(params);
    } catch (error) {
      throw error.toString();
    }
  }
}
