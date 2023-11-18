import 'package:flutter/material.dart';

import '../../domain/entities/cliente.dart';

class DropDownClients extends StatefulWidget {
  const DropDownClients(
      {super.key, required this.listClients, required this.action});

  final List<Cliente> listClients;
  final Function(String) action;
  @override
  State<DropDownClients> createState() => _DropDownClientsState();
}

class _DropDownClientsState extends State<DropDownClients> {
  List<DropdownMenuItem> dropdownListClients = [];
  late String dropdownValue;
  List<DropdownMenuItem> _createItemsDropDown() {
    dropdownListClients.add(
        const DropdownMenuItem(value: "Select...", child: Text("Select...")));
    for (var cliente in widget.listClients) {
      dropdownListClients.add(DropdownMenuItem(
          value: cliente.nombre,
          child: Text(cliente.nombre,
              style: const TextStyle(color: Colors.black))));
    }
    dropdownValue = dropdownListClients[0].value;
    return dropdownListClients;
  }

  @override
  void initState() {
    _createItemsDropDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100]!,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.grey[700]!, spreadRadius: 0, blurRadius: 1)
          ]),
      child: DropdownButton(
          menuMaxHeight: 300,
          dropdownColor: Colors.grey[100],
          borderRadius: BorderRadius.circular(5),
          items: dropdownListClients,
          isDense: true,
          value: dropdownValue,
          underline: const SizedBox(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          onChanged: (value) async {
            if (dropdownValue != value) {
              if (dropdownListClients[0].value == "Select..." &&
                  dropdownValue != value) {
                dropdownListClients.remove(dropdownListClients[0]);
              }
              dropdownValue = value;
              await widget.action(dropdownValue);
              setState(() {});
            }
          }),
    );
  }
}
