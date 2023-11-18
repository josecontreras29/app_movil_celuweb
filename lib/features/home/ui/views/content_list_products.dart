import 'package:app_movil/-core/params/home_params.dart';
import 'package:app_movil/widgets/ok_button_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-config/themes/title_themes.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/cell_table_products.dart';
import '../reusable_widgets/checkbutton_table_products.dart';
import '../reusable_widgets/title_table_products.dart';

class ContentListProducts extends StatelessWidget {
  ContentListProducts({super.key});
  final ScrollController controller = ScrollController();
  final List<ProductInfoForOrder> listValuesSelected = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous is HomeInitial || previous is HomeLoadingProducts,
      builder: (context, state) {
        if (state is HomeLoadingProducts) {
          return const CircularProgressIndicator();
        } else if (state is HomeLoadedProducts) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text("Productos", style: TitleThemes.titlesHome)),
                Scrollbar(
                  thumbVisibility: true,
                  controller: controller,
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: SingleChildScrollView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 3100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                            TitleTableProducts(width: 100, value: "Selected"),
                            TitleTableProducts(width: 100, value: "Codigo"),
                            TitleTableProducts(width: 160, value: "Nombre"),
                            TitleTableProducts(width: 80, value: "Precio"),
                            TitleTableProducts(
                                width: 70, value: "Unidadmedida"),
                            TitleTableProducts(width: 80, value: "Linea"),
                            TitleTableProducts(width: 80, value: "Marca"),
                            TitleTableProducts(width: 100, value: "Categoria"),
                            TitleTableProducts(width: 100, value: "Agrupacion"),
                            TitleTableProducts(width: 80, value: "Vendedor"),
                            TitleTableProducts(width: 80, value: "Marcadd"),
                            TitleTableProducts(
                                width: 120, value: "Lineaproduccion"),
                            TitleTableProducts(width: 160, value: "Ean"),
                            TitleTableProducts(
                                width: 120, value: "Unidadesxcaja"),
                            TitleTableProducts(width: 120, value: "Archivo"),
                            TitleTableProducts(width: 70, value: "Saldo"),
                            TitleTableProducts(width: 80, value: "Grupo"),
                            TitleTableProducts(width: 70, value: "IVA"),
                            TitleTableProducts(width: 90, value: "Bodega"),
                            TitleTableProducts(width: 160, value: "Itf"),
                            TitleTableProducts(width: 170, value: "Unidades"),
                            TitleTableProducts(
                                width: 120, value: "Subcategoria"),
                            TitleTableProducts(width: 70, value: "Core"),
                            TitleTableProducts(width: 100, value: "Portafolio"),
                            TitleTableProducts(width: 80, value: "GM4"),
                            TitleTableProducts(width: 100, value: "Sublinea"),
                            TitleTableProducts(
                                width: 100, value: "PagaPastilla"),
                            TitleTableProducts(width: 70, value: "Clave"),
                            TitleTableProducts(width: 80, value: "Peso"),
                            TitleTableProducts(width: 70, value: "CenExt2"),
                            TitleTableProducts(width: 70, value: "Sector")
                          ]),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: state.listProductos.length,
                              itemBuilder: (context, index) {
                                return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SelectProductCheckButton(action: (value) {
                                        if (value) {
                                          listValuesSelected.add(
                                              ProductInfoForOrder(
                                                  codigo: state
                                                      .listProductos[index]
                                                      .codigo,
                                                  nombre: state
                                                      .listProductos[index]
                                                      .nombre,
                                                  precio: state
                                                      .listProductos[index]
                                                      .precio,
                                                  peso: state
                                                      .listProductos[index]
                                                      .peso,
                                                  bodega: state
                                                      .listProductos[index]
                                                      .bodega));
                                        } else {
                                          listValuesSelected.removeWhere(
                                              (product) =>
                                                  product.codigo ==
                                                  state.listProductos[index]
                                                      .codigo);
                                        }
                                      }),
                                      CellTableProducts(
                                          width: 100,
                                          value: state
                                              .listProductos[index].codigo),
                                      CellTableProducts(
                                          width: 160,
                                          value: state
                                              .listProductos[index].nombre),
                                      CellTableProducts(
                                          width: 80,
                                          value: state
                                              .listProductos[index].precio
                                              .toString()),
                                      CellTableProducts(
                                          width: 70,
                                          value: state.listProductos[index]
                                              .unidadmedida),
                                      CellTableProducts(
                                          width: 80,
                                          value:
                                              state.listProductos[index].linea),
                                      CellTableProducts(
                                          width: 80,
                                          value:
                                              state.listProductos[index].marca),
                                      CellTableProducts(
                                          width: 100,
                                          value: state
                                              .listProductos[index].categoria),
                                      CellTableProducts(
                                          width: 100,
                                          value: state
                                              .listProductos[index].agrupacion),
                                      CellTableProducts(
                                          width: 80,
                                          value: state
                                              .listProductos[index].vendedor),
                                      CellTableProducts(
                                          width: 80,
                                          value: state
                                              .listProductos[index].marcadd),
                                      CellTableProducts(
                                          width: 120,
                                          value: state.listProductos[index]
                                              .lineaproduccion),
                                      CellTableProducts(
                                          width: 160,
                                          value:
                                              state.listProductos[index].ean),
                                      CellTableProducts(
                                          width: 120,
                                          value: state.listProductos[index]
                                              .unidadesxcaja),
                                      CellTableProducts(
                                          width: 120,
                                          value: state
                                              .listProductos[index].archivo),
                                      CellTableProducts(
                                          width: 70,
                                          value: state
                                              .listProductos[index].saldo
                                              .toString()),
                                      CellTableProducts(
                                          width: 80,
                                          value:
                                              state.listProductos[index].grupo),
                                      CellTableProducts(
                                          width: 70,
                                          value: state.listProductos[index].iva
                                              .toString()),
                                      CellTableProducts(
                                          width: 90,
                                          value: state
                                              .listProductos[index].bodega),
                                      CellTableProducts(
                                          width: 160,
                                          value:
                                              state.listProductos[index].itf),
                                      CellTableProducts(
                                          width: 170,
                                          value: state
                                              .listProductos[index].unidades),
                                      CellTableProducts(
                                          width: 120,
                                          value: state.listProductos[index]
                                              .subcategoria),
                                      CellTableProducts(
                                          width: 70,
                                          value:
                                              state.listProductos[index].core),
                                      CellTableProducts(
                                          width: 100,
                                          value: state
                                              .listProductos[index].portafolio),
                                      CellTableProducts(
                                          width: 80,
                                          value:
                                              state.listProductos[index].gm4),
                                      CellTableProducts(
                                          width: 100,
                                          value: state
                                              .listProductos[index].sublinea),
                                      CellTableProducts(
                                          width: 100,
                                          value: state.listProductos[index]
                                              .pagaPastilla),
                                      CellTableProducts(
                                          width: 70,
                                          value:
                                              state.listProductos[index].clave),
                                      CellTableProducts(
                                          width: 80,
                                          value: state.listProductos[index].peso
                                              .toString()),
                                      CellTableProducts(
                                          width: 70,
                                          value: state
                                              .listProductos[index].cenExt2),
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          width: 70,
                                          child: Text(state
                                              .listProductos[index].sector))
                                    ]);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        if (listValuesSelected.isEmpty) {
                          okButton(
                              context, "Please select at least one product");
                        } else {
                          OrderDetail order = OrderDetail(
                              fechaPedido: DateTime.now(),
                              cliente: state.client,
                              listaProductos: listValuesSelected);
                          print([
                            order.cliente,
                            order.fechaPedido,
                            order.listaProductos
                          ]);
                        }
                      },
                      child: const Text("Guardar pedido")),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
