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
        bodega: json["bodega"] ?? "NO DATA",
        codigo: json["codigo"],
        nombre: json["nombre"] ?? "NO DATA",
        fechaLabores: json["fechaLabores"] ?? "NO DATA",
        fechaConsecutivo: json["fechaConsecutivo"] ?? "NO DATA",
        consecutivo: json["consecutivo"] ?? 0,
        empresa: json["empresa"] ?? "NO DATA",
        distrito: json["distrito"] ?? "NO DATA",
        portafolio: json["portafolio"] ?? "NO DATA",
        moneda: json["moneda"] ?? "NO DATA",
        tipo: json["tipo"] ?? 0);
  }
}
