import '../../../../-core/params/home_params.dart';
import '../entities/cliente.dart';
import '../entities/pedido.dart';
import '../entities/producto.dart';
import '../entities/vendedor.dart';

abstract class HomeRepository {
  Future<Vendedor> getVendedor();
  Future<List<Cliente>> getClientes();
  Future<List<Producto>> getProductos();
  Future<SaveOrderResult> saveOrder(Pedido params);
}
