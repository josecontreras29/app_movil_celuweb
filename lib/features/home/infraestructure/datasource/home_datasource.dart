import 'package:app_movil/features/home/infraestructure/models/get_producto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../-core/datasources/sqlite.dart';
import '../models/get_cliente_model.dart';
import '../models/get_vendedor_model.dart';

abstract class HomeDataSource {
  Future<GetVendedorModel> getVendedor();
  Future<List<GetClienteModel>> getClientes();
  Future<List<GetProductoModel>> getProductos();
}

class HomeDataSourceImpl implements HomeDataSource {
  final ClientSQLite client;
  final SharedPreferences sharedPreferences;

  HomeDataSourceImpl({required this.client, required this.sharedPreferences});
  @override
  Future<GetVendedorModel> getVendedor() async {
    final user = sharedPreferences.getString("username");
    final db = await client.database;
    try {
      final response = await db
          .rawQuery("SELECT * FROM Vendedor where codigo LIKE '%$user%'");
      return GetVendedorModel.fromJson(response[0]);
    } catch (error) {
      throw Exception("$error");
    }
  }

  @override
  Future<List<GetClienteModel>> getClientes() async {
    final db = await client.database;
    try {
      final response = await db.rawQuery(
          "SELECT [Codigo],[Nombre],[Razonsocial],[Nit] FROM Clientes");
      List<GetClienteModel> listClientes = [];

      for (var item in response) {
        final client = GetClienteModel.fromJson(item);
        listClientes.add(client);
      }
      return listClientes;
    } catch (error) {
      throw Exception("$error");
    }
  }

  @override
  Future<List<GetProductoModel>> getProductos() async {
    final db = await client.database;
    try {
      final response = await db.rawQuery("SELECT * FROM ProductosCatalogo");
      List<GetProductoModel> listProductos = [];
      for (var item in response) {
        final producto = GetProductoModel.fromJson(item);
        listProductos.add(producto);
      }
      return listProductos;
    } catch (error) {
      throw Exception("$error");
    }
  }
}
