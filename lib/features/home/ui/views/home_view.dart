import 'package:app_movil/features/home/domain/entities/cliente.dart';
import 'package:app_movil/widgets/ok_button_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../-config/themes/title_themes.dart';
import '../../../../injection_container.dart';
import '../../../../widgets/appbar_default.dart';
import '../../domain/entities/vendedor.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/background_home.dart';
import '../reusable_widgets/dropdown_clients.dart';
import '../reusable_widgets/vendedor_item_default.dart';
import 'content_list_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPreferences>();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarDefault(username: prefs.getString("username")!)),
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) async {
                  if (state is OrderSaved) {
                    await okButton(context, "Order saved succesfully");
                  }
                },
                buildWhen: (previous, current) =>
                    current is HomeInitial || current is HomeLoading,
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return HomeView(
                        dataVendedor: state.vendedor,
                        listClients: state.listClientes);
                  } else if (state is HomeLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.black, strokeWidth: 6));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView(
      {super.key, required this.dataVendedor, required this.listClients});
  final Vendedor dataVendedor;
  final List<Cliente> listClients;

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = context.read<HomeBloc>();
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 30,
            runSpacing: 30,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Informacion personal',
                      style: TitleThemes.titlesHome,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  BackgroundHome(
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.start,
                            children: [
                              VendedorItemDefault(
                                  title: "Bodega: ",
                                  value: dataVendedor.bodega),
                              VendedorItemDefault(
                                  title: "Código: ",
                                  value: dataVendedor.codigo),
                              VendedorItemDefault(
                                  title: "Nombre: ",
                                  value: dataVendedor.nombre),
                              VendedorItemDefault(
                                  title: "Fecha labores: ",
                                  value: dataVendedor.fechaLabores),
                              VendedorItemDefault(
                                  title: "Fecha consecutivo: ",
                                  value: dataVendedor.fechaConsecutivo),
                              VendedorItemDefault(
                                  title: "Consecutivo: ",
                                  value: dataVendedor.consecutivo.toString()),
                              VendedorItemDefault(
                                  title: "Distrito: ",
                                  value: dataVendedor.distrito),
                              VendedorItemDefault(
                                  title: "Empresa: ",
                                  value: dataVendedor.empresa),
                              VendedorItemDefault(
                                  title: "Moneda: ",
                                  value: dataVendedor.moneda),
                              Wrap(children: [
                                const Text("Portafolio: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(dataVendedor.portafolio)
                              ]),
                            ])),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Clientes',
                      style: TitleThemes.titlesHome,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  DropDownClients(
                      listClients: listClients,
                      action: (client) => homeBloc
                          .add(GetListProductsByClient(client: client))),
                ],
              ),
            ],
          ),
          ContentListProducts()
        ],
      ),
    );
  }
}
