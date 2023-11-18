import '../../domain/entities/vendedor.dart';

class GetVendedorModel extends Vendedor {
  GetVendedorModel(
      {required super.bodega,
      required super.codigo,
      required super.nombre,
      required super.fechaLabores,
      required super.fechaConsecutivo,
      required super.consecutivo,
      required super.empresa,
      required super.distrito,
      required super.portafolio,
      required super.moneda,
      required super.tipo});

  factory GetVendedorModel.fromJson(Map<String, dynamic> json) {
    return GetVendedorModel(
        bodega: json["bodega"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        fechaLabores: json["fechaLabores"],
        fechaConsecutivo: json["fechaConsecutivo"],
        consecutivo: json["consecutivo"],
        empresa: json["empresa"],
        distrito: json["distrito"],
        portafolio: json["portafolio"],
        moneda: json["moneda"],
        tipo: json["tipo"]);
  }
}
