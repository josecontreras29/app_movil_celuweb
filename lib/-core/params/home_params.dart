

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

class SaveOrderResult {
  final bool result;

  SaveOrderResult({required this.result});

 
}
