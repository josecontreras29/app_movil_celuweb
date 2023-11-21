 import 'package:shared_preferences/shared_preferences.dart';

import '../../../../-core/datasources/sqlite.dart';
import '../../domain/entities/pedido.dart';
import '../models/get_cliente_model.dart';
import '../models/get_producto_model.dart';
import '../models/get_vendedor_model.dart';
import '../models/save_order_model.dart';

abstract class HomeDataSource {
  Future<GetVendedorModel> getVendedor();
  Future<List<GetClienteModel>> getClientes();
  Future<List<GetProductoModel>> getProductos();
  Future<SaveOrderModel> saveOrder(Pedido params);
}

class HomeDataSourceImpl implements HomeDataSource {
  final ClientSQLite client;
  final SharedPreferences sharedPreferences;

  HomeDataSourceImpl({required this.client, required this.sharedPreferences});
  @override
  Future<GetVendedorModel> getVendedor() async {
    final db = await client.database;
    final user = sharedPreferences.getString("username");
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

  @override
  Future<SaveOrderModel> saveOrder(Pedido params) async {
    final db = await client.database;
    try {
      final response = await db.rawQuery(
          """INSERT INTO 'Pedidos' ('usuario','cliente','fechaPedido','listaProductos')
      VALUES('${params.usuario}','${params.cliente}','${params.fechaPedido}','${params.toJson()["listaProductos"]}');
      """);

      return SaveOrderModel.fromJson({"result": response.isEmpty});
    } catch (error) {
      throw Exception("$error");
    }
  }
}
