import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-core/params/login_params.dart';

import '../../../../-core/params/registration_params.dart';
import '../../domain/usecases/validate_user.dart';
import '../../domain/usecases/registration_user.dart';

import '../../domain/usecases/verify_user.dart';
import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {required ValidateUser validateUser,
      required RegistrationUser registrationUser,
      required VerifyUser verifyUser})
      : _validateUser = validateUser,
        _registrationUser = registrationUser,
        _verifyuser = verifyUser,
        super(LoginInitial()) {
    on<InitialEventAuth>(initialEvent);
    on<RegisterEvent>(registerEvent);
    on<ForgottenPaswordEvent>(forgottenPaswordEvent);
    on<SignIn>(signIn);
    on<SignUp>(signUp);
  }
  final ValidateUser _validateUser;
  final RegistrationUser _registrationUser;
  final VerifyUser _verifyuser;

  void initialEvent(InitialEventAuth event, Emitter<AuthState> emit) {}

  void registerEvent(RegisterEvent event, Emitter<AuthState> emit) {
    emit(RegisterInitial());
  }

  void forgottenPaswordEvent(
      ForgottenPaswordEvent event, Emitter<AuthState> emit) {
    emit(ForgottenPasswordInitial());
  }

  void signIn(SignIn event, Emitter<AuthState> emit) async {
    emit(Loading());

    await _validateUser
        .call(LoginParams(user: event.user, password: event.password));
    emit(AuthPassed(username: event.user));
  }

  void signUp(SignUp event, Emitter<AuthState> emit) async {
    emit(Loading());
    final verifyUserRegistered = await _verifyuser
        .call(UserData(usuario: event.registrationData.usuario));
    if (verifyUserRegistered.registered) {
      emit(UserAlreadyRegistered());
      emit(RegisterInitial());
    } else {
      final resultRegister = await _registrationUser.call(RegistrationDataForm(
          usuario: event.registrationData.usuario,
          password: event.registrationData.password,
          empresa: event.registrationData.empresa));
      if (resultRegister.created) {
        emit(UserRegistered());
      } else {
        emit(UserNotRegistered());
      }
    }
  }
}
