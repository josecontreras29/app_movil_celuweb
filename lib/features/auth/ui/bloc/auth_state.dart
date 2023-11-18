class AuthState {
  const AuthState();
}

class LoginInitial extends AuthState {}

class Loading extends AuthState {}

class AuthDenied extends AuthState {}

class AuthPassed extends AuthState {
  String username;
  AuthPassed({required this.username});
}

class RegisterInitial extends AuthState {}

class UserRegistered extends AuthState {}

class UserNotRegistered extends AuthState {}

class UserAlreadyRegistered extends AuthState {}

class ForgottenPasswordInitial extends AuthState {}
