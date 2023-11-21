import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../-core/params/login_params.dart';
import '../../../../-core/params/registration_params.dart';
import '../../domain/usecases/validate_user_usecase.dart';
import '../../domain/usecases/registration_user_usecase.dart';
import '../../domain/usecases/verify_user_usecase.dart';
import 'auth_bloc_imports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {required ValidateUser validateUser,
      required RegistrationUser registrationUser,
      required VerifyUser verifyUser})
      : _validateUser = validateUser,
        _registrationUser = registrationUser,
        _verifyuser = verifyUser,
        super(AuthLoginInitialState()) {
    on<AuthInitialEvent>(authInitialEvent);
    on<AuthRegisterEvent>(authRegisterEvent);
    on<AuthForgottenPaswordEvent>(authForgottenPaswordEvent);
    on<AuthSignInEvent>(authSignInEvent);
    on<AuthSignUpEvent>(authSignUpEvent);
  }
  final ValidateUser _validateUser;
  final RegistrationUser _registrationUser;
  final VerifyUser _verifyuser;

  void authInitialEvent(AuthInitialEvent event, Emitter<AuthState> emit) {
    emit(AuthLoginInitialState());
  }

  void authRegisterEvent(AuthRegisterEvent event, Emitter<AuthState> emit) {
    emit(AuthRegisterInitialState());
  }

  void authForgottenPaswordEvent(
      AuthForgottenPaswordEvent event, Emitter<AuthState> emit) {
    emit(AuthForgottenPasswordInitialState());
  }

  void authSignInEvent(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await _validateUser
        .call(LoginParams(user: event.user, password: event.password));
    emit(AuthPassedState(username: event.user));
  }

  void authSignUpEvent(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final verifyUserRegistered = await _verifyuser
        .call(UserData(usuario: event.registrationData.usuario));
    if (verifyUserRegistered.registered) {
      emit(AuthUserAlreadyRegisteredState());
      emit(AuthRegisterInitialState());
    } else {
      final resultRegister = await _registrationUser.call(RegistrationDataForm(
          usuario: event.registrationData.usuario,
          password: event.registrationData.password,
          empresa: event.registrationData.empresa));
      if (resultRegister.created) {
        emit(AuthUserRegisteredState());
      } else {
        emit(AuthUserNotRegisteredState());
      }
    }
  }
}
