import '../entities/cliente.dart';
import '../entities/producto.dart';
import '../entities/vendedor.dart';

abstract class HomeRepository {
  Future<Vendedor> getVendedor();
  Future<List<Cliente>> getClientes();
  Future<List<Producto>> getProductos();
}
