import 'package:app_movil/features/home/domain/entities/cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-config/themes/title_themes.dart';
import '../../../../widgets/appbar_default.dart';
import '../../domain/entities/vendedor.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/background_home.dart';
import '../reusable_widgets/dropdown_clients.dart';
import '../reusable_widgets/vendedor_item_default.dart';
import 'content_list_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarDefault(username: username)),
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    current is! HomeLoadingProducts &&
                    current is! HomeLoadedProducts,
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

class HomeView extends StatefulWidget {
  const HomeView(
      {super.key, required this.dataVendedor, required this.listClients});
  final Vendedor dataVendedor;
  final List<Cliente> listClients;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();
    homeBloc.add(GetInitialDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                  value: widget.dataVendedor.bodega),
                              VendedorItemDefault(
                                  title: "Código: ",
                                  value: widget.dataVendedor.codigo),
                              VendedorItemDefault(
                                  title: "Nombre: ",
                                  value: widget.dataVendedor.nombre),
                              VendedorItemDefault(
                                  title: "Fecha labores: ",
                                  value: widget.dataVendedor.fechaLabores),
                              VendedorItemDefault(
                                  title: "Fecha consecutivo: ",
                                  value: widget.dataVendedor.fechaConsecutivo),
                              VendedorItemDefault(
                                  title: "Consecutivo: ",
                                  value: widget.dataVendedor.consecutivo
                                      .toString()),
                              VendedorItemDefault(
                                  title: "Distrito: ",
                                  value: widget.dataVendedor.distrito),
                              VendedorItemDefault(
                                  title: "Empresa: ",
                                  value: widget.dataVendedor.empresa),
                              VendedorItemDefault(
                                  title: "Moneda: ",
                                  value: widget.dataVendedor.moneda),
                              Wrap(children: [
                                const Text("Portafolio: ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(widget.dataVendedor.portafolio)
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
                      listClients: widget.listClients,
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
