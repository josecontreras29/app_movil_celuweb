import '../../../../-core/params/registration_params.dart';

class AuthEvent {
  AuthEvent();
}

class AuthInitialEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String user;
  final String password;
  AuthSignInEvent({required this.user, required this.password});
}

class AuthRegisterEvent extends AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final RegistrationDataForm registrationData;
  AuthSignUpEvent({required this.registrationData});
}

class AuthForgottenPaswordEvent extends AuthEvent {}
