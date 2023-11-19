import '../../../../-core/params/registration_params.dart';

class AuthEvent {
  AuthEvent();
}

class InitialEventAuth extends AuthEvent {}

class SignIn extends AuthEvent {
  final String user;
  final String password;
  SignIn({required this.user, required this.password});
}

class RegisterEvent extends AuthEvent {}

class SignUp extends AuthEvent {
  final RegistrationDataForm registrationData;
  SignUp({required this.registrationData});
}

class ForgottenPaswordEvent extends AuthEvent {}

