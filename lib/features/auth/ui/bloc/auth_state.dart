class AuthState {
  const AuthState();
}

class AuthLoginInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthDeniedState extends AuthState {}

class AuthPassedState extends AuthState {
  String username;
  AuthPassedState({required this.username});
}

class AuthRegisterInitialState extends AuthState {}

class AuthUserRegisteredState extends AuthState {}

class AuthUserNotRegisteredState extends AuthState {}

class AuthUserAlreadyRegisteredState extends AuthState {}

class AuthForgottenPasswordInitialState extends AuthState {}
