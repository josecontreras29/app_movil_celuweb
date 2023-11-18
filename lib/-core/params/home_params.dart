class OrderDetail {
  final DateTime fechaPedido;
  final String cliente;
  final List<ProductInfoForOrder> listaProductos;

  OrderDetail(
      {required this.fechaPedido,
      required this.cliente,
      required this.listaProductos});
}

class ProductInfoForOrder {
  final String codigo;
  final String nombre;
  final double precio;
  final double peso;
  final String bodega;

  ProductInfoForOrder(
      {required this.codigo,
      required this.nombre,
      required this.precio,
      required this.peso,
      required this.bodega});
}
