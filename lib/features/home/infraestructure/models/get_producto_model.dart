import '../../domain/entities/producto.dart';

class GetProductoModel extends Producto {
  GetProductoModel(
      {required super.codigo,
      required super.nombre,
      required super.precio,
      required super.unidadmedida,
      required super.linea,
      required super.marca,
      required super.categoria,
      required super.agrupacion,
      required super.vendedor,
      required super.marcadd,
      required super.lineaproduccion,
      required super.ean,
      required super.unidadesxcaja,
      required super.archivo,
      required super.saldo,
      required super.grupo,
      required super.iva,
      required super.bodega,
      required super.itf,
      required super.unidades,
      required super.subcategoria,
      required super.core,
      required super.portafolio,
      required super.gm4,
      required super.sublinea,
      required super.pagaPastilla,
      required super.clave,
      required super.peso,
      required super.cenExt2,
      required super.sector});

  factory GetProductoModel.fromJson(Map<String, dynamic> json) {
    return GetProductoModel(
        codigo: json["Codigo"],
        nombre: json["Nombre"],
        precio: json["Precio"],
        unidadmedida: json["Unidadmedida"],
        linea: json["Linea"],
        marca: json["Marca"],
        categoria: json["Categoria"],
        agrupacion: json["Agrupacion"],
        vendedor: json["Vendedor"],
        marcadd: json["marcadd"],
        lineaproduccion: json["Lineaproduccion"],
        ean: json["Ean"],
        unidadesxcaja: json["Unidadesxcaja"],
        archivo: json["Archivo"],
        saldo: json["Saldo"],
        grupo: json["Grupo"],
        iva: json["Iva"],
        bodega: json["Bodega"],
        itf: json["Itf"],
        unidades: json["Unidades"],
        subcategoria: json["Subcategoria"],
        core: json["Core"] ?? "null",
        portafolio: json["Portafolio"],
        gm4: json["GM4"],
        sublinea: json["Sublinea"],
        pagaPastilla: json["Paga_pastilla"],
        clave: json["Clave"] ?? "null",
        peso: json["Peso"],
        cenExt2: json["Cen_ext2"],
        sector: json["Sector"]);
  }
}

// GetProductoModel(
//       codigo: json["Codigo"] ?? "NO DATA",
//       nombre: json["Nombre"] ?? "NO DATA",
//       razonSocial: json["Razonsocial"] ?? "NO DATA",
//       nit: json["Nit"] ?? "NO DATA",
//     );