import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/ok_button_dialog.dart';
import '../../../home/ui/bloc/home_bloc_imports.dart';
import '../../../home/ui/views/home_view.dart';
import 'views.dart';
import '../bloc/auth_bloc_imports.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(color: Colors.blueAccent[600]),
                child: Center(
                    child: SingleChildScrollView(
                        child: BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) async {
                  if (state is AuthUserRegisteredState) {
                    return await okButton(context, "User created");
                  }
                  if (state is AuthUserNotRegisteredState) {
                    return await okButton(context, "User not created");
                  }
                  if (state is AuthUserAlreadyRegisteredState) {
                    return await okButton(context,
                        "User already exist, please use a different username");
                  }
                  if (state is AuthDeniedState) {
                    return await okButton(context, "Incorrect credentials");
                  }
                  if (state is AuthPassedState) {
                    context.read<HomeBloc>().add(HomeGetInitialDataEvent());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                }, builder: (context, state) {
                  if (state is AuthLoginInitialState) {
                    return const LoginView();
                  } else if (state is AuthRegisterInitialState) {
                    return const RegistrationView();
                  } else if (state is AuthForgottenPasswordInitialState) {
                    return const ForgottenPasswordView();
                  } else if (state is AuthLoadingState) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.black, strokeWidth: 6));
                  } else if (state is AuthUserRegisteredState) {
                    return const LoginView();
                  } else {
                    return const LoginView();
                  }
                }))))));
  }
}
