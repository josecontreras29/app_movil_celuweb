import '../../domain/entities/cliente.dart';

class GetClienteModel extends Cliente {
  GetClienteModel(
      {required super.codigo,
      required super.nombre,
      required super.razonSocial,
      required super.nit});

  factory GetClienteModel.fromJson(Map<String, dynamic> json) {
    return GetClienteModel(
      codigo: json["Codigo"] ?? "NO DATA",
      nombre: json["Nombre"] ?? "NO DATA",
      razonSocial: json["Razonsocial"] ?? "NO DATA",
      nit: json["Nit"] ?? "NO DATA",
    );
  }
}
