import '../../../../-core/params/home_params.dart';

class Pedido {
  final String usuario;
  final String cliente;
  final String fechaPedido;
  final List<ProductInfoForOrder> listaProductos;

  Pedido(
      {required this.usuario,
      required this.cliente,
      required this.fechaPedido,
      required this.listaProductos});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> listaProductosToMap = [];
    for (var producto in listaProductos) {
      listaProductosToMap.add({
        'Producto ${listaProductos.indexOf(producto)}': {
          'codigo': producto.codigo,
          'nombre': producto.nombre,
          'peso': producto.peso,
          'precio': producto.precio,
          'bodega': producto.bodega
        }
      });
    }
    return {
      'usuario': usuario,
      'cliente': cliente,
      'fechaPedido': fechaPedido,
      'listaProductos': listaProductosToMap
    };
  }
}
