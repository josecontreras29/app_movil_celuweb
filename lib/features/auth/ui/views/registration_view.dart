import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-core/params/registration_params.dart';
import '../bloc/bloc.dart';
import '../reusable_widgets/background_login.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmpresa = TextEditingController();

  late AuthBloc authBloc = context.read<AuthBloc>();
  final _formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: BackgroundLogin(
          child: Form(
        key: _formField,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("Registration form",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700]!)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: "usuario"),
              style: const TextStyle(fontSize: 14),
              controller: controllerUsuario,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Por favor ingresa un usuario";
                }

                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "password"),
              style: const TextStyle(fontSize: 14),
              controller: controllerPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Por favor ingresa un password";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "empresa"),
              style: const TextStyle(fontSize: 14),
              controller: controllerEmpresa,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Por favor ingresa una empresa";
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () async {
                if (_formField.currentState!.validate()) {
                  authBloc.add(SignUp(
                      registrationData: RegistrationDataForm(
                          usuario: controllerUsuario.text,
                          password: controllerPassword.text,
                          empresa: controllerEmpresa.text)));
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text("Already have an user?  ",
                    textAlign: TextAlign.center),
                RichText(
                    text: TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Colors.blue[700]!,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("asddas");
                            authBloc.add(InitialEventAuth());
                          }))
              ],
            ),
          )
        ]),
      )),
    );
  }
}
