import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/ok_button_dialog.dart';
import '../../../home/ui/views/home_view.dart';

import '../bloc/bloc.dart';
import 'views.dart';

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
                  if (state is UserRegistered) {
                    return await okButton(context, "User created");
                  }
                  if (state is UserNotRegistered) {
                    return await okButton(context, "User not created");
                  }
                  if (state is UserAlreadyRegistered) {
                    return await okButton(context,
                        "User already exist, please use a different username");
                  }
                  if (state is AuthDenied) {
                    return await okButton(context, "Incorrect credentials");
                  }
                  if (state is AuthPassed) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage(username: state.username)));
                  }
                }, builder: (context, state) {
                  if (state is LoginInitial) {
                    return const LoginView();
                  } else if (state is RegisterInitial) {
                    return const RegistrationView();
                  } else if (state is ForgottenPasswordInitial) {
                    return const ForgottenPasswordView();
                  } else if (state is Loading) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.black, strokeWidth: 6));
                  } else if (state is UserRegistered) {
                    return const LoginView();
                  } else {
                    return const LoginView();
                  }
                }))))));
  }
}
